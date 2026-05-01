#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_NAME="figma-to-flutter"
DIST_DIR="${ROOT_DIR}/dist"
OUTPUT_FILE="${DIST_DIR}/${SKILL_NAME}.skill"

"${ROOT_DIR}/scripts/validate-skill.sh"

mkdir -p "${DIST_DIR}"
rm -f "${OUTPUT_FILE}"

(
  cd "${ROOT_DIR}"
  zip -qr "${OUTPUT_FILE}" "${SKILL_NAME}"
)

echo "Built ${OUTPUT_FILE}"
