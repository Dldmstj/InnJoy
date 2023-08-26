CREATE TABLE board(

);

CREATE SEQUENCE _seq;

--기본 계층적 조회
SELECT *
FROM (
	SELECT rownum cnt, LEVEL, b.*
	FROM board b
	WHERE subject LIKE '%'||''||'%'
	AND writer LIKE '%'||''||'%'
	START WITH refno = 0
	CONNECT BY PRIOR NO = refno
	ORDER siblings BY NO DESC)
WHERE cnt BETWEEN 1 AND 10;

CREATE TABLE pro_img(
	NO NUMBER PRIMARY KEY,
	pro_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(pro_id) REFERENCES product(pro_id)
);

CREATE TABLE review_img(
	NO NUMBER PRIMARY KEY,
	review_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(review_id) REFERENCES review(review_id)
);

CREATE TABLE board_img(
	NO NUMBER PRIMARY KEY,
	board_id NUMBER,
	fname varchar2(100),
	uptdte DATE,
	FOREIGN KEY(board_id) REFERENCES board(board_id)
);

Select count(*) from Ij_User where user_id = 'eunser830';

-- 예약 정보 조회
SELECT * FROM reservation r
JOIN room rm ON r.room_id = rm.room_id
JOIN product p ON rm.pro_id = p.pro_id
WHERE  r.user_id = 'dmstj333';

-- 댓글 정보 조회
SELECT * FROM recomm rec, recomm_comm com
WHERE com.user_id = 'ekdms222'
AND rec.recom_id = com.recom_id;

-- 내가 쓴 게시물 조회
SELECT * FROM ij_user u
JOIN reservation r ON u.user_id = r.user_id
JOIN recomm rc ON r.reservation_id = rc.reservation_id
WHERE  u.user_id = 'dmstj333';
