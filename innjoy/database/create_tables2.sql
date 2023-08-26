CREATE TABLE ij_user (
   user_id   varchar2(20)   NOT NULL,
   user_pass   varchar2(30)   NULL,
   user_name   varchar2(20)   NULL,
   user_phone   varchar2(30)   NULL,
   email   varchar2(50)   NULL,
   n_name   varchar2(20)   NULL,
   auth   varchar2(20)   NULL
);

CREATE TABLE bsn_user (
   bsn_id   varchar2(20)   NOT NULL,
   bsn_pass   varchar2(30)   NOT NULL,
   bsn_name   varchar2(30)   NOT NULL,
   bsn_number   number   NULL,
   ceo_name   varchar2(20)   NOT NULL,
   bsn_phone   varchar2(20)   NULL,
   bsn_email   varchar2(50)   NULL
);

CREATE TABLE review (
   review_id   number   NOT NULL,
   star   number   NULL,
   review_det   varchar2(1000)   NULL,
   rev_time   date   NULL,
   rev_photo   varchar2(200)   NULL,
   reservation_id   number   NOT NULL
);

CREATE TABLE recomm (
   recom_id   number   NOT NULL,
   title   varchar2(100)   NULL,
   detail   varchar2(1000)   NULL,
   recom_loc   varchar2(100)   NULL,
   recom_time   date   NULL,
   rec_photo   varchar2(100)   NULL,
   reservation_id   number   NOT NULL
);

CREATE TABLE recomm_comm (
   rc_com_id   number   NOT NULL,
   recom_id   number   NOT NULL,
   user_id   varchar2(50)   NOT NULL,
   rc_com_det   varchar2(500)   NULL,
   rc_com_time   date   NULL
);

CREATE TABLE product (
   pro_id   number   NOT NULL,
   bsn_id   varchar2(20)   NOT NULL,
   pro_type_id   number   NOT NULL,
   pro_name   varchar2(30)   NOT NULL,
   pro_loc   CLOB   NULL,
   basic_info   CLOB   NULL,
   res_ann   CLOB   NULL,
   ser_conts   CLOB   NULL
);


DROP TABLE product;
DROP TABLE room;

CREATE SEQUENCE pro_id_seq
   START WITH 10000
   INCREMENT BY 1
   NOCACHE
   NOCYCLE;
  
CREATE SEQUENCE room_id_seq
   START WITH 1
   INCREMENT BY 1
   NOCACHE
   NOCYCLE;
   
INSERT ALL
    INTO product (pro_id, bsn_id, pro_type_id, pro_name, pro_loc, basic_info, res_ann, ser_conts)
    VALUES (pro_id_seq.nextval, 'sojeong001', 10000, '테스트숙소', '위치', 'basic info', 'reservation announcement', 'service contents')
    INTO room (room_id, room_name, room_price, checkin, checkout, min_cnt, max_cnt, smoking, bed_cnt, pro_id)
    VALUES (room_id_seq.nextval, '방이름', 325000, '10:00', '10:00', 2, 4, '흡연', 5, pro_id_seq.currval)
SELECT * FROM dual;

SELECT * FROM room;
SELECT * FROM product;

CREATE TABLE reservation (
   reservation_id   number   NOT NULL,
   user_id   varchar2(20)   NOT NULL,
   pro_id   number   NOT NULL,
   user_cnt   number   NULL,
   start_dt   date   NULL,
   end_dt   date   NULL,
   payment   number   NULL
);

CREATE TABLE report (
   report_id   number   NOT NULL,
   review_id   number   NULL,
   recom_id   number   NULL,
   rc_com_id   number   NULL,
   report_type   varchar2(100)   NOT NULL,
   report_det   varchar2(500)   NULL,
   url   varchar2(500)   NOT NULL,
   rep_time   Date   NOT NULL
);

CREATE TABLE review_comm (
   rv_com_id   number   NOT NULL,
   review_id   number   NOT NULL,
   rv_com_det   varchar2(500)   NULL,
   rv_com_time   date   NULL
);

