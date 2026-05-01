#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_DIR="${ROOT_DIR}/figma-to-flutter"

if [[ ! -d "${SKILL_DIR}" ]]; then
  echo "Missing skill directory: ${SKILL_DIR}" >&2
  exit 1
fi

if [[ ! -f "${SKILL_DIR}/SKILL.md" ]]; then
  echo "Missing SKILL.md" >&2
  exit 1
fi

if ! grep -q '^name: figma-to-flutter$' "${SKILL_DIR}/SKILL.md"; then
  echo "SKILL.md frontmatter must include name: figma-to-flutter" >&2
  exit 1
fi

if ! grep -q '^description:' "${SKILL_DIR}/SKILL.md"; then
  echo "SKILL.md frontmatter must include description" >&2
  exit 1
fi

for ref in \
  "${SKILL_DIR}/references/ds-mapping-guide.md" \
  "${SKILL_DIR}/references/mock-data-patterns.md" \
  "${SKILL_DIR}/agents/openai.yaml"; do
  if [[ ! -f "${ref}" ]]; then
    echo "Missing required file: ${ref}" >&2
    exit 1
  fi
done

echo "Skill validation passed."
