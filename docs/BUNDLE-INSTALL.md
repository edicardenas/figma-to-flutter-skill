# Bundle Installation

## Goal

Install the complete recommended stack in a transparent way:

- `figma-to-flutter`
- `flutter-apply-architecture-best-practices`
- `flutter-build-responsive-layout`
- `flutter` from `mindrally/skills`

## Why this exists

You cannot reliably force one skill to auto-install other skills from inside `SKILL.md`.

So this repository uses a bundle installer instead of pretending dependency resolution is automatic.

## What this repo now provides

Follow these steps.

### Step 1: Clone the repo

```bash
git clone https://github.com/edicardenas/figma-to-flutter-skill.git
cd figma-to-flutter-skill
```

### Step 2: Run the installer

```bash
./scripts/install-bundle.sh
```

### Step 3: Verify the installed bundle

```bash
./scripts/check-bundle.sh
```

### Step 4: Restart Codex

Codex needs to restart to pick up newly installed skills.

## What `install-bundle.sh` does

It does exactly this:

1. Installs this repository's local `figma-to-flutter` skill into your Codex skills directory
2. Installs `flutter-apply-architecture-best-practices` from `flutter/skills`
3. Installs `flutter-build-responsive-layout` from `flutter/skills`
4. Installs `flutter` from `mindrally/skills` as the current installable fallback that includes performance guidance
5. Runs `check-bundle.sh`
6. Fails if any required skill is still missing

## What `check-bundle.sh` verifies

It checks that these skill folders exist in the target skills directory:

- `figma-to-flutter`
- `flutter-apply-architecture-best-practices`
- `flutter-build-responsive-layout`
- `flutter`

Required companion skills:

- `flutter-apply-architecture-best-practices`
- `flutter-build-responsive-layout`
- `mindrally/skills@flutter`

## How the companion skills are installed

The script uses the public install commands exposed on `skills.sh`:

```bash
npx skills add https://github.com/flutter/skills --skill flutter-apply-architecture-best-practices -a codex -g -y
npx skills add https://github.com/flutter/skills --skill flutter-build-responsive-layout -a codex -g -y
npx skills add mindrally/skills@flutter -a codex -g -y
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

This installs only `figma-to-flutter`.

Install only the companion skills:

```bash
./scripts/install-bundle.sh --companions-only
```

This installs only:

- `flutter-apply-architecture-best-practices`
- `flutter-build-responsive-layout`
- `mindrally/skills@flutter`

Install into a custom skills directory:

```bash
./scripts/install-bundle.sh --dest /path/to/skills
```

Check a custom skills directory:

```bash
./scripts/check-bundle.sh --dest /path/to/skills
```

## Important

- `npx skills add ... --skill figma-to-flutter` installs only this skill
- `install-bundle.sh` is the supported way to install the full stack from this repo
- After installation, restart Codex so the runtime picks up the newly installed skills

## Troubleshooting

### Error: missing companion skills after bundle install

If you see output like:

```text
Missing required skills in ...
- flutter-apply-architecture-best-practices
- flutter-build-responsive-layout
- flutter
```

there are two common causes:

1. The skills CLI installed into `~/.agents/skills` while an older checker was looking at `~/.codex/skills`
2. The older conceptual companion names were not the same as the skill IDs currently installable from the public ecosystem

This repository now checks `~/.agents/skills` first and targets the currently installable companion equivalents.

## Recommendation for public users

In the public README, position this repository as:

- one primary skill: `figma-to-flutter`
- one required companion bundle: architecture + layout + performance

That is much clearer than pretending the dependency resolution is automatic when it is not.
