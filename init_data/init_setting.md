# 실행 중인 컨테이너 확인
docker ps

# MySQL 컨테이너 접속
docker exec -it {mysql-container-name} bash

# MySQL 로그인
mysql -u root –p 1234

# 데이터베이스 생성
CREATE DATABASE sitesafety_db
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;


# 데이터 셋팅
docker exec -i {container 이름} mysql -u kdt_user -pkdt1234 sitesafety_db < init_data_sitesafety_db.sql
*Local : mysql -u kdt_user -pkdt1234 sitesafety_db < init_data_sitesafety_db.sql

