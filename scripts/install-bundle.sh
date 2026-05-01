#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_SKILL_DIR="${ROOT_DIR}/figma-to-flutter"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
SKILLS_DEST_DIR="${CODEX_HOME_DIR}/skills"
LOCAL_DEST_DIR="${SKILLS_DEST_DIR}/figma-to-flutter"

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
  --dest <dir>      Override the target skills directory. Default: $CODEX_HOME/skills or ~/.codex/skills

Notes:
  - Companion skills are installed with: npx skills add https://github.com/flutter/skills --skill <name> -g -y
  - The local skill is installed by copying this repo's figma-to-flutter folder into the target skills directory.
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
      LOCAL_DEST_DIR="${SKILLS_DEST_DIR}/figma-to-flutter"
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
  if [[ ! -d "${LOCAL_SKILL_DIR}" ]]; then
    echo "Local skill directory not found: ${LOCAL_SKILL_DIR}" >&2
    exit 1
  fi

  rm -rf "${LOCAL_DEST_DIR}"
  cp -R "${LOCAL_SKILL_DIR}" "${LOCAL_DEST_DIR}"
  echo "Installed local skill to ${LOCAL_DEST_DIR}"
fi

if [[ ${INSTALL_COMPANIONS} -eq 1 ]]; then
  for skill in "${COMPANION_SKILLS[@]}"; do
    echo "Installing companion skill: ${skill}"
    npx skills add "${COMPANION_REPO}" --skill "${skill}" -g -y
  done
fi

echo "Bundle installation complete."
echo "Restart Codex to pick up the installed skills."
