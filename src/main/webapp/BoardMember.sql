CREATE TABLE boardmember (
    num            NUMBER(4) PRIMARY KEY,
    user_id        VARCHAR2(20),
    user_name      VARCHAR2(30) NOT NULL,
    user_password  VARCHAR2(20) NOT NULL,
    mobile         VARCHAR2(20),
    email          VARCHAR2(60) NOT NULL,
    reg_date       DATE NOT NULL,
    u_level        NUMBER(1)
);

drop table boardmember;

CREATE SEQUENCE seq_board_member INCREMENT BY 1 START WITH 1 NOCYCLE;

DROP SEQUENCE seq_board_member;

    INSERT INTO boardmember VALUES (seq_board_member.NEXTVAL,'root', '관리자', '1234','010-1234-1234','ggg@naver.com' ,TO_DATE('2021-09-09', 'yyyy-mm-dd'), 2 );
    
    select * from boardmember;
    select user_id,user_password from boardmember where user_id = 'root' and user_password = '1234';
    commit;