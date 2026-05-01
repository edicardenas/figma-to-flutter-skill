# Installation

## Prerequisites

You need:

- A runtime that supports custom skills
- The Figma MCP connector enabled in that runtime
- The companion skills available if you want the full production workflow:
  - `flutter-architecture`
  - `flutter-layout`
  - `flutter-performance`

## Companion skill links

- [`flutter-architecture`](https://skills.sh/flutter/skills/flutter-architecture)
- [`flutter-layout`](https://skills.sh/flutter/skills/flutter-layout)
- [`flutter-performance`](https://skills.sh/flutter/skills/flutter-performance)

## Install from source

Clone the repo and package the skill:

```bash
git clone https://github.com/edicardenas/figma-to-flutter-skill.git
cd figma-to-flutter-skill
./scripts/validate-skill.sh
./scripts/build-skill.sh
```

The archive will be generated at:

```text
dist/figma-to-flutter.skill
```

## Install into your local skills directory

The exact location depends on your runtime. In most Codex-style environments, install the extracted folder or packaged `.skill` where custom skills are loaded.

Recommended folder name:

```text
figma-to-flutter
```

## Runtime expectations

This skill assumes:

- Figma specs can be read from MCP/dev mode
- The project already has a Flutter design system or widget library
- The user wants faithful visual translation, not architectural invention

If those assumptions are false, the skill should stop and report the gap instead of guessing.
