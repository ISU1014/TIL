create table board(
	idx int not null auto_increment,
	title varchar(1000) not null,
	content varchar(3000) not null,
	writer varchar(1000) not null,
	indate datetime not null default now(),
	count int not null default 0,
	primary key(idx)
);
-- int 숫자형
-- datetime 날짜형 타입
-- auto_increment 자동 1 증가
-- default 따로 값을 넣지 않아도 지정된 초기값 세팅

select * from board order by idx desc;

insert into board (title,content,writer) values ('첫번째 게시판 글','오늘 처음 써봅니다','류이수');
insert into board (title,content,writer) values ('두번째 글','오늘 처음 써봅니다','류이수');
insert into board (title,content,writer) values ('세번째 글','오늘 처음 써봅니다','류이수');

