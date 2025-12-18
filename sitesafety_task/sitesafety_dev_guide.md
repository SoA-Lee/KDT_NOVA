 🛠️ KDT NOVA 실습 과제  
## 안전관제 – 현장 등록 API 구현

---

## 📌 과제 개요

안전관제 서비스에서 사용하는 **현장(SiteInfo) 정보 등록 API**를 구현한다.  
현장 코드는 **지역/도시별 일련번호 규칙**에 따라 자동 생성되며,  
번호 생성과 현장 등록은 **하나의 트랜잭션**으로 처리되어야 한다.

본 과제는 단순 CRUD를 넘어,  
**조회 → 계산 → 업데이트 → 등록**의 전체 흐름을 이해하는 것을 목표로 한다.

---

## 🎯 학습 목표

- MyBatis 기반 SQL 작성
- 트랜잭션(@Transactional)의 필요성 이해
- 코드 생성 규칙 설계 경험
- DB 상태를 고려한 API 구현

---

## 📍 API 명세

### 현장 등록 API

```http
SS090102 POST /sitesafety/v1/sites

📥 Request Body

{ 
  "siteName": "광명센트럴 아이파크",
  "regionCode": "01",
  "cityCode": "02",
  "address": " 경기도 광명시 일직동 ",
  "latitude": " 37.123456 ",
  "longitude": " 127.123456 "
}

📤 Response
	•	성공 시: 201 Created
	•	Response Body 없음


⸻

🗄️ 사용 테이블

좋은 포인트 👍
지금 테이블 구조가 실제 DDL 기준이랑 조금 달라서,
👉 과제 설명(README) 쪽 테이블 설명 문구를 현실에 맞게 보정해주는 게 맞아.

아래는 학생용 과제 설명에 그대로 써도 되는 테이블 설명 버전이야.
(DDL은 안 바꾸고, 의미/역할 설명만 정리)

⸻

🗄️ 테이블 설명 (Revised)

⸻

1️⃣ T_SITE_CODE

지역/도시 코드 및 현장 일련번호 관리 테이블

각 지역(REGION) + 도시(CITY) 조합별로
마지막으로 사용된 현장 일련번호(LAST_SERIAL_NUM) 를 관리한다.

현장 등록 시, 이 테이블을 기준으로 다음에 사용할 일련번호를 계산한다.

컬럼 설명

컬럼명	타입	설명
ID	int	내부 식별용 ID
REGION_CODE	varchar(2)	지역 코드
REGION_NAME	varchar(255)	지역명
CITY_CODE	varchar(2)	도시 코드
CITY_NAME	varchar(255)	도시명
LAST_SERIAL_NUM	int unsigned	해당 지역/도시의 마지막 현장 일련번호

📌 역할 요약
	•	현장 코드 생성 시 기준 테이블
	•	LAST_SERIAL_NUM을 조회 → 증가 → UPDATE 해야 함
	•	현장 등록 API의 핵심 테이블

⸻

2️⃣ T_SITE_INFO

안전관제 현장 기본 정보 테이블

실제 안전관제 대상이 되는 현장(SiteInfo) 의 기본 정보를 저장한다.

컬럼 설명

컬럼명	타입	설명
SITE_CODE	varchar(10)	현장 코드 (API에서 생성)
SITE_NAME	varchar(255)	현장명
ADDRESS	varchar(255)	주소
LATITUDE	varchar(100)	위도
LONGITUDE	varchar(100)	경도
AI_PORT	varchar(8)	AI 서버 포트
CAM_SERIAL_NUM	int unsigned	카메라 일련번호
CRT_DTIME	datetime	생성 일시
CRT_ID	varchar(20)	생성자 ID
MOD_DTIME	datetime	수정 일시
MOD_ID	varchar(20)	수정자 ID
GRID_X	varchar(5)	격자 X 좌표
GRID_Y	varchar(5)	격자 Y 좌표

📌 역할 요약
	•	실제 현장 정보 저장 테이블
	•	SITE_CODE는 중복되면 안 됨
	•	현장 등록 API에서 INSERT 대상 테이블

⸻

🧠 핵심 구현 조건

✅ 1️⃣ siteCode 생성 규칙

ss + regionCode + cityCode + 0 + 일련번호

예시
	•	regionCode: 01
	•	cityCode: 02
	•	마지막 일련번호: 5

➡️ 생성 결과

ss010206

⸻

✅ 2️⃣ 일련번호 처리 로직 (필수)

현장 등록 시 아래 순서를 반드시 지켜야 한다.

1. T_SITE_CODE에서 마지막 일련번호 조회
2. 마지막 번호 + 1
3. 증가된 번호를 T_SITE_CODE에 UPDATE
4. 생성된 번호로 siteCode 생성
5. T_SITE_INFO에 INSERT

⚠️ UPDATE 로직이 누락 주의

⸻

✅ 3️⃣ 트랜잭션 처리
	•	위 1~5번 과정은 하나의 트랜잭션(@Transactional) 으로 처리해야 한다.
	•	중간 단계에서 오류가 발생하면 모든 작업은 롤백되어야 한다.

⸻

✅ 4️⃣ 예외 처리
	•	지역/도시 코드가 T_SITE_CODE에 존재하지 않는 경우
	•	적절한 예외(Exception) 발생
	•	siteCode 중복 발생 시
	•	에러 발생 및 트랜잭션 롤백

⸻

📂 구현 범위

아래 항목을 모두 구현해야 한다.

✔ Controller
	•	현장 등록 API

✔ Service
	•	일련번호 조회 / 증가 / 업데이트 / 현장 등록 로직

✔ Mapper Interface
	•	selectLastSerialNum 지역/도시 기준 마지막 일련번호 조회
	•	updateLastSerialNum 지역/도시별 마지막 시리얼 번호 업데이트
	•	insertSiteInfo 현장 정보 저장

✔ Mapper XML
	•	SELECT / UPDATE / INSERT SQL