# Installation

This repository supports two installation modes:

1. Install only `figma-to-flutter`
2. Install the full required stack: `figma-to-flutter` + companion skills

## Prerequisites

You need:

- A runtime that supports custom skills
- The Figma MCP connector enabled in that runtime
- Node.js and `npx` if you want to run the bundle installer
- The companion skills available if you want the full production workflow

## Companion skill links

- [`flutter-apply-architecture-best-practices`](https://skills.sh/flutter/skills/flutter-apply-architecture-best-practices)
- [`flutter-build-responsive-layout`](https://skills.sh/flutter/skills/flutter-build-responsive-layout)
- [`flutter`](https://skills.sh/mindrally/skills/flutter)

## Option A: Install only `figma-to-flutter`

Step 1. Install the skill:

```bash
npx skills add https://github.com/edicardenas/figma-to-flutter-skill --skill figma-to-flutter
```

Step 2. If you want a global Codex install without prompts, use:

```bash
npx skills add https://github.com/edicardenas/figma-to-flutter-skill --skill figma-to-flutter -a codex -g -y
```

Step 3. Restart Codex.

Important:

- This path installs only `figma-to-flutter`
- It does not install the recommended architecture companion
- It does not install the recommended layout companion
- It does not install the recommended performance fallback companion

## Option B: Install the full required stack

Use this if you want the recommended end-to-end workflow.

Step 1. Clone the repository:

```bash
git clone https://github.com/edicardenas/figma-to-flutter-skill.git
cd figma-to-flutter-skill
```

Step 2. Run the bundle installer:

```bash
./scripts/install-bundle.sh
```

Step 3. Verify that all required skills are present:

```bash
./scripts/check-bundle.sh
```

Step 4. Restart Codex.

Expected installed set:

- `figma-to-flutter`
- `flutter-apply-architecture-best-practices`
- `flutter-build-responsive-layout`
- `flutter`

See [docs/BUNDLE-INSTALL.md](BUNDLE-INSTALL.md) for implementation details.

## What the bundle installer actually does

It is intentionally explicit:

1. Copies this repository's local `figma-to-flutter` skill into your skills directory
2. Installs `flutter-apply-architecture-best-practices` from `flutter/skills`
3. Installs `flutter-build-responsive-layout` from `flutter/skills`
4. Installs `flutter` from `mindrally/skills` as the current installable fallback that includes performance guidance
5. Runs `check-bundle.sh` and fails if any required skill is missing

## Install into your local skills directory

The exact location depends on your runtime. In most Codex-style environments, install the extracted folder or packaged `.skill` where custom skills are loaded.

Recommended folder name:

```text
figma-to-flutter
```
