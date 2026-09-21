#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
input_file="${repo_root}/worksheets/emission-spectra-atomic-reactions-assignment.md"
output_file="${repo_root}/worksheets/emission-spectra-atomic-reactions-assignment.pdf"
pagebreak_filter="${repo_root}/worksheets/pandoc-pagebreak.lua"

pandoc "${input_file}" \
  --from markdown+tex_math_single_backslash \
  --pdf-engine=xelatex \
  --standalone \
  --lua-filter "${pagebreak_filter}" \
  --variable geometry:margin=1in \
  --variable fontsize=11pt \
  --variable linestretch=1.15 \
  --variable mainfont="Latin Modern Roman" \
  --variable monofont="DejaVu Sans Mono" \
  --output "${output_file}"

echo "Generated ${output_file}"
