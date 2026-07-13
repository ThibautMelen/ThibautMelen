<div align="center">

# Thibaut Melen

**Building [Nika](https://nika.sh) — Intent as Code — and the SuperNovae galaxy around it · Paris 🇫🇷**

[supernovae.studio](https://supernovae.studio) · [X — @ThibautMelen](https://x.com/ThibautMelen) · [LinkedIn](https://www.linkedin.com/in/ThibautMelen)

</div>

`Small crew, massive impact.` I co-found **[SuperNovae Studio](https://github.com/supernovae-st)** with [Nicolas](https://github.com/NicolasCELLA) — a product-obsessed, AI-native studio in Paris where technology amplifies human leverage instead of scaling headcount. *11 years of vision · 10 years of build.*

---

## 🦋 Nika — Intent as Code

**The workflow language for AI. One file, 4 verbs, one Rust binary. Local-first, any model, AGPL-3.0.**

- **Audited before it runs** — `nika check` proves the plan, cost ceiling, permits and types before a single token is spent.
- **Sovereign by default** — local models are first-class (Ollama · llama.cpp · vLLM), alongside Mistral, Anthropic, OpenAI & more. 16 providers, zero lock-in.
- **Traced after** — every run leaves a hash-chained trace in `.nika/traces/`. Receipts, not vibes.

```bash
brew install supernovae-st/tap/nika
```

```yaml
nika: v1
workflow: weekly-brief
description: "one file · audited before it runs · traced after"
model: ollama/qwen3:8b
permits:
  fs: { read: ["./notes.md"], write: ["./brief.md"] }
  exec: false
  tools: ["nika:read", "nika:write"]
vars: { notes: "./notes.md" }
tasks:
  - id: read
    invoke: { tool: "nika:read", args: { path: "${{ vars.notes }}" } }
  - id: brief
    depends_on: [read]
    infer: { prompt: "3-bullet shipping brief of: ${{ tasks.read.output }}", max_tokens: 400 }
  - id: save
    depends_on: [brief]
    invoke: { tool: "nika:write", args: { path: "./brief.md", content: "${{ tasks.brief.output }}" } }
```

<sub>**[Site](https://nika.sh)** · **[Docs](https://docs.nika.sh)** · **[Spec](https://github.com/supernovae-st/nika-spec)** · **[VS Code](https://marketplace.visualstudio.com/items?itemName=supernovae.nika-lang)** · **[TypeScript SDK](https://www.npmjs.com/package/@supernovae-st/nika-client)** · **[Registry](https://github.com/supernovae-st/nika-registry)** · **[CI Action](https://github.com/supernovae-st/nika-action)**</sub>

## 🌌 The SuperNovae galaxy

One small crew, several products, one discipline — everything orbits **[SuperNovae Studio](https://github.com/supernovae-st)**.

**Products**

- 🦋 **[Nika](https://nika.sh)** — the flagship, above — engine · spec · VS Code · SDK · registry · CI
- 🔲 **[QRcode AI](https://qrcode-ai.com)** — artistic QR codes people actually scan · led by Nicolas · [Rust scanner is open source](https://github.com/supernovae-st/qrcode-ai-scanner)
- 🌈 **[Rain.bo](https://github.com/supernovae-st/rain.bo)** — link-in-bio, reimagined · brewing

**Teaching & proofs**

- 🐔 **[Agentic AI Systems](https://github.com/ThibautMelen/agentic-ai-systems)** — agentic systems explained with chickens — taxonomy + runnable, CI-checked patterns · 280★+
- 🧾 **[nika-workflow-proofs](https://github.com/ThibautMelen/nika-workflow-proofs)** — runnable answers to real maintainer asks — receipts included

## 🧭 How I build

- **Local-first & sovereign** — your workflows, your machine, your data. No vendor owns your state.
- **AGPL forever** on the engine — no proprietary tier, no rug-pull.
- **Intent as Code** — repeatable AI work belongs in files: auditable, diffable, traceable.
- **Quality > speed** — ship when ready, semver honest.
- **Craft over hype** — the long-arc discipline of the great studios (Ghibli · Pixar · Oda).

<sub>**Stack** · Rust · TypeScript — local models first-class (Ollama · llama.cpp · vLLM) + Mistral · Anthropic · OpenAI via Nika's 16-provider catalog — Vue/Nuxt · React · Tailwind</sub>

## 📡 Recently shipped

<!-- ACTIVITY:START -->
_Latest releases across the galaxy:_

- **[nika-action](https://github.com/supernovae-st/nika-action/releases/tag/v1.0.4)** `v1.0.4` · 2026-07-13
- **[nika](https://github.com/supernovae-st/nika/releases/tag/v0.102.0)** `v0.102.0` · 2026-07-13
- **[nika-vscode](https://github.com/supernovae-st/nika-vscode/releases/tag/v0.102.0)** `v0.102.0` · 2026-07-13
- **[nika-client](https://github.com/supernovae-st/nika-client/releases/tag/v0.102.0)** `v0.102.0` · 2026-07-13
- **[nika-agents](https://github.com/supernovae-st/nika-agents/releases/tag/v0.102.0)** `v0.102.0` · 2026-07-13
- **[nika.sh](https://github.com/supernovae-st/nika.sh/releases/tag/v4.15.0)** `v4.15.0` · 2026-07-12
<!-- ACTIVITY:END -->

---

**Track the work** — right here, or [@ThibautMelen on X](https://x.com/ThibautMelen). **Reach me** — X DM, or open an issue on [nika](https://github.com/supernovae-st/nika/issues).

<sub>🦋 This profile is a projection — identity lives in one YAML file, rendered deterministically, audited by [`nika check`](https://nika.sh), refreshed weekly by CI. *Intent as Code, applied to myself.*</sub>

<!-- UPDATED:START -->
<sub><em>Last refreshed: 2026-07-13 08:39 UTC</em></sub>
<!-- UPDATED:END -->
