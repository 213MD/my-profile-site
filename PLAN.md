# Plan: Hero 섹션 타이핑 애니메이션 — 세 줄 동시 표시

## 구현 항목 요약
1. 플랜 파일 → 프로젝트 디렉토리에 복사 (`PLAN.md`)
2. Hero 타이핑 애니메이션 → 세 줄 동시 표시
3. Skills 섹션 → PyTorch 카드 추가

---

## Context
현재 Hero 섹션에는 `Data Scientist`, `Full Stack Developer`, `ML Engineer`가 **한 줄씩 교체**되는 타이핑 애니메이션이 있음.
사용자 요청: 세 역할을 **세 줄로 동시에** 보여주되 각각 순차적으로 타이핑되어 방문자가 한눈에 세 가지 역할을 모두 파악할 수 있도록 수정.

---

## 수정 대상 파일
- `/Users/marklin/workspace/my-profile-site/index.html` (Hero + Skills 수정)
- `/Users/marklin/workspace/my-profile-site/PLAN.md` (플랜 파일 신규 생성)

---

## 변경 범위

### 1. HTML (line 213–217)
기존 단일 `div#typingText` → 세 개의 `div.role-line` 으로 교체

```html
<div class="roles-container mb-8">
  <div class="role-line role-gradient"><span class="role-text"></span><span class="cursor">|</span></div>
  <div class="role-line role-gradient"><span class="role-text"></span><span class="cursor hidden">|</span></div>
  <div class="role-line role-gradient"><span class="role-text"></span><span class="cursor hidden">|</span></div>
</div>
```

### 2. CSS
- `.role-line`: 각 줄 높이 확보 (`min-height: 1.2em`), 줄 간격 `mb-2`
- `.cursor`: 깜빡임 애니메이션 (`blink 0.75s step-end infinite`)
- 기존 `typing 4s steps(40...)` 키프레임은 **그대로 유지** (cursor 깜빡임에 재사용)
- 기존 단일 `.typing-text` 클래스 제거

### 3. JavaScript
기존 `updateRole` + `setInterval` 제거 후, 순차 타이핑 함수로 교체:

```js
const roles = ['Data Scientist', 'Full Stack Developer', 'ML Engineer'];

function typeRole(lineIndex, text, cb) {
  const lines = document.querySelectorAll('.role-line');
  const textSpan = lines[lineIndex].querySelector('.role-text');
  const cursor  = lines[lineIndex].querySelector('.cursor');
  cursor.classList.remove('hidden');
  let i = 0;
  const timer = setInterval(() => {
    textSpan.textContent += text[i++];
    if (i === text.length) {
      clearInterval(timer);
      if (cb) cb();       // 다음 줄 시작
      // 마지막 줄이면 커서 계속 깜빡임, 중간 줄은 커서 숨김
      if (cb) cursor.classList.add('hidden');
    }
  }, 60); // 글자당 60ms
}

// 페이지 로드 후 순차 실행
typeRole(0, roles[0], () =>
  setTimeout(() => typeRole(1, roles[1], () =>
    setTimeout(() => typeRole(2, roles[2], null), 200)
  ), 200)
);
```

---

## 애니메이션 흐름
1. **Line 1** `Data Scientist` 타이핑 완료 → cursor 숨김
2. 200ms 후 **Line 2** `Full Stack Developer` 타이핑 완료 → cursor 숨김
3. 200ms 후 **Line 3** `ML Engineer` 타이핑 완료 → cursor 계속 깜빡임

---

## 추가 변경: Skills 섹션 — PyTorch 카드 추가

### 변경 위치
`index.html` Skills 섹션 (line 309–337): Python 카드 바로 아래에 PyTorch 카드 삽입

### 현재 구성 (3개 카드)
- Python
- SQL & Databases
- Full Stack

### 변경 후 구성 (4개 카드)
- Python
- **PyTorch** ← 신규 추가 (Meta에서 주로 사용하는 ML 라이브러리)
- SQL & Databases
- Full Stack

### PyTorch 카드 내용
```html
<div class="skill-card">
  <i class="devicon-pytorch-plain text-5xl" style="color: #64ffda;"></i>
  <h3 class="text-2xl font-bold text-white mt-4 mb-3">PyTorch</h3>
  <p class="text-gray-400">
    Deep learning framework used extensively at Meta for training and deploying neural network models at scale.
  </p>
</div>
```

### Grid 레이아웃 조정
4개가 되므로 `grid md:grid-cols-3` → `grid md:grid-cols-2 lg:grid-cols-4` 또는 `md:grid-cols-4`로 변경

---

## Verification
1. `index.html` 브라우저로 열기
2. Hero 섹션: 페이지 로드 시 세 줄이 순서대로 타이핑되는지 확인
3. 마지막 줄(ML Engineer) 완성 후 커서만 깜빡이는지 확인
4. Skills 섹션: Python, PyTorch, SQL, Full Stack 4개 카드가 보이는지 확인
5. PyTorch 아이콘이 정상 렌더링되는지 확인
6. 모바일 폭(375px)에서 레이아웃 확인
