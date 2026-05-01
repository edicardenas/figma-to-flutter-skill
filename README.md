# Figma to Flutter Skill

`figma-to-flutter` is a Codex/agent skill for translating Figma frames into Flutter UI with strict design-system discipline.

This repository contains the source skill, public documentation, and packaging scripts needed to version it openly on GitHub.

It does four things especially well:

- Audits the Figma frame before coding
- Reuses existing Flutter design-system widgets instead of inventing UI
- Generates screen code plus mock-ready models
- Makes missing design-system work explicit before implementation continues

## Installation

There are two supported installation paths.

### Option A: Install only this skill

Use this if you only want `figma-to-flutter`:

```bash
npx skills add https://github.com/edicardenas/figma-to-flutter-skill --skill figma-to-flutter
```

For a global Codex install without prompts:

```bash
npx skills add https://github.com/edicardenas/figma-to-flutter-skill --skill figma-to-flutter -a codex -g -y
```

Important:

- This installs only `figma-to-flutter`
- It does not install `flutter-architecture`
- It does not install `flutter-layout`
- It does not install `flutter-performance`

### Option B: Install the full required stack

Use this if you want the recommended production workflow:

1. Clone this repository
2. Run the bundle installer
3. Verify the bundle
4. Restart Codex

```bash
git clone https://github.com/edicardenas/figma-to-flutter-skill.git
cd figma-to-flutter-skill
./scripts/install-bundle.sh
./scripts/check-bundle.sh
```

This installs:

- `figma-to-flutter`
- `flutter-architecture`
- `flutter-layout`
- `flutter-performance`

See [docs/INSTALLATION.md](docs/INSTALLATION.md) for the full step-by-step guide.
See [docs/BUNDLE-INSTALL.md](docs/BUNDLE-INSTALL.md) for the transparent bundle details.

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

Transparent behavior:

- `npx skills add ... --skill figma-to-flutter` installs only this skill
- `./scripts/install-bundle.sh` installs this skill plus the 3 companion skills
- `./scripts/check-bundle.sh` fails if any required skill is missing

You can verify the installation state with [scripts/check-bundle.sh](scripts/check-bundle.sh). It fails if any required companion skill is missing.

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
│   ├── install-bundle.sh
│   └── validate-skill.sh
└── .github/workflows/validate-skill.yml
```

## Included references

- `references/ds-mapping-guide.md`: mapping rules for forms, buttons, navigation, cards, overlays, images, spacing, typography, and colors
- `references/mock-data-patterns.md`: model patterns for lists, profiles, multi-section screens, and UI states

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
