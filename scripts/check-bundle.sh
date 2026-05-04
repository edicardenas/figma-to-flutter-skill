#!/usr/bin/env bash
set -euo pipefail

DEFAULT_SKILLS_DIR=""

if [[ -d "$HOME/.agents/skills" ]]; then
  DEFAULT_SKILLS_DIR="$HOME/.agents/skills"
elif [[ -d "${CODEX_HOME:-$HOME/.codex}/skills" ]]; then
  DEFAULT_SKILLS_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
else
  DEFAULT_SKILLS_DIR="$HOME/.agents/skills"
fi

SKILLS_DIR="${DEFAULT_SKILLS_DIR}"

REQUIRED_SKILLS=(
  "figma-to-flutter"
  "flutter-apply-architecture-best-practices"
  "flutter-build-responsive-layout"
  "flutter"
)

usage() {
  cat <<'EOF'
Check whether the full figma-to-flutter skill bundle is installed.

Usage:
  ./scripts/check-bundle.sh [--dest <skills-dir>] [--no-local]

Options:
  --dest <dir>  Override the skills directory. Default: ~/.agents/skills, fallback ~/.codex/skills
  --no-local    Do not require the local figma-to-flutter skill; check only the companion skills
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dest)
      SKILLS_DIR="${2:?missing value for --dest}"
      shift 2
      ;;
    --no-local)
      REQUIRED_SKILLS=(
        "flutter-apply-architecture-best-practices"
        "flutter-build-responsive-layout"
        "flutter"
      )
      shift
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

if [[ ! -d "${SKILLS_DIR}" ]]; then
  echo "Skills directory not found: ${SKILLS_DIR}" >&2
  exit 1
fi

MISSING=()

for skill in "${REQUIRED_SKILLS[@]}"; do
  if [[ ! -d "${SKILLS_DIR}/${skill}" ]]; then
    MISSING+=("${skill}")
  fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "Missing required skills in ${SKILLS_DIR}:" >&2
  for skill in "${MISSING[@]}"; do
    echo "  - ${skill}" >&2
  done
  exit 1
fi

echo "Bundle check passed."
echo "Installed skills found in ${SKILLS_DIR}:"
for skill in "${REQUIRED_SKILLS[@]}"; do
  echo "  - ${skill}"
done
