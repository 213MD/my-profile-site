# Nutrition-Eda 프로젝트

## 프로젝트 개요
Eda(영양학 전문 친구)의 도메인 지식을 기반으로 한 **개인 맞춤형 식단 추천 웹사이트**.
사용자의 신체 정보와 건강 목표를 입력하면 PyTorch 모델이 최적의 식단을 추천한다.

## 기술 스택
| 영역 | 기술 |
|------|------|
| Frontend | React |
| Backend | FastAPI (Python) |
| AI/ML | PyTorch |
| Database | SQLite (liteSQL) |

## 핵심 기능
1. **사용자 프로필** — 나이, 성별, 몸무게, 키, 건강 목표(체중감량/근육증가/유지)
2. **식단 추천** — PyTorch 모델 기반 개인 맞춤 추천
3. **음식 데이터베이스** — SQLite로 음식별 영양소(칼로리, 단백질, 탄수화물, 지방) 저장
4. **히스토리** — 추천 식단 저장 및 조회

## 프로젝트 구조
```
Nutrition-Eda/
├── frontend/        # React 웹 클라이언트
├── backend/         # FastAPI 서버
│   ├── main.py
│   ├── routers/     # API 라우터
│   └── models/      # Pydantic 모델
├── ml/              # PyTorch 추천 모델
│   ├── model.py
│   └── train.py
├── database/        # SQLite DB 및 스키마
│   └── schema.sql
├── data/            # 영양소/음식 데이터셋 (Eda 제공)
└── rules/
    └── CLAUDE.md
```

## 개발 규칙
- 한글 주석 필수
- 커밋 메시지는 한글로 작성
- 커밋 전 반드시 린트 실행
- Eda의 영양학 조언을 `data/` 폴더에 문서화하여 관리

## 도메인 지식 (Eda 제공)
- 영양소 구성 및 권장 섭취량 기준
- 건강 목표별 식단 패턴
- 음식 궁합 및 식품 데이터 기준