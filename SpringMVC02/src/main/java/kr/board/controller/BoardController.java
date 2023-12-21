package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

// 실제로 일을 하는 컨트롤러임을 알려주는 주석(어노테이션)
// 주석 : 클래스를 실행하기 전에 전처리 과정에서 표시
// 초창기 개발 : @component라고 표현하기도 함
@Controller //pojo(plane java)
public class BoardController {
	
	//기존 생성자 생성, 객체로 가져온 구문을 변수로 가져옴
	@Autowired
	private BoardMapper mapper;
	//기존 사용했던 생성자 주입보다 조금 더 유연성이 높은 의존성 주입(Dependency Injection)
	
	//boardAjaxMain.do 요청을 받아 basic.jsp 실행시키는 메소드 작성
	//url 가져오는 방식을 기본으로 get방식
	
	  @RequestMapping("/boardAjaxMain.do") 
	  public String boardAjaxMain() {
	  return"basic"; 
	 //!!!return 용도 1.jsp이름 /용도2.redirect:/ 다른 요청으로 보내기
	  }

	
	
	//==> @Responsebody만 관리할 수 있는 컨트롤러 만들 예정
	//BoardRestController 짓기 - 클래스 파일
////	ajax type이 get방식으로 넘어옴
//	@GetMapping("/boardAjaxList.do")
//	public @ResponseBody List<Board> boardAjaxList() {
//		//ajax통신의 결과로 return 데이터를 보내줘야함
//		//@ResponseBody : 응답을 forwarding 방식이 아닌, 데이터를 바로 응답
//		//					알아서 json으로 스프링이 바꿔줌 --> lib dependency 추가 (jackson-databind라이브러리)
//		
//		List<Board> list = mapper.boardList();
	
//		return list;
//		
//	}

	  
	  
	
}
