package com.board.mapper;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.board.entity.Board;

@Repository //DAO역할을 할것이다 알려주는 주석-spring 주석
//@Mapper 주석도 비슷함.(Mapping)-mybatis주석
public interface BoardMapper { // xml과 이름이 같아야 매칭가능
	
	//Java코드와 SQL문 따로 관리할 때 둘을 연결(mapping)
	//더이상 sqlSession 만들 필요가 X => mybatis와 히카리CP가 대신함
	
	
	//controller 로부터 xml로 연결
	public List<Board> boardList(); //mapper.xml id 태그와 메서드 이름이 같아야 함








}
