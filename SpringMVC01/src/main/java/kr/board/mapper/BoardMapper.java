package kr.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.board.entity.Board;

@Repository //DAO역할을 할 것이다 알려주는 주석 - Spring
//@Mapper 도 비슷함 (연결시켜준다) - Mybatis
public interface BoardMapper {
	//DAO역할을 할 인터페이스의 이름과 SQL문 관리하는 XML 이름을 일치시킨다.
	//BoardMapper.java(interface) + BoardMapper.xml
	
	//Java코드와 SQL문과 따로 관리할 때 둘을 연결(mapping)
	
	//더이상 sqlSession만들 필요X, 결과에 대한 일을 안해도 됨
	//기존 SqlSession 일을 -> mybatis,히카리CP 가 함
	
	public List<Board> boardList(); 
	//Board는 entity, boardList 메서드 이름은 xml id와 일치해야함

	public void boardInsert(Board vo);

	public Board boardContent(int theIdx);

	public void boardDelete(int theIdx);

	public void boardUpdate(Board vo);

}
