
create table board(
num number(4) primary key,
writer varchar2(20) not null,
email varchar2(30),
subject varchar2(100) not null,
passwd varchar2(12) not null,
reg_date date not null,
readcount number(4) DEFAULT 0,
ref number(4) not null,
re_step number(2) not null,
re_level number(2) not null,
content varchar2(500) not null,
ip varchar2(20) not null
);

drop table board;

create sequence seq_board
increment by 1
start with 1
nocycle;

drop sequence seq_board;

select * from board;

commit;


-- 이성규 :  테스트 게시글 데이터 100개 3번 입력 후 임의 게시글 데이터 20개 1번 입력

insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '테스트 게시글 '||seq_board.nextval, '1234', TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '테스트 게시물 내용 '||seq_board.nextval, '0:0:0:0:0:0:0:1');



insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '[공지] 자유로운 게시판.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '비방글을 제외하고 마음껏 작성해 주세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '박신참', 'newbie@gmail.com', '정말 아무 글이나 작성해도 되나요?', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '신난다!', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '동물원', '00plant00@gmail.com', '자연 보호', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '저도 자연의 일부이니 보호해주세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '진범인', 'crime999@gmail.com', '저는 죄가 없습니다.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '이름으로 판단하지 말아주세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '게이머', 'game@gmail.com', '한 게임 합시다!', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '메이플 오목방 다 들어오세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '[공지] 도배 금지 입니다.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '도배 글 작성 시 제재 조치 취하겠습니다. ', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '도선생', 'crazy66@gmail.com', '저기 기운이 좋으시네요.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '저희 잠시 조상신 이야기 좀 나눌까요?', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '전문가', 'realpro@gmail.com', '이 분야의 전문가', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '맡겨 주십시오!', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '황예준', 'newbie@gmail.com', '잠이 솔솔 온다면', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '아르기닌을 드셔보세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '레이서', 'madmax@gmail.com', '질주 본능', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '고카트 타고 드리프트 하고 싶어요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '송린스', 'princesong@gmail.com', '아 유 프린스 송?', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '예 아!', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '김팡팡', 'kim002@gmail.com', '크로플 가격 3800원.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '맛있는 크로플 이랍니다.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '제임스', 'james8080@gmail.com', '한국살이 5년차 입니다. ', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '이제는 한국어 실력이 많이 늘었습니다. ', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '강준철', 'strongjc@gmail.com', '음악 추천 해주세요.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '힙합을 주로 듣지만 장르 안가린답니다. ', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '신하늘', 'skytrip@gmail.com', '플로리다 여행기', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '오직 경유를 통해 갈 수 있습니다.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '정혜수', 'bakebake002@gmail.com', '크림은 역시', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '동물성 크림이죠.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '남윤돌', 'nfire@gmail.com', '집 가는 방법', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '당신은 집에 갈 수 없으니 포기하세요.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '밥경찰', 'ricehunter@gmail.com', '가지는 말입니다.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '알고 보면 가지는 밥경찰이 아니라 밥도둑입니다.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '영화광', 'moviestar77@gmail.com', '영화관 방문', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '영화관 안 간지 오래되었습니다.', '0:0:0:0:0:0:0:1'
);
insert into board values(seq_board.nextval, '관리자', 'kim01@gmail.com', '[공지] 감사합니다.', '1234', 
TO_DATE('2021-09-07', 'YYYY-MM-DD'), 0, seq_board.nextval, 0, 0, '미숙한 운영에도 양해해주시어 감사 말씀 드립니다.', '0:0:0:0:0:0:0:1'
);

