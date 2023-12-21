package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//POJO이긴한데 ResponseBody를 알아서 처리할 Controller
@RestController
//REST : 자원을 이름으로 구분하여 자원의 상태를 주고받는 것
//GET,POST,DELETE,PUT(=update)
//보내는 요청이 board여도 보내는 방식에 따라 각각의 요청으로 받아들인다.
// /board 요청에 넘겼을때 받아들이는 입장에서는 get, post.. 각각 다르게 받아들임
public class BoardRestController {

	@Autowired
	private BoardMapper mapper;
	
	@GetMapping("/boardAjaxList.do")
	public List<Board> boardAjaxList(){
		List<Board> list = mapper.boardList();
		//RestController 주석 덕분에 return에는 보낼 데이터를 담을 수 있음
		//@ResponseBody를 붙이지 않아도 됨
		return list;
	}
	
	@PostMapping("/boardAjaxInsert.do")
	public void boardAjaxInsert(Board vo) {
		//넘겨줄 데이터가 없으면 void
		
		mapper.boardInsert(vo);		
	}	
	
	@DeleteMapping("/boardAjaxDelete.do/{idx}")
	public void boardAjaxDelete(@PathVariable int idx) {
		mapper.boardDelete(idx);
	}
	
	@PutMapping("/boardAjaxUpdate.do")
	public void boardAjaxUpdate(@RequestBody Board vo) {
		//json형식으로 데이터가 넘어오면 Board 객체로 묶여있지 않음
		//알아서 묶어주는 주석 @RequestBody
		
		//글 제목 제외, 내용만 수정하는 메소드 새로 만들기
		mapper.boardContentUpdate(vo);
	}
	
	@GetMapping("/updateCount.do/{idx}")
	public Board updateCount(@PathVariable int idx) { //결과값을 Board로 돌려줌
		mapper.updateCount(idx);
		//조회수가 +1된 게시글의 내용 가져오기
		Board vo = mapper.boardContent(idx);
		return vo;
		
	}
}
