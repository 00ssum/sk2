#!/usr/bin/env bash
# 사전 체험용 환경 정보 수집. 읽기만 한다. 아무것도 설치·수정하지 않는다.
# 사용: bash sk2/scripts/envcheck.sh > envcheck.txt 2>&1 ; cat envcheck.txt
s(){ echo; echo "== $1"; }

s "기본"
whoami; pwd; date; uname -a
cat /etc/os-release 2>/dev/null | head -3

s "자원"
nproc 2>/dev/null; free -h 2>/dev/null; df -h . 2>/dev/null | tail -1

s "언어·도구 버전"
for c in python3 pip3 node npm npx git codex java go gcc make curl sqlite3 uv; do
  printf "%-8s " "$c"; command -v $c >/dev/null && ($c --version 2>&1 | head -1) || echo "없음"
done

s "Python 패키지 (주요)"
python3 - <<'EOF'
import importlib
for m in ["pandas","numpy","flask","fastapi","uvicorn","pytest","requests","matplotlib","streamlit","sqlite3"]:
    try:
        v=getattr(importlib.import_module(m),"__version__","ok"); print(f"{m:12} {v}")
    except Exception: print(f"{m:12} 없음")
EOF

s "작업 폴더"
ls -la
git status -s 2>&1 | head -20
git log --oneline 2>&1 | head -5

s "Codex 설정 (읽기만)"
ls -la ~/.codex 2>/dev/null
cat ~/.codex/config.toml 2>/dev/null | grep -viE "key|token|secret" | head -30

s "네트워크 (GitHub·PyPI·npm 접근)"
for u in https://github.com https://pypi.org/simple/ https://registry.npmjs.org; do
  printf "%-32s " "$u"; curl -s -o /dev/null -w "%{http_code}\n" -m 5 "$u" || echo "실패"
done

s "포트 사용 중"
(ss -ltnp 2>/dev/null || netstat -ltn 2>/dev/null) | head -15

s "환경 변수 (이름만, 값 숨김)"
env | cut -d= -f1 | sort | tr '\n' ' '; echo

echo; echo "== 끝. 이 파일 내용을 보여 주면 됨"
