#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_SKILL_NAME="figma-to-flutter"
DEFAULT_SKILLS_DIR=""

if [[ -d "$HOME/.agents/skills" ]]; then
  DEFAULT_SKILLS_DIR="$HOME/.agents/skills"
elif [[ -d "${CODEX_HOME:-$HOME/.codex}/skills" ]]; then
  DEFAULT_SKILLS_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
else
  DEFAULT_SKILLS_DIR="$HOME/.agents/skills"
fi

SKILLS_DEST_DIR="${DEFAULT_SKILLS_DIR}"

COMPANION_REPO="https://github.com/flutter/skills"
COMPANION_SKILLS=(
  "flutter-architecture"
  "flutter-layout"
  "flutter-performance"
)

usage() {
  cat <<'EOF'
Install the figma-to-flutter skill plus its required companion skills.

Usage:
  ./scripts/install-bundle.sh [--local-only] [--companions-only] [--dest <skills-dir>]

Options:
  --local-only      Install only the local figma-to-flutter skill.
  --companions-only Install only the companion skills from flutter/skills.
  --dest <dir>      Override the target skills directory. Default: ~/.agents/skills, fallback ~/.codex/skills

Notes:
  - Companion skills are installed with the public skills CLI.
  - The local skill is installed with: npx skills add <local-path> --skill figma-to-flutter -a codex -g -y
  - Restart Codex after installation so the runtime picks up new skills.
EOF
}

INSTALL_LOCAL=1
INSTALL_COMPANIONS=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --local-only)
      INSTALL_COMPANIONS=0
      shift
      ;;
    --companions-only)
      INSTALL_LOCAL=0
      shift
      ;;
    --dest)
      SKILLS_DEST_DIR="${2:?missing value for --dest}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! command -v npx >/dev/null 2>&1; then
  echo "npx is required to install companion skills." >&2
  exit 1
fi

mkdir -p "${SKILLS_DEST_DIR}"

if [[ ${INSTALL_LOCAL} -eq 1 ]]; then
  if [[ ! -d "${ROOT_DIR}/figma-to-flutter" ]]; then
    echo "Local skill directory not found: ${ROOT_DIR}/figma-to-flutter" >&2
    exit 1
  fi

  echo "Installing local skill: ${LOCAL_SKILL_NAME}"
  npx skills add "${ROOT_DIR}" --skill "${LOCAL_SKILL_NAME}" -a codex -g -y
fi

if [[ ${INSTALL_COMPANIONS} -eq 1 ]]; then
  for skill in "${COMPANION_SKILLS[@]}"; do
    echo "Installing companion skill: ${skill}"
    if ! npx skills add "${COMPANION_REPO}" --skill "${skill}" -a codex -g -y; then
      cat >&2 <<EOF

Failed to install companion skill '${skill}'.

Why this happens:
- As of 2026-05-04, the public skills.sh pages for these Flutter companion skills point to install commands using '${COMPANION_REPO}'.
- In practice, the current public flutter/skills repository exposed to the CLI does not contain installable skill IDs named:
  - flutter-architecture
  - flutter-layout
  - flutter-performance

What the CLI currently reports as installable in flutter/skills:
- flutter-apply-architecture-best-practices
- flutter-build-responsive-layout
- flutter-fix-layout-issues
- flutter-add-integration-test
- flutter-add-widget-preview
- flutter-add-widget-test
- flutter-implement-json-serialization
- flutter-setup-declarative-routing
- flutter-setup-localization
- flutter-use-http-package

The bundle installer stopped here on purpose so the failure is explicit.
See docs/BUNDLE-INSTALL.md for the current troubleshooting note.
EOF
      exit 1
    fi
  done
fi

echo "Bundle installation complete."
"${ROOT_DIR}/scripts/check-bundle.sh" --dest "${SKILLS_DEST_DIR}"
echo "Restart Codex to pick up the installed skills."
