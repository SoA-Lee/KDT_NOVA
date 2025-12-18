# Docker 설치 가이드 (Windows)

본 문서는 **Windows 환경에서 Docker가 설치되어 있지 않은 학생**을 위한 가이드입니다.  
실습에서는 Docker를 사용하여 MySQL 데이터베이스를 실행합니다.

---

## ✅ 사전 확인 사항 (중요)

Docker는 **리눅스 기반 기술**이기 때문에  
Windows에서는 **WSL2 (Windows Subsystem for Linux)** 가 필요합니다.

아래 순서대로 진행하세요.

---

## 1️⃣ Windows 버전 확인

Docker Desktop은 아래 환경에서만 동작합니다.

- Windows 10 (버전 2004 이상)
- Windows 11

확인 방법:
1. `윈도우 키 + R`
2. `winver` 입력 후 Enter

---

## 2️⃣ WSL2 설치

### 📌 WSL이란?
> Windows에서 리눅스를 실행할 수 있게 해주는 기능입니다.  
> Docker는 이 리눅스 환경 위에서 실행됩니다.

---

### 🔹 2-1. PowerShell 관리자 권한 실행

1. **윈도우 키**
2. `PowerShell` 검색
3. **우클릭 → 관리자 권한으로 실행**

---

### 🔹 2-2. WSL 설치 명령 실행

```powershell
wsl --install

🔍 이 명령이 하는 일
	•	WSL 기능 활성화
	•	기본 리눅스 배포판(Ubuntu) 설치
	•	WSL2 설정

⸻

🔹 2-3. 설치 후 재부팅

⚠️ 반드시 재부팅 필요

⸻

🔹 2-4. WSL 버전 확인

재부팅 후 PowerShell에서 실행:

wsl -l -v

정상 결과 예시:

NAME      STATE   VERSION
Ubuntu    Running 2

👉 VERSION이 2여야 합니다.

⸻

3️⃣ Docker Desktop 설치

🔹 3-1. Docker Desktop 다운로드

아래 링크 접속 후 Windows용 Docker Desktop 다운로드

👉 https://www.docker.com/products/docker-desktop/

⸻

🔹 3-2. 설치 진행
	•	기본 옵션 그대로 설치
	•	설치 중 WSL2 관련 옵션 체크 유지

⸻

🔹 3-3. 설치 완료 후 재부팅 (권장)

⸻

4️⃣ Docker Desktop 실행 확인

🔹 Docker Desktop 실행
	•	시작 메뉴 → Docker Desktop 실행
	•	상태가 아래처럼 나오면 정상

Docker Desktop is running


⸻

🔹 PowerShell에서 Docker 명령어 확인

docker --version

정상 예시:

Docker version x.x.x


⸻

5️⃣ Docker 정상 동작 테스트

아래 명령어를 실행하세요.

docker run hello-world

🔍 이 명령어 설명
	•	Docker가 정상적으로 실행되는지 확인하는 테스트 컨테이너 실행

정상 결과 예시:

Hello from Docker!
This message shows that your installation appears to be working correctly.


⸻

6️⃣ MySQL 컨테이너 실행 (실습용)

🔹 MySQL 컨테이너 실행

docker run -d \
  --name mysql-container \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=1234 \
  -e MYSQL_DATABASE=sitesafety_db \
  mysql:8.0

🔍 옵션 설명

옵션	설명
-d	백그라운드 실행
--name	컨테이너 이름
-p 3306:3306	로컬 포트 ↔ 컨테이너 포트 연결
MYSQL_ROOT_PASSWORD	MySQL root 비밀번호
MYSQL_DATABASE	초기 생성 DB
mysql:8.0	MySQL 이미지


⸻

7️⃣ 컨테이너 실행 확인

docker ps

정상 예시:

CONTAINER ID   NAME        STATUS
xxxxxx         mysql-container  Up


⸻

8️⃣ MySQL 접속 확인

docker exec -it mysql-container mysql -u root -p

비밀번호:

1234

정상 접속 시:

mysql>