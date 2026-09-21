<div align="center">

# Thibaut Melen

<samp>Captain of [SuperNovae Studio](https://github.com/supernovae-st) 🏴‍☠️ · crafting [Nika](https://nika.sh), Intent as Code · Paris 🇫🇷</samp>

<sub>[supernovae.studio](https://supernovae.studio) · [X · @ThibautMelen](https://x.com/ThibautMelen) · [LinkedIn](https://www.linkedin.com/in/ThibautMelen)</sub>

</div>

`Small crew, massive impact.` Two builders, one studio, charting our own seas: consumer products people love, and the sovereign AI infrastructure underneath that nobody can capture. *11 years of vision · 10 years of build.*

---

## 🏴‍☠️ SuperNovae Studio

<a href="https://github.com/supernovae-st"><img src="https://raw.githubusercontent.com/supernovae-st/.github/main/assets/supernovae-ship.gif" width="100%" alt="The SuperNovae ship" /></a>

- **Small crew, massive impact** · [Nicolas](https://github.com/NicolasCELLA) and me, no headcount to scale: technology is the leverage.
- **Chart your own seas** · local-first and open by default: your data, your models, no vendor owns your course.
- **The flag is a butterfly** 🦋 · liberation through open source: AGPL engine, open spec, everything portable.

**Products**

- 🦋 **[Nika](https://nika.sh)** · the flagship, below: engine · spec · VS Code · SDK · registry · CI
- 🔲 **[QRcode AI](https://qrcode-ai.com)** · artistic QR codes people actually scan · Nicolas at the helm · [the Rust scanner is open source](https://github.com/supernovae-st/qrcode-ai-scanner)
- 🌈 **[rain.bo](https://github.com/supernovae-st/rain-bo)** · Your link-in-bio. Bento-grade. With the context on top.

**Teaching & proofs**

- 🐔 **[Agentic AI Systems](https://github.com/ThibautMelen/agentic-ai-systems)** · agentic systems explained with chickens: taxonomy + runnable, CI-checked patterns · 280★+
- 🧾 **[nika-workflow-proofs](https://github.com/ThibautMelen/nika-workflow-proofs)** · runnable answers to real maintainer asks, receipts included

## 🦋 Nika · Intent as Code

**The workflow language for AI. One file, 4 verbs, one Rust binary. Local-first, any model, AGPL-3.0.**

- **Audited before it runs** · `nika check` proves the plan, the cost ceiling, the permits and the types before a single token is spent.
- **Sovereign by default** · local models are first-class (Ollama · llama.cpp · vLLM), alongside Mistral, Anthropic, OpenAI and more: 17 providers, zero lock-in.
- **Traced after** · every run leaves a hash-chained trace in `.nika/traces/`. Receipts, not vibes.

```bash
brew install supernovae-st/tap/nika
```

```yaml
nika: weekly-brief
model: ollama/qwen3:8b
const: { notes: "./notes.md" }
permits:
  fs: { read: ["./notes.md"], write: ["./brief.md"] }
  tools: ["nika:read", "nika:write"]
tasks:
  read:
    invoke: { tool: "nika:read", args: { path: "${{ const.notes }}" } }
  brief:
    with: { notes: "${{ tasks.read.output }}" }
    infer: { prompt: "3-bullet shipping brief of: ${{ with.notes }}", max_tokens: 400 }
  save:
    with: { body: "${{ tasks.brief.output }}" }
    invoke: { tool: "nika:write", args: { path: "./brief.md", content: "${{ with.body }}" } }
```

<sub>**[Site](https://nika.sh)** · **[Docs](https://docs.nika.sh)** · **[Spec](https://github.com/supernovae-st/nika-spec)** · **[VS Code](https://marketplace.visualstudio.com/items?itemName=supernovae.nika-lang)** · **[TypeScript SDK](https://www.npmjs.com/package/@supernovae-st/nika)** · **[Registry](https://github.com/supernovae-st/nika-registry)** · **[CI Action](https://github.com/supernovae-st/nika-action)**</sub>

## 🧭 How I build

- **Intent as Code** · repeatable AI work belongs in files: auditable, diffable, traceable.
- **[AGPL forever](https://github.com/supernovae-st/nika/blob/main/LICENSE)** on the engine · no proprietary tier.
- **Quality > speed** · ship when ready, semver honest.
- **Craft over hype** · the long-arc discipline of the great studios (Ghibli · Pixar · Oda).

<sub>**Stack** · Rust · TypeScript · local models first-class (Ollama · llama.cpp · vLLM) + Mistral · Anthropic · OpenAI via Nika's 17-provider catalog · Vue/Nuxt · React · Tailwind</sub>

## 📡 Recently shipped

<!-- ACTIVITY:START -->
_Latest releases:_

- **[nika-client](https://github.com/supernovae-st/nika-client/releases/tag/v0.120.3)** `v0.120.3` · 2026-09-20
- **[nika-plugins](https://github.com/supernovae-st/nika-plugins/releases/tag/v0.120.3)** `v0.120.3` · 2026-09-20
- **[nika](https://github.com/supernovae-st/nika/releases/tag/v0.120.3)** `v0.120.3` · 2026-09-20
- **[nika-action](https://github.com/supernovae-st/nika-action/releases/tag/v1.0.24)** `v1.0.24` · 2026-09-20
- **[gh-nika](https://github.com/supernovae-st/gh-nika/releases/tag/v0.2.0)** `v0.2.0` · 2026-09-18
- **[nika-vscode](https://github.com/supernovae-st/nika-vscode/releases/tag/v0.109.2)** `v0.109.2` · 2026-08-19
<!-- ACTIVITY:END -->

---

**Track the work**: right here, or [@ThibautMelen on X](https://x.com/ThibautMelen). **Reach me**: X DM, or an issue on [nika](https://github.com/supernovae-st/nika/issues).

<sub>🦋 This profile is a projection: identity lives in one YAML file, rendered deterministically, audited by [`nika check`](https://nika.sh), refreshed weekly by CI. *Intent as Code, applied to myself.*</sub>

<!-- UPDATED:START -->
<sub><em>Last refreshed: 2026-09-21 06:52 UTC</em></sub>
<!-- UPDATED:END -->
