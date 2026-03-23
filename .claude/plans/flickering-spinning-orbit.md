# Plan: Profile Site Full Content Update

## Context
실제 사용자 정보로 프로필 사이트 전체 콘텐츠를 업데이트한다.

---

## Changes

**File:** `/Users/marklin/workspace/my-profile-site/index.html`

### 1. Navbar 로고 (line 204)
`Märklin` → `Märklin Dallenger`

### 2. `<title>` 태그 (line 7)
→ `Märklin Dallenger - Data Analyst at Meta | ML Developer | UCLA Bioengineering Alum`

### 3. Hero bio (lines 241-245)
→ plain text로 교체:
> I'm a Data Analyst at Meta with a UCLA Bioengineering background. I love turning messy data into clean, actionable insights. When I'm not at my day job, I'm building 'King Kang' alongside a former MLB shortstop—it's an AI tool designed to perfect your baseball swing. I live for the bridge between data science and real-world building.

### 4. About 섹션 전체 (lines 283-329)

**이미지 플레이스홀더** (left column): 🚀 제거 → 텍스트 `[Image Placeholder: Professional Photo or Project Snapshot]` + 깔끔한 프레임 유지

**텍스트** (right column):
- 서브헤딩:
  > "**UCLA** Bioengineering grad, currently scaling data at **Meta Platforms**."
- 본문 단락:
  > I thrive at the intersection of complex systems and clean code. Between optimizing data ecosystems at **Meta** and co-developing **'King Kang'**—an AI swing-analysis tool with a former **MLB** shortstop—I build solutions that bridge the gap between raw data and real-world impact.

**메타 정보** (하단): 기존 Role/Company → 3개 항목으로 교체:
- ROLE: Data Analyst @ Meta | ML Developer @ King Kang
- EDUCATION: BS, Bioengineering, UCLA

### 5. Experience 섹션 제목 (line 390)
`Data Scientist & Full Stack Developer`
→ `Data Analyst at Meta | ML Developer | UCLA Bioengineering Alum`

### 6. Skills 섹션 전체 재구성 (lines 331-378)

기존 4-column 단일 그리드 → 카테고리 기반 레이아웃으로 교체.
**Data Science & AI 섹션을 시각적으로 강조** (더 굵은 border + 배경색 강조).

**레이아웃 구조:**
```
[Languages]         Python | SQL | JavaScript        (3 cols)

[Data Science & AI] NumPy | Matplotlib | PyTorch | Scikit-learn  (4 cols, highlighted)

[Web & Backend]     React | FastAPI | Firebase        (3 cols)

[Developer Tools]   Git | Docker                      (2 cols)
```

**아이콘 (Devicon v2.16.0):**
Python: `devicon-python-plain`, SQL: `devicon-postgresql-plain`, JS: `devicon-javascript-plain`,
NumPy: `devicon-numpy-plain`, Matplotlib: `devicon-matplotlib-plain`, PyTorch: `devicon-pytorch-plain`,
Scikit-learn: `devicon-scikitlearn-plain`, React: `devicon-react-plain`, FastAPI: `devicon-fastapi-plain`,
Firebase: `devicon-firebase-plain`, Git: `devicon-git-plain`, Docker: `devicon-docker-plain`

## Verification
- 브라우저에서 index.html 열어 각 섹션 확인
- About 섹션 bold 키워드(Meta, UCLA, King Kang, MLB) 표시 확인
- Skills 섹션 Data Science 카테고리 강조 확인
