# Releasing

This repository ships the distributable skill through Git tags and GitHub Releases.

## Tag format

Use semantic tags:

```bash
git tag v0.1.0
git push origin v0.1.0
```

## What happens on tag push

When you push a tag matching `v*`, GitHub Actions will:

1. Validate the skill structure
2. Build `dist/figma-to-flutter.skill`
3. Create a GitHub Release for that tag
4. Upload the `.skill` file as a release asset

## Notes

- The workflow uses the repository `GITHUB_TOKEN`; no extra secret is required for standard release publishing.
- If a release already exists for the same tag, GitHub will update the release artifact through the workflow run.
