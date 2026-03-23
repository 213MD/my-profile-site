# Context7 MCP 서버 Claude Code 글로벌 등록

## Context
사용자가 AntiGravity 앱을 통해 Context7 MCP 서버를 설치했고,
이것을 Claude Code의 **모든 프로젝트에서 항상** 사용하고 싶음.

- Context7 실행 명령어: `npx -y @upstash/context7-mcp`
- 플러그인 파일 위치: `~/.claude/plugins/marketplaces/claude-plugins-official/external_plugins/context7/`
- 현재 `~/.claude/settings.json`에 허용 권한은 이미 추가되어 있음 (이전 단계)

## 문제
MCP 서버 자체가 Claude Code 글로벌 레벨에 **등록**되어 있지 않아서
프로젝트마다 `.mcp.json`을 만들지 않으면 사용 불가.

## 해결 방법

### 방법: `claude mcp add` 명령어로 글로벌 등록

```bash
claude mcp add context7 -s user -- npx -y @upstash/context7-mcp
```

- `-s user` : 사용자 레벨 (글로벌) 등록 → 모든 프로젝트에서 사용 가능
- 명령 실행 후 `~/.claude/` 안에 MCP 설정이 자동 저장됨

## 수정 파일
- 자동으로 `~/.claude/` 내부 MCP 설정에 추가됨 (Claude Code가 관리)

## 정리 작업 (이전에 잘못 추가된 설정 제거)
아래 파일에서 잘못 추가된 antigravity 관련 설정 제거:
- `/Users/marklin/workspace/claude-code-mastery/.mcp.json` → antigravity 서버 항목 제거
- `/Users/marklin/workspace/.claude/settings.local.json` → `enabledMcpjsonServers`의 antigravity 제거

## 검증
- `claude mcp list` 명령어로 context7이 글로벌 등록되었는지 확인
- Claude Code 재시작 후 context7 도구 사용 가능 확인
