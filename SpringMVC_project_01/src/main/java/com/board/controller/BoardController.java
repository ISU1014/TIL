package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.entity.Board;
import com.board.mapper.BoardMapper;

//실제로 일을 하는 컨트롤러임을 알려주는 주석(어노테이션) - spring frame work lib가 있음
//클래스를 실행하기 전에 전처리 과정에서 표시
//초창기에는 @Component라고 표현하기도 한다.
@Controller
public class BoardController {
	
	@Autowired //메모리상에 객체를 사용하기 위해 올려놓는 행위를 위해 시켜줌
	private BoardMapper mapper;
	//기존 생성자 주입보다 조금 더 유연성이 높은 의존성 주입
	
	//메소드 단위로 기능 구현
	
	//어떤 요청을 받아서 일하는 메소드인지 주석표시
	@RequestMapping("/boardList.do") //요청이 들어옴
	public String boardList(Model model) {
		//Model : 컨트롤러에서 데이터를 view에 보내주는 객체(session과 같이)
		
		
		List<Board> list = mapper.boardList();
		
		model.addAttribute("list", list);
		
		//실행시킬 jsp이름을 명시
		return "boardList";
	}
	
}
