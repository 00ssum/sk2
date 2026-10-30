#!/usr/bin/env bash
# 사용: bash /tmp/kit/install.sh <작업폴더>
# 하는 일: AGENTS.md(있으면 덧붙임), NOTES.md, DECISIONS.md, 스킬 2개를 작업 폴더에 넣는다.
# 하지 않는 일: 플랫폼 설정 수정, 홈 디렉터리 수정, git 설정 변경.
set -e
KIT="$(cd "$(dirname "$0")" && pwd)"
WS="${1:-.}"
cd "$WS"

if [ -f AGENTS.md ]; then
  echo "" >> AGENTS.md
  echo "<!-- 아래는 개인 작업 규칙 (kit) -->" >> AGENTS.md
  cat "$KIT/AGENTS.md" >> AGENTS.md
  echo "AGENTS.md: 기존 파일 끝에 덧붙임"
else
  cp "$KIT/AGENTS.md" AGENTS.md
  echo "AGENTS.md: 복사"
fi

[ -f NOTES.md ] || cp "$KIT/templates/NOTES.md" NOTES.md
[ -f DECISIONS.md ] || cp "$KIT/templates/DECISIONS.md" DECISIONS.md
echo "NOTES.md, DECISIONS.md: 준비"

mkdir -p .agents/skills
for s in kickoff decide verify brief; do
  [ -d ".agents/skills/$s" ] || cp -r "$KIT/skills/$s" ".agents/skills/$s"
done
echo ".agents/skills: kickoff, decide, verify, brief"

echo "python: $(python3 -V 2>&1)   node: $(node -v 2>&1 || echo 없음)"
echo "완료. codex를 (재)시작하고 /skills 로 kickoff, decide, verify, brief가 보이는지 확인."
