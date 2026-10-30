# 사전 체험 15분 체크리스트 (1회뿐. 확인만 하고 수정하지 않는다)

실제 응시할 노트북·장소·휴대폰으로 한다. 결과는 바로 아래 표에 적는다.

| # | 확인 | 명령 / 행동 | 결과 |
|---|---|---|---|
| 1 | 감독 연결 | 웹캠 → 전체화면 공유 → Proctor 앱 연결 QR | |
| 2 | README 열림 | 파일 탐색기에서 README.md | |
| 3 | 버전 | `python3 -V` `node -v` `git --version` | |
| 4 | clone 되나 | `git clone https://github.com/00ssum/sk2 /tmp/kit` | |
| 5 | 설치 | `bash /tmp/kit/install.sh .` → AGENTS.md, NOTES.md 생김 | |
| 6 | Codex 시작 | `codex` → 신뢰 확인 y → `/status` (모델·권한 적기) | |
| 7 | 모델 | `/model` → 6.1 Sol 선택 | |
| 8 | AGENTS.md 읽나 | "AGENTS.md 읽었어? 변인 통제 규칙 한 줄로" | |
| 9 | 스킬 뜨나 | `$` → kickoff, decide, verify, brief 보이나. 안 보이면 codex 재시작 후 재확인 | |
| 10 | 승인 대기 모양 | "현재 폴더 파일 목록 보여줘" → 승인 프롬프트가 어떻게 뜨는지 | |
| 11 | 서버·Browser | `python3 -m http.server 3000 --bind 0.0.0.0` → Browser 탭 PORT 3000 | |
| 12 | 터미널 분할 | + 로 새 탭, 분할 버튼 | |
| 13 | Cofa Helper | "공개 Skill은 어떻게 적용하나요?" 한 번 질문 | |
| 14 | 업데이트 메시지 | Codex가 업데이트 권유하면 무시 (메시지 내용 적기) | |
| 15 | 체험 종료 | "체험 종료" → 예시 서술형 1문항 직접 타이핑 | |

끝나면 이 표 결과로 kit을 수정한다. 특히 9번이 안 되면 스킬 폴더는 두되 기대하지 않는다 (AGENTS.md에 같은 내용이 있음).
