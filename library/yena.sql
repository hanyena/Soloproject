SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS boardfile;
DROP TABLE IF EXISTS boardreply;
DROP TABLE IF EXISTS boardcontent;
DROP TABLE IF EXISTS boardlist;
DROP TABLE IF EXISTS cdnfileimage;
DROP TABLE IF EXISTS library;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS rentlibrary;




/* Create Tables */

-- 게시판 내용
CREATE TABLE boardcontent
(
	no int NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
	boardlist_no int NOT NULL COMMENT '게시판 번호',
	member_id varchar(10) NOT NULL COMMENT '회원 ID',
	title varchar(200) COMMENT '게시글 제목',
	content varchar(2000) COMMENT '게시글 내용',
	regname varchar(5) COMMENT '게시글 작성자',
	regdate datetime COMMENT '게시글 작성일',
	ip varchar(20) COMMENT '게시글 작성자ip',
	cnt int DEFAULT 0 COMMENT '게시글 조회수',
	del_YN varchar(1) DEFAULT 'N' COMMENT '게시글 삭제여부',
	PRIMARY KEY (no)
) COMMENT = '게시판 내용';


-- 게시판파일업로드
CREATE TABLE boardfile
(
	no int NOT NULL AUTO_INCREMENT COMMENT '번호',
	boardcontent_no int NOT NULL COMMENT '게시글 번호',
	orgfilename varchar(2000) COMMENT '원본파일이름',
	shortfilename varchar(2000) COMMENT '짧은파일이름',
	encryptfilename varchar(2000) COMMENT '암호화파일이름',
	filesize varchar(2000) COMMENT '파일용량',
	filepath varchar(2000) COMMENT '파일경로',
	regdate datetime COMMENT '파일생성일',
	del_YN varchar(1) DEFAULT 'N' COMMENT '게시판파일삭제여부',
	PRIMARY KEY (no)
) COMMENT = '게시판파일업로드';


-- 게시판 목록
CREATE TABLE boardlist
(
	no int NOT NULL AUTO_INCREMENT COMMENT '게시판 번호',
	type varchar(10) COMMENT '게시판종류',
	title varchar(20) COMMENT '게시판 제목',
	del_YN varchar(1) DEFAULT 'N' COMMENT '게시글 삭제여부',
	PRIMARY KEY (no)
) COMMENT = '게시판 목록';


-- 게시판 덧글
CREATE TABLE boardreply
(
	no int NOT NULL AUTO_INCREMENT COMMENT '게시글 덧글 번호',
	boardcontent_no int NOT NULL COMMENT '게시글 번호',
	member_id varchar(10) NOT NULL COMMENT '회원 ⁯ID',
	content varchar(1000) DEFAULT '''''' COMMENT '덧글 내용',
	regname varchar(5) DEFAULT '''''' COMMENT '덧글 작성자',
	regdate datetime COMMENT '덧글 작성일',
	ip varchar(20) DEFAULT '''''' COMMENT '덧글 아이피',
	ref int COMMENT '덧글그루',
	reflevel int COMMENT '덧글순서',
	refstep int COMMENT '덧글DEPT',
	del_YN varchar(1) DEFAULT '''N''' COMMENT '회원 삭제여부',
	PRIMARY KEY (no)
) COMMENT = '게시판 덧글';


-- 게시판CK에디터 이미지 업로드
CREATE TABLE cdnfileimage
(
	no int NOT NULL AUTO_INCREMENT COMMENT '번호',
	orgfilename varchar(2000) COMMENT '원본파일이름',
	shortfilename varchar(2000) COMMENT '짧은파일이름',
	encryptfilename varchar(2000) COMMENT '암호화파일이름',
	filesize varchar(2000) COMMENT '파일용량',
	filepath varchar(2000) COMMENT '파일경로',
	regdate datetime COMMENT '파일생성일',
	del_YN varchar(1) DEFAULT 'N' COMMENT '파일이미지 삭제여부',
	PRIMARY KEY (no)
) COMMENT = '게시판CK에디터 이미지 업로드';


-- 도서목록
CREATE TABLE library
(
	no int NOT NULL AUTO_INCREMENT COMMENT '대여번호',
	title varchar(2000) COMMENT '책 제목',
	link varchar(2000) COMMENT '네이버 구매 링크',
	image varchar(2000) COMMENT '책 이미지',
	author varchar(2000) COMMENT '저자',
	price varchar(2000) COMMENT '가격',
	discountprice varchar(2000) COMMENT '할인가격',
	publisher varchar(2000) COMMENT '출판사',
	pubdate datetime COMMENT '출판일',
	isbn varchar(2000) NOT NULL COMMENT '책 고유번호',
	description varchar(2000) COMMENT '내용',
	cnt int DEFAULT 0 COMMENT '도서보유수량',
	rentcnt int DEFAULT 0 COMMENT '대여갯수',
	del_YN varchar(1) DEFAULT 'N' COMMENT '삭제여부',
	PRIMARY KEY (no)
) COMMENT = '도서목록';


-- 회원
CREATE TABLE member
(
	id varchar(10) NOT NULL COMMENT '회원 ⁯ID',
	type int NOT NULL COMMENT '회원 로그인 종류(NAVER :1/ 그외 :2)',
	password varchar(2000) COMMENT '비밀번호',
	email varchar(200) COMMENT '회원 이메일',
	username varchar(7) COMMENT '회원 이름',
	address varchar(1000) COMMENT '회원 주소',
	phone varchar(13) COMMENT '회원 연락처',
	gender varchar(1) COMMENT '성별',
	regdate datetime COMMENT '회원 가입일',
	ip varchar(20) COMMENT '회원Ip',
	token varchar(2000) COMMENT '회원로그인토큰(SNS)',
	del_YN varchar(1) DEFAULT 'N' COMMENT '회원 삭제여부',
	PRIMARY KEY (id),
	UNIQUE (id)
) COMMENT = '회원';


-- 도서목록
CREATE TABLE rentlibrary
(
	no int NOT NULL AUTO_INCREMENT COMMENT '대여번호',
	PRIMARY KEY (no)
) COMMENT = '도서목록';



/* Create Foreign Keys */

ALTER TABLE boardfile
	ADD FOREIGN KEY (boardcontent_no)
	REFERENCES boardcontent (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardreply
	ADD FOREIGN KEY (boardcontent_no)
	REFERENCES boardcontent (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardcontent
	ADD FOREIGN KEY (boardlist_no)
	REFERENCES boardlist (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardcontent
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardreply
	ADD FOREIGN KEY (member_id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



