# Plan: claude-code-mastery 최상위 폴더 구조 재편

## Context
현재 `/Users/marklin/workspace/` 하위에 여러 프로젝트 폴더가 혼재해 있음.
`claude-code-mastery`를 최상위 허브 폴더로 삼아, 나머지 프로젝트들을 그 안에 정리하고
`.claude/.rules` 모듈형 규칙 디렉터리 구조를 추가한다.

## 현재 구조
```
/Users/marklin/workspace/
├── .gitignore
├── BugFix.md / PLAN.md / setting.JSON / index.html  (루트 잡파일)
├── bucket-list-main/
├── claude-code-mastery/
│   ├── index.html
│   └── test/
├── my-profile-site/
└── output-style-test/
```

## 목표 구조
```
/Users/marklin/workspace/
└── claude-code-mastery/          ← 최상위 허브
    ├── .claude/
    │   └── .rules/               ← 모듈형 규칙 디렉터리
    ├── bucket-list-main/         ← 이동
    ├── my-profile-site/          ← 이동
    ├── output-style-test/        ← 이동
    ├── index.html
    └── test/
```

## 실행 단계

1. **`.claude/.rules` 디렉터리 생성**
   - `mkdir -p /Users/marklin/workspace/claude-code-mastery/.claude/.rules`

2. **프로젝트 폴더 이동 (mv)**
   - `bucket-list-main` → `claude-code-mastery/bucket-list-main`
   - `my-profile-site` → `claude-code-mastery/my-profile-site`
   - `output-style-test` → `claude-code-mastery/output-style-test`

3. **루트 잡파일도 함께 이동**
   - `BugFix.md`, `PLAN.md`, `setting.JSON`, `index.html`(루트), `.gitignore` 도 `claude-code-mastery/` 로 이동

## 확인 방법
- `ls /Users/marklin/workspace/claude-code-mastery/` 로 폴더 구조 확인
- `ls /Users/marklin/workspace/claude-code-mastery/.claude/.rules/` 로 규칙 디렉터리 확인

## 주의사항
- git 히스토리가 있는 폴더는 `mv` 시 히스토리가 유지됨
- 워크스페이스 루트의 `.gitignore` / 잡파일은 별도 지시 없으면 그대로 둠