CREATE TABLE pay (
   pay_id   number   NOT NULL,
   reservation_id   number   NOT NULL,
   pay_price   number   NULL,
   pay_type   varchar2(100)   NULL,
   pay_time   date   NULL
);

CREATE TABLE res_cancle (
   cancle_id   number   NOT NULL,
   reservation_id   number   NOT NULL,
   cancle_reason   varchar2(300)   NULL
);

CREATE TABLE notice (
   not_id   number   NOT NULL,
   adm_id   varchar2(20)   NOT NULL,
   not_title   varchar2(100)   NOT NULL,
   not_detail   varchar2(1000)   NOT NULL,
   not_date   Date   NOT NULL,
   not_readcnt   number   NULL
);

CREATE TABLE admin (
   adm_id   varchar2(20)   NOT NULL,
   adm_pass   varchar2(30)   NOT NULL
);

CREATE TABLE pro_img (
   no   number   NOT NULL,
   pro_id   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL
);

CREATE TABLE board_img (
   no   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL,
   recom_id   number   NOT NULL
);

CREATE TABLE review_img (
   no   number   NOT NULL,
   fname   varchar2(300)   NULL,
   updte   date   NULL,
   review_id   number   NOT NULL
);

CREATE TABLE pro_type_id (
   pro_type_id   number   NOT NULL,
   pro_type   varchar2(20)   NULL
);

CREATE TABLE room (
   room_id   number   NOT NULL,
   room_name   varchar2(30)   NULL,
   room_price   number   NULL,
   checkin   varchar2(30)   NULL,
   checkout   varchar2(30)   NULL,
   min_cnt   number   NULL,
   max_cnt   number   NULL,
   smoking   varchar2(30)   NULL,
   bed_cnt   CLOB   NULL,
   pro_id   number   NOT NULL
);

ALTER TABLE ij_user ADD CONSTRAINT PK_IJ_USER PRIMARY KEY (
   user_id
);

ALTER TABLE bsn_user ADD CONSTRAINT PK_BSN_USER PRIMARY KEY (
   bsn_id
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
   review_id
);

ALTER TABLE recomm ADD CONSTRAINT PK_RECOMM PRIMARY KEY (
   recom_id
);

ALTER TABLE recomm_comm ADD CONSTRAINT PK_RECOMM_COMM PRIMARY KEY (
   rc_com_id
);

ALTER TABLE product ADD CONSTRAINT PK_PRODUCT PRIMARY KEY (
   pro_id
);

ALTER TABLE reservation ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (
   reservation_id
);

ALTER TABLE report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
   report_id
);

ALTER TABLE review_comm ADD CONSTRAINT PK_REVIEW_COMM PRIMARY KEY (
   rv_com_id
);

ALTER TABLE pay ADD CONSTRAINT PK_PAY PRIMARY KEY (
   pay_id
);

ALTER TABLE res_cancle ADD CONSTRAINT PK_RES_CANCLE PRIMARY KEY (
   cancle_id
);

ALTER TABLE notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
   not_id
);

ALTER TABLE admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
   adm_id
);

ALTER TABLE pro_img ADD CONSTRAINT PK_PRO_IMG PRIMARY KEY (
   no
);

ALTER TABLE board_img ADD CONSTRAINT PK_BOARD_IMG PRIMARY KEY (
   no
);

ALTER TABLE review_img ADD CONSTRAINT PK_REVIEW_IMG PRIMARY KEY (
   no
);

ALTER TABLE pro_type_id ADD CONSTRAINT PK_PRO_TYPE_ID PRIMARY KEY (
   pro_type_id
);

ALTER TABLE room ADD CONSTRAINT PK_ROOM PRIMARY KEY (
   room_id
);

SELECT pro_id_seq.nextval FROM dual;
SELECT room_id_seq.nextval FROM dual;

