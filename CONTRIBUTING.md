# Contributing

## Goal

Keep the skill strict, predictable, and useful for real Flutter teams working from Figma.

## Contribution rules

- Do not widen the skill scope casually.
- Keep `SKILL.md` focused on workflow, not long-form documentation.
- Put detailed mapping or examples in `references/`.
- Do not add guidance that encourages invented widgets, colors, or layout approximations.
- Preserve the dependency boundary with `flutter-architecture`, `flutter-layout`, and `flutter-performance`.

## Before opening a PR

Run:

```bash
./scripts/validate-skill.sh
./scripts/build-skill.sh
```

## Good contributions

- Better audit wording
- Clearer DS mapping rules
- Better mock model patterns
- Safer prompts and trigger descriptions
- Real-world examples that reduce ambiguity without bloating the core skill

## Avoid

- Embedding project-specific folder structures directly into this skill
- Adding performance or responsive rules that belong in companion skills
- Turning the skill into a generic Flutter code generator
