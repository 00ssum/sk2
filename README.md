# kit — AI 해커톤 2차 예선 개인 작업 하네스

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

## 작업 순서

1. `git clone https://github.com/00ssum/sk2 && bash sk2/install.sh .`
2. `codex` → `/model` 6.1 Sol
3. `$kickoff`
4. 실무자 DM → 답은 NOTES.md에
5. DECISIONS.md 0번 합의문 → `$decide`
6. 첫 완주 (입력→출력 하나) → 커밋
7. 반복: 규칙 하나 → 테스트 실패 보기 → 구현 → `$verify` → `$decide` → 커밋
8. 종료 35분 전 동결 → `bash sk2/scripts/presubmit.sh .` → 제출 문서
9. `$brief` → 읽고 보완
10. 종료 10분 전 제출
11. 서술형 4문장: 결정 / 구조 / 검증 / 한계

막히면: 적는다 → 확인한다 → 커밋한다 → 설명한다
