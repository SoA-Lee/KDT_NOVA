-- 1. 모든 사용자 조회
SELECT * FROM users;

-- 2. 나이가 25세 이상인 사용자 조회
SELECT * FROM users WHERE age >= 25;

-- 3. 사용자별 게시글 수 조회
SELECT u.name, COUNT(p.id) AS 게시글수
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id, u.name;

-- 4. 조회수가 가장 높은 게시글 조회
SELECT * FROM posts ORDER BY views DESC LIMIT 1;

-- 5. 게시글이 2개 이상인 사용자 조회
SELECT u.name, COUNT(p.id) AS 게시글수
FROM users u
INNER JOIN posts p ON u.id = p.user_id
GROUP BY u.id, u.name
HAVING COUNT(p.id) >= 2;

-- 6. 평균 나이보다 많은 사용자 조회
SELECT * FROM users
WHERE age > (SELECT AVG(age) FROM users);

-- 7. 모든 사용자의 나이를 1살 증가
UPDATE users SET age = age + 1;

-- 8. 조회수가 10 미만인 게시글 삭제
DELETE FROM posts WHERE views < 10;