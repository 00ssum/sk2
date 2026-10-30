#!/usr/bin/env bash
# 제출 전 점검. 사용: bash /tmp/kit/scripts/presubmit.sh [작업폴더]
# 고치지 않는다. 보여 주기만 한다.
cd "${1:-.}"
echo "== 1. git 상태 (저장 안 된 것, 커밋 안 된 것)"
git status -s 2>/dev/null || echo "git 저장소 아님"
echo
echo "== 2. localhost 바인딩 (0.0.0.0이어야 Browser에서 보임)"
grep -rnE "127\.0\.0\.1|localhost" --include='*.py' --include='*.js' --include='*.ts' --include='*.mjs' . 2>/dev/null | grep -v node_modules | grep -v .agents || echo "없음"
echo
echo "== 3. 비밀값 의심"
grep -rnEi "(api[_-]?key|secret|password|token)\s*[=:]\s*['\"][^'\"]{6,}" --include='*.py' --include='*.js' --include='*.ts' --include='*.env' --include='*.json' . 2>/dev/null | grep -v node_modules || echo "없음"
echo
echo "== 4. 남은 TODO / 미구현 / 확인 필요"
grep -rnE "TODO|미구현|확인 필요|NOT_RUN" --include='*.md' --include='*.py' --include='*.js' --include='*.ts' . 2>/dev/null | grep -v .agents | grep -v node_modules || echo "없음"
echo
echo "== 5. 포트 1024 미만 사용 여부"
grep -rnE "port\s*[=:]\s*([0-9]{1,3})\b" --include='*.py' --include='*.js' --include='*.ts' . 2>/dev/null | grep -v node_modules || echo "없음"
echo
echo "== 6. 직접 확인할 것"
echo " - 에디터 탭 전부 '저장됨'인가"
echo " - 과제가 지정한 제출 파일명이 정확한가"
echo " - README 실행 명령을 실제로 쳐 봤는가"
echo " - 설명 못 하는 코드가 있는가"
