# Figma to Flutter Skill

`figma-to-flutter` is a Codex/agent skill for translating Figma frames into Flutter UI with strict design-system discipline.

It does four things especially well:

- Audits the Figma frame before coding
- Reuses existing Flutter design-system widgets instead of inventing UI
- Generates screen code plus mock-ready models
- Makes missing design-system work explicit before implementation continues

This repository contains the source skill, public documentation, and packaging scripts needed to version it openly on GitHub.

## Why this skill exists

Most Figma-to-code flows fail in predictable ways:

- They skip the design-system audit
- They invent widgets that do not exist
- They hardcode colors, spacing, and text styles
- They generate UI that looks close, but is not production-safe

This skill takes the opposite approach. It forces a structured workflow:

1. Verify the Figma MCP connection
2. Capture screenshot + dev mode specs
3. Audit which design-system components are ready, partial, or missing
4. Wait for an explicit implementation decision
5. Generate Flutter UI and backend-ready mock models

## What the skill covers

- Pixel-faithful Figma-to-Flutter translation
- Component mapping from Figma instances to Flutter DS widgets
- Token-safe spacing, colors, and typography usage
- Screen-level model generation with `mock()` and `fromJson()`
- Clear reporting of missing or partial DS coverage

## What it does not cover

This skill is intentionally scoped. For a full production workflow, pair it with these companion skills:

- [`flutter-architecture`](https://skills.sh/flutter/skills/flutter-architecture) for feature structure, routing, state, and architectural boundaries
- [`flutter-layout`](https://skills.sh/flutter/skills/flutter-layout) for responsive and adaptive behavior
- [`flutter-performance`](https://skills.sh/flutter/skills/flutter-performance) for rebuild control, rendering cost, and list/image optimization

The recommended stack is:

1. `flutter-architecture`
2. `figma-to-flutter`
3. `flutter-layout`
4. `flutter-performance`

## Repository structure

```text
.
├── figma-to-flutter/
│   ├── SKILL.md
│   ├── agents/openai.yaml
│   └── references/
│       ├── ds-mapping-guide.md
│       └── mock-data-patterns.md
├── docs/
│   ├── BUNDLE-INSTALL.md
│   ├── INSTALLATION.md
│   ├── RELEASING.md
│   └── USAGE.md
├── examples/
│   └── catalog-home/
│       ├── audit-report.md
│       ├── figma-spec.md
│       └── generated/
├── scripts/
│   ├── build-skill.sh
│   ├── check-bundle.sh
│   └── validate-skill.sh
└── .github/workflows/validate-skill.yml
```

## Included references

- `references/ds-mapping-guide.md`: mapping rules for forms, buttons, navigation, cards, overlays, images, spacing, typography, and colors
- `references/mock-data-patterns.md`: model patterns for lists, profiles, multi-section screens, and UI states

## Installation

See [docs/INSTALLATION.md](docs/INSTALLATION.md).

If you want the full required stack in one step, see [docs/BUNDLE-INSTALL.md](docs/BUNDLE-INSTALL.md).

## Usage

See [docs/USAGE.md](docs/USAGE.md).

## Example

See [examples/catalog-home/README.md](examples/catalog-home/README.md) for a worked end-to-end sample with:

- frame/spec summary
- DS audit output
- generated Flutter file structure

This gives the repo a concrete public artifact users can inspect before trying the skill in their own project.

## Build the distributable `.skill`

```bash
./scripts/validate-skill.sh
./scripts/build-skill.sh
```

This creates:

```text
dist/figma-to-flutter.skill
```

## Releases

See [docs/RELEASING.md](docs/RELEASING.md).

Pushing a tag like `v0.1.0` now triggers a GitHub Actions workflow that builds `figma-to-flutter.skill` and attaches it to the GitHub Release automatically.

## Companion installation

This repo also includes [scripts/install-bundle.sh](scripts/install-bundle.sh) to install:

- this local `figma-to-flutter` skill
- `flutter-architecture`
- `flutter-layout`
- `flutter-performance`

Use it when you want a reproducible install for the full workflow instead of relying on manual setup.

You can verify the installation state with [scripts/check-bundle.sh](scripts/check-bundle.sh). It fails if any required companion skill is missing.

## Public repo checklist

- Source skill folder tracked in git
- Public README explaining scope, workflow, and benefits
- Companion-skill dependencies documented
- Packaging script for `.skill` builds
- Validation script for basic quality checks
- GitHub Actions workflow for validation on push/PR

## Recommended next improvements

- Add screenshots/GIFs of the workflow in action
- Replace the example with a captured frame from a public Figma file
- Add installation instructions for the exact target runtime where you plan to distribute it

## License

This repository uses the MIT license. See [LICENSE](LICENSE).
