# Usage

## Best use case

Use this skill when the user already has:

- A Figma frame, screen, or component
- Access to Figma dev mode or MCP
- An existing Flutter design system

## Expected workflow

1. Verify the Figma MCP connection.
2. Capture a screenshot and dev mode specs.
3. Identify every component used in the frame.
4. Audit component coverage:
   - `✅` ready
   - `⚠️` partial
   - `❌` missing
5. Wait for the user to decide whether to:
   - implement only with existing widgets
   - create missing widgets first
   - stop after the audit
6. Generate the screen and model files.
7. Produce a final implementation report.

## Example prompts

Spanish:

```text
Usa $figma-to-flutter para auditar este frame de Figma y traducirlo a Flutter usando solo los widgets existentes del design system.
```

```text
Usa $figma-to-flutter para revisar esta pantalla, decirme qué componentes faltan en Flutter y esperar mi decisión antes de codificar.
```

English:

```text
Use $figma-to-flutter to inspect this Figma screen, audit the existing Flutter DS coverage, and only then generate the screen and model files.
```

## Output expectations

At minimum, the skill should produce:

- A component audit before implementation
- A screen file
- A root data model with `mock()` and `fromJson()`
- Local feature widgets when repeated UI patterns exist
- A final report listing what was generated and what is still missing

## Quality bar

The skill should never:

- Invent missing design-system widgets
- Inline arbitrary colors or text styles if the DS has tokens
- Approximate spacing without calling out the mismatch
- Hide missing architecture, layout, or performance decisions

## When to bring in the companion skills

- Use `flutter-apply-architecture-best-practices` first if feature boundaries, routing, or folder structure are undefined.
- Use `flutter-build-responsive-layout` after the first faithful translation if the UI must adapt across breakpoints or form factors.
- Use `mindrally/skills@flutter` before merging if the generated screen includes long lists, image-heavy sections, nested scroll views, or expensive rebuild paths, since it is the current installable fallback with explicit Flutter performance guidance.
