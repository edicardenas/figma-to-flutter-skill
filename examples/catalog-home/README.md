# Catalog Home Example

This example shows what the repository means by a full `figma-to-flutter` workflow.

It is a realistic sample based on a commerce home/catalog screen with:

- A top app bar
- A search field
- Category chips
- A featured products carousel
- A product list

The example is intentionally concrete enough to explain the skill behavior, while remaining portable and public.

The generated Flutter files are illustrative. They assume a project-local design system package and are meant to show the expected shape and discipline of the output, not to compile unchanged in every codebase.

## What is included

- `figma-spec.md`: simplified frame/spec extraction summary
- `audit-report.md`: design-system audit before coding
- `generated/`: sample Flutter output structure

## Why this example matters

It demonstrates the core promise of the skill:

1. Inspect the frame first
2. Audit component readiness before implementation
3. Reuse DS widgets instead of inventing UI
4. Generate backend-ready models with mock data

## Assumptions

This example assumes the target Flutter app already has these design-system primitives:

- `AppScaffold`
- `AppBar`
- `AppTextField`
- `AppChip`
- `AppCarousel`
- `AppCard`
- `PrimaryButton`
- `AppNetworkImage`
- `AppTextStyles`
- `AppColors`
- `AppSpacing`

Two components are intentionally left outside the existing DS to show the audit behavior:

- `FilterPill`
- `PriceTag`
