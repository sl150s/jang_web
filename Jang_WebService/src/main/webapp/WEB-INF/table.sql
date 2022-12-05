-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
   id VARCHAR2(100) PRIMARY KEY,
   pwd VARCHAR2(100) NOT NULL,
   email VARCHAR2(100),
   profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
   regdate DATE
);

--게시글을 저장할 테이블
CREATE TABLE board_prop(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자(로그인된아이디
	title VARCHAR(100) NOT NULL, --제목
	content CLOB, --글내용
	viewCount NUMBER, --조회수
	regdate DATE -- 글 작성일 
); 

-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_prop_seq;


CREATE TABLE coment(
	num NUMBER PRIMARY KEY, --코멘트번호
	name VARCHAR2(100) NOT NULL, --코멘트 작성자
	coment VARCHAR2(100) NOT NULL, --코멘트 본문
	comentDate DATE --코멘트 작성일
);
-- 코멘트의 번호를 얻어낼 시퀀스
CREATE SEQUENCE coment_seq;