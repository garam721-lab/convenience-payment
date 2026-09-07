# Convenience Payment

편의점과 결제금액을 입력하면 결제수단별 할인 혜택을 조회하고,
가장 유리한 결제수단을 추천하는 서비스입니다.

## 프로젝트 소개

편의점에서 결제할 때 사용할 수 있는 다양한 결제수단의 할인 혜택을 조회하고,
결제금액을 기준으로 예상 할인액을 계산하여 가장 유리한 결제수단을 추천하는 서비스입니다.

본 프로젝트는 Oracle Database를 중심으로 데이터 모델링, SQL 작성 및
Python/FastAPI를 이용한 데이터베이스 연동을 실습하는 것을 목적으로 합니다.

## 주요 기능

- 편의점별 결제 혜택 조회
- 결제금액 입력
- 결제수단별 할인액 계산
- 할인액 기준 결제수단 정렬
- 가장 유리한 결제수단 추천

## 기술 스택

### Database
- Oracle Database 26ai Free

### Backend
- Python
- FastAPI
- oracledb
- python-dotenv

### Development
- Visual Studio Code
- Git
- GitHub

## Database 설계

### 테이블

- `STORE` : 편의점 정보
- `PAYMENT_METHOD` : 결제수단 정보
- `BENEFIT` : 편의점과 결제수단 간 할인 혜택 정보

### 관계

```text
STORE          PAYMENT_METHOD
  │                  │
  │ 1:N              │ 1:N
  ▼                  ▼
       BENEFIT
```

BENEFIT 테이블을 통해 편의점과 결제수단의 할인 혜택을 연결합니다.

## API

### GET /recommend

편의점과 결제금액을 입력받아 결제수단별 할인 혜택과
가장 유리한 결제수단을 반환합니다.

#### Parameters

| Parameter | Type | Description |
|---|---|---|
| `name` | string | 편의점 이름 |
| `amount` | integer | 결제금액 |

#### Example

```text
GET /recommend?name=GS25&amount=10000
```

#### Response

```json
{
  "store": "GS25",
  "amount": 10000,
  "best_method": "신한카드",
  "best_discount_amount": 1000,
  "recommendations": [
    {
      "method": "신한카드",
      "discount_rate": 10,
      "discount_amount": 1000
    },
    {
      "method": "토스페이",
      "discount_rate": 7,
      "discount_amount": 700
    },
    {
      "method": "네이버페이",
      "discount_rate": 5,
      "discount_amount": 500
    },
    {
      "method": "카카오페이",
      "discount_rate": 3,
      "discount_amount": 300
    }
  ]
}
```

## 실행 방법

### 1. Oracle Database 실행

Oracle Database 26ai Free를 실행합니다.

### 2. Python 패키지 설치

```text
python3 -m pip install oracledb fastapi uvicorn python-dotenv
```

### 3. 환경변수 설정

`.env` 파일에 Oracle 접속 정보를 설정합니다.

```text
ORACLE_USER=APP_USER
ORACLE_PASSWORD=YOUR_PASSWORD
ORACLE_DSN=localhost:1521/FREEPDB1
```

> `.env` 파일은 `.gitignore`에 등록하여 GitHub에 업로드하지 않습니다.

### 4. FastAPI 실행

```text
python3 -m uvicorn main:app --reload
```

API 문서:

```text
http://127.0.0.1:8000/docs
```

## 향후 개선 계획

- 다양한 장소로 서비스 범위 확장
- 실제 할인 조건 및 기간 반영
- 전월 실적 및 월 할인 한도 적용
- 데이터 무결성 및 제약조건 개선
- Index 설계 및 실행계획 분석
- SQL 성능 테스트 및 튜닝
- 대량 데이터 환경에서 성능 검증
- Backup / Recovery 실습
- DB Monitoring
- 운영 자동화
- Cloud Database 환경으로 확장