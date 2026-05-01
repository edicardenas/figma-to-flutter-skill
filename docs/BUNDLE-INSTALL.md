# Bundle Installation

## Short answer

You cannot reliably force one skill to auto-install other skills from inside `SKILL.md`.

The skill format used here is instruction-first. It does not provide a native, guaranteed `skillDependencies` mechanism for installing other skills automatically at runtime.

So the correct solution is to publish and use a **bundle installer**.

## What this repo now provides

Use:

```bash
./scripts/install-bundle.sh
```

That does two things:

1. Installs this local skill into your Codex skills directory
2. Installs the required companion skills from `flutter/skills`

Required companion skills:

- `flutter-architecture`
- `flutter-layout`
- `flutter-performance`

After installation, verify the result with:

```bash
./scripts/check-bundle.sh
```

## How the companion skills are installed

The script uses the public install commands exposed on `skills.sh`:

```bash
npx skills add https://github.com/flutter/skills --skill flutter-architecture -g -y
npx skills add https://github.com/flutter/skills --skill flutter-layout -g -y
npx skills add https://github.com/flutter/skills --skill flutter-performance -g -y
```

## Options

Install everything:

```bash
./scripts/install-bundle.sh
```

Verify:

```bash
./scripts/check-bundle.sh
```

Install only this repo's local skill:

```bash
./scripts/install-bundle.sh --local-only
```

Install only the companion skills:

```bash
./scripts/install-bundle.sh --companions-only
```

Install into a custom skills directory:

```bash
./scripts/install-bundle.sh --dest /path/to/skills
```

Check a custom skills directory:

```bash
./scripts/check-bundle.sh --dest /path/to/skills
```

## Important

After installation, restart Codex so the runtime picks up the newly installed skills.

## Recommendation for public users

In the public README, position this repository as:

- one primary skill: `figma-to-flutter`
- one required companion bundle: architecture + layout + performance

That is much clearer than pretending the dependency resolution is automatic when it is not.
