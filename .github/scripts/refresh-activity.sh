#!/usr/bin/env bash
# Rebuilds the <!-- ACTIVITY --> and <!-- UPDATED --> marker blocks of README.md
# from live public GitHub data. Runs in CI with the ambient GITHUB_TOKEN;
# also works locally with `gh auth`. ~3 API calls per run vs a 1,000/hr budget.
set -euo pipefail

USER_LOGIN="ThibautMelen"
ORG="supernovae-st"

splice() { # $1 = marker name · $2 = file with new content
  awk -v start="<!-- $1:START -->" -v end="<!-- $1:END -->" -v file="$2" '
    $0 == start { print; while ((getline line < file) > 0) print line; close(file); skip=1; next }
    $0 == end   { skip=0 }
    !skip
  ' README.md > README.md.new && mv README.md.new README.md
}

# 1 · latest releases across the org's public repos (GraphQL · 1 point)
gh api graphql -f org="$ORG" -f query='
query($org: String!) { organization(login: $org) {
  repositories(first: 20, privacy: PUBLIC, isFork: false,
               orderBy: {field: PUSHED_AT, direction: DESC}) {
    nodes { name latestRelease { tagName publishedAt url } } } } }' \
  --jq '[.data.organization.repositories.nodes[] | select(.latestRelease != null)]
        | sort_by(.latestRelease.publishedAt) | reverse | .[:6][]
        | "- **[\(.name)](\(.latestRelease.url))** `\(.latestRelease.tagName)` · \(.latestRelease.publishedAt[:10])"' \
  > /tmp/releases.md || echo "_(release feed unavailable this run)_" > /tmp/releases.md

# 2 · recently merged PRs upstream (public only · own orgs excluded)
gh api graphql -f q="author:$USER_LOGIN is:pr is:merged sort:updated-desc" -f query='
query($q: String!) { search(query: $q, type: ISSUE, first: 15) {
  nodes { ... on PullRequest { title url mergedAt repository { nameWithOwner isPrivate } } } } }' \
  --jq '[.data.search.nodes[]
         | select(.repository.isPrivate | not)
         | select(.repository.nameWithOwner | test("^(supernovae-st|supernovae-studio|ThibautMelen)/") | not)]
        | .[:5][]
        | "- 🔀 \(.mergedAt[:10]) · [\(.title)](\(.url)) → `\(.repository.nameWithOwner)`"' \
  > /tmp/prs.md || : > /tmp/prs.md

{
  echo "_Latest releases:_"
  echo ""
  cat /tmp/releases.md
  if [ -s /tmp/prs.md ]; then
    echo ""
    echo "_Recent upstream contributions:_"
    echo ""
    cat /tmp/prs.md
  fi
} > /tmp/activity.md
splice ACTIVITY /tmp/activity.md

# 3 · freshness stamp — guarantees a commit per run (resets the 60-day cron-disable timer)
printf '<sub><em>Last refreshed: %s UTC</em></sub>\n' "$(date -u '+%Y-%m-%d %H:%M')" > /tmp/stamp.md
splice UPDATED /tmp/stamp.md

echo "dynamic blocks rebuilt."
