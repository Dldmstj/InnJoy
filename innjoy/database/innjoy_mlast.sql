-- 외래 키(Foreign Key) 제약 조건 해제
--ALTER TABLE review_comm DROP CONSTRAINT FK_review_TO_review_comm_1;
--ALTER TABLE report DROP CONSTRAINT FK_recomm_comm_TO_report_1;
--ALTER TABLE report DROP CONSTRAINT FK_recomm_TO_report_1;
--ALTER TABLE report DROP CONSTRAINT FK_review_TO_report_1;
--ALTER TABLE recomm_comm DROP CONSTRAINT FK_ij_user_TO_recomm_comm_1;
--ALTER TABLE recomm_comm DROP CONSTRAINT FK_recomm_TO_recomm_comm_1;
--
--ALTER TABLE recomm DROP CONSTRAINT FK_reservation_TO_recomm_1;
--ALTER TABLE reservation DROP CONSTRAINT FK_product_TO_reservation_1;
--ALTER TABLE reservation DROP CONSTRAINT FK_ij_user_TO_reservation_1;
--
--
--
--ALTER TABLE product DROP CONSTRAINT FK_pro_type_id_TO_product_1;
--ALTER TABLE product DROP CONSTRAINT FK_bsn_user_TO_product_1;
--ALTER TABLE pro_img DROP CONSTRAINT FK_product_TO_pro_img_1;
--
--
--
--ALTER TABLE notice DROP CONSTRAINT FK_admin_TO_notice_1;
--ALTER TABLE board_img DROP CONSTRAINT FK_recomm_TO_board_img_1;
--ALTER TABLE review_img DROP CONSTRAINT FK_review_TO_review_img_1;

SELECT * FROM recomm WHERE reservation_id=107;
SELECT * FROM recomm;
SELECT * FROM board_img;




-- 테이블 삭제
DROP TABLE pay;
DROP TABLE review_comm;
DROP TABLE report;
DROP TABLE notice;
DROP TABLE res_cancle;
DROP TABLE review_img;
DROP TABLE board_img;
DROP TABLE pro_img;
DROP TABLE recomm_comm;
DROP TABLE recomm;
DROP TABLE review;
DROP TABLE reservation;
DROP TABLE room_img;
DROP TABLE room;
DROP TABLE PRO_IMG ;
DROP TABLE product;
DROP TABLE pro_type_id;
DROP TABLE BSN_USER;
DROP TABLE ij_user;
DROP TABLE admin;


--DROP SEQUENCE review_id_seq;
--DROP SEQUENCE recomm_id_seq;
--DROP SEQUENCE rc_com_id_seq;
--DROP SEQUENCE reservation_id_seq;
--DROP SEQUENCE pro_id_10000_seq;
--DROP SEQUENCE pro_id_20000_seq;
--DROP SEQUENCE pro_id_30000_seq;
--DROP SEQUENCE pImg_seq;
--DROP SEQUENCE bImg_seq;
--DROP SEQUENCE rvImg_seq;
--DROP SEQUENCE rImg_seq;
--DROP SEQUENCE nt_no_seq;
--DROP SEQUENCE chat_room_se;
--DROP SEQUENCE chat_message_se;




--SELECT * FROM ij_user;
--SELECT * FROM BSN_USER;
--SELECT * FROM bsn_user;
--SELECT *FROM review;
--SELECT * FROM recomm;
--SELECT * FROM recomm_comm;
--SELECT * FROM product;
--SELECT * FROM reservation;
--SELECT * FROM report;
--SELECT * FROM review_comm;
--SELECT *FROM pay;
--SELECT *FROM res_cancle;
--SELECT *FROM notice;
--SELECT *FROM admin;
--SELECT *FROM pro_img;
--SELECT * FROM board_img;
--SELECT * FROM review_img;
--SELECT * FROM pro_type_id;

