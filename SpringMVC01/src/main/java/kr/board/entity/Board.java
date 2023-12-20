package kr.board.entity;
//게시글 객체(object) : 게시글 번호,제목,내용,작성자,작성일,조회수
public class Board {
	
	// 필드명 -> 속성 -> 프로퍼티(property)
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate; //날짜형을 문자열로
	private int count;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	//생성자 만들고 VO를 쉽게 다룰 수 있는 lombok 라이브러리 --> 프로젝트에서는 진행x
	//스프링은 생성자 만들 필요 없음 ==> board객체에 있는 이름이면 알아서 2개든 3개든 매칭시켜 담아줄 수 있음

	
}
