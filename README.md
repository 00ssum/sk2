# kit — SK하이닉스 AI 해커톤 2차 예선 개인 작업 하네스

응시 중 AI(Codex)에게 지킬 규칙과 기록 양식을 담은 범용 작업 도구. 특정 과제의 답이나 코드를 포함하지 않는다. 2차 예선 결과 통지 전까지 공개 상태로 유지한다.

## 구성
| 파일 | 역할 | 언제 |
|---|---|---|
| AGENTS.md | Codex가 읽는 작업 규칙 (변인 통제, 증거, 지어내지 않기, 범위, 순서) | 시작 직후 작업 폴더에 복사 |
| templates/NOTES.md | 사실·실무자 답변·가정·진행 로그 | 시험 내내 |
| templates/DECISIONS.md | 합의문 + 결정별 [결정/근거/검증/한계] | 결정할 때마다 |
| skills/kickoff | 시작 직후 README 분석, NOTES.md 채움, 질문 초안 | 시작 `$kickoff` |
| skills/decide | 결정 하나를 DECISIONS.md에 4줄 기록 | 결정마다 `$decide` |
| skills/verify | 변경 하나 검증·기록 | 변경 하나마다 `$verify` |
| skills/brief | 서술형 대비 1쪽 요약 / 핸드오프 | 제출 직전·세션 전환 `$brief` |
| RUN.md | 당일 시간표 | 화면 옆에 띄워 둠 |
| questions.md | 실무자 질문 목록 | 10:05~10:30 |
| precheck.md | 사전 체험 15분 체크리스트 | 10/30 저녁 |
| scripts/presubmit.sh | 제출 전 점검 (보여 주기만) | 12:20 동결 후 |
| install.sh | 위 파일을 작업 폴더에 넣음 | 시작 직후 |

## 사용
```
git clone https://github.com/<계정>/<레포> /tmp/kit && bash /tmp/kit/install.sh .
codex   # /status → /model 6.1 Sol → "AGENTS.md 읽었어?"
```
kit 본체는 /tmp에 두고 작업 폴더에는 AGENTS.md, NOTES.md, DECISIONS.md, .agents/skills만 들어간다.

## 원칙 한 줄
가설 하나 → 변경 하나 → 확인 하나 → 기록 한 줄.
흐름: $kickoff → (DM) → $decide → 구현 → $verify → $decide → ... → $brief
