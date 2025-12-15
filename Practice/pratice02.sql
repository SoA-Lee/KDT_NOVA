-- 사용자 테이블
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT
);

INSERT INTO users (name, email, age) VALUES
('홍길동', 'hong@example.com', 25),
('김철수', 'kim@example.com', 23),
('이영희', 'lee@example.com', 27),
('박민수', 'park@example.com', 24),
('최지영', 'choi@example.com', 26);

-- 게시글 테이블
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    views INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO posts (user_id, title, content, views) VALUES
(1, '첫 번째 글', '내용1', 10),
(1, '두 번째 글', '내용2', 5),
(2, '세 번째 글', '내용3', 20),
(3, '네 번째 글', '내용4', 15);