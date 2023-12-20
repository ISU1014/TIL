create table board(
	idx int not null auto_increment,
	title varchar(30) not null,
	content varchar(3000) not null,
	writer varchar(10) not null,
	indate datetime not null default now(),
	count int not null default 0,
	primary key(idx)
);

select * from board;

insert into board (title, content, writer) values('스프링 게시판','오늘 처음 씁니다','홍길동');
insert into board (title, content, writer) values('스프링 게시판','오늘 처음 씁니다','홍길동');
insert into board (title, content, writer) values('스프링 게시판','오늘 처음 씁니다','홍길동');




