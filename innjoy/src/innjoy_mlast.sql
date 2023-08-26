-- 외래 키(Foreign Key) 제약 조건 해제
ALTER TABLE review_comm DROP CONSTRAINT FK_review_TO_review_comm_1;
ALTER TABLE report DROP CONSTRAINT FK_recomm_comm_TO_report_1;
ALTER TABLE report DROP CONSTRAINT FK_recomm_TO_report_1;
ALTER TABLE report DROP CONSTRAINT FK_review_TO_report_1;
ALTER TABLE recomm_comm DROP CONSTRAINT FK_ij_user_TO_recomm_comm_1;
ALTER TABLE recomm_comm DROP CONSTRAINT FK_recomm_TO_recomm_comm_1;

ALTER TABLE recomm DROP CONSTRAINT FK_reservation_TO_recomm_1;
ALTER TABLE reservation DROP CONSTRAINT FK_product_TO_reservation_1;
ALTER TABLE reservation DROP CONSTRAINT FK_ij_user_TO_reservation_1;



ALTER TABLE product DROP CONSTRAINT FK_pro_type_id_TO_product_1;
ALTER TABLE product DROP CONSTRAINT FK_bsn_user_TO_product_1;
ALTER TABLE pro_img DROP CONSTRAINT FK_product_TO_pro_img_1;



ALTER TABLE notice DROP CONSTRAINT FK_admin_TO_notice_1;
ALTER TABLE board_img DROP CONSTRAINT FK_recomm_TO_board_img_1;
ALTER TABLE review_img DROP CONSTRAINT FK_review_TO_review_img_1;

-- 테이블 삭제
DROP TABLE pro_type_id;
DROP TABLE admin;
DROP TABLE notice;
DROP TABLE res_cancle;
DROP TABLE pay;
DROP TABLE review_comm;
DROP TABLE report;
DROP TABLE review_img;
DROP TABLE board_img;
DROP TABLE pro_img;
DROP TABLE product;
DROP TABLE recomm_comm;
DROP TABLE recomm;
DROP TABLE review;
DROP TABLE reservation;
DROP TABLE BSN_USER ;

SELECT * FROM ij_user;
SELECT * FROM BSN_USER bu ;
SELECT * FROM bsn_user;
SELECT *FROM review;
SELECT * FROM recomm;
SELECT * FROM recomm_comm;
SELECT * FROM product;
SELECT * FROM reservation;
SELECT * FROM report;
SELECT * FROM review_comm;
SELECT *FROM pay;
SELECT *FROM res_cancle;
SELECT *FROM notice;
SELECT *FROM admin;
SELECT *FROM pro_img;
SELECT * FROM board_img;
SELECT * FROM review_img;
SELECT * FROM pro_type_id;

