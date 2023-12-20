package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	//메소드를 만들어서 메소드 단위로 기능 구현
	//어떤 요청을 받아서 일하는 메소드인지 주석 표시
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		//Model : 컨트롤러에서 데이터를 View에 보내주는 객체
		//마치 session같이, request영역에 저장하듯이
		
		List<Board> list = mapper.boardList();
		
		//request.setAttribute("이름",데이터);
		model.addAttribute("list",list);
		
		//실행시킬 jsp이름 명시
		//WEB-Inf/views/boardList.jsp생성
		return "boardList";
	}
	
//  @RequestMapping("/boardInsertForm.do")
//  public String boardInsertForm() {
//     // 단순히 페이지만을 띄워주는 메소드
//     return "boardInsertForm";
//  }
  @RequestMapping("/boardInsertForm.do")
  public void boardInsertForm() {}
  // 메소드 이름이랑 jsp이름이랑 일치시켜주면 void로 설정했을때
  // 디폴트 경로로 메소드이름이 있는 jsp가 있는지 연결해줌
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		//servlet에선 request.getParameter("title") 작성
		//스프링은 name값이랑 Board 프로퍼티 값이랑 같음을 알고 매칭
		// 알아서 Board 객체로 묶어줌
		
		//DAO역할을 하는 mapper에게 가져온 vo값을 담아서 실행
		//실행된 레코드수 볼 필요 없음(히카리CP랑 mybatis가 알아서 일하기 때문)
		mapper.boardInsert(vo);
		
		//여태 없었던 jsp를 실행X 다시 boardList.jsp가 실행되긴 해야하는데
		//게시글의 목록을 DB에서 가져와서 출력해준 상태의 boardList.jsp를 실행 필요
		//메소드 boardList가 일을 하고 있음
		// 다른 메소드로 이동 시킬때 viewResolver가 일하지 않는 신호
		// -->redirect:/ 요청
		return "redirect:/boardList.do";
		//return "boardList.do"; => 빈깡통 ==>WEB-INF/views//boardList.do.jsp라고 인식
	}
	
	//{idx} name값을 idx라고 지정.
	@RequestMapping("/boardContent.do/{idx}")
	public String boardContent(@PathVariable("idx") int theIdx,Model model) {
		//request.getParameter("idx")로 받아오면 항상 String으로 넘어와 형변환이 필요했음
		//스프링에서 한가지 값이 넘어온다면 매개변수 괄호 내에 
		//@pathVariable("name값")자료형 변수명
		Board vo = mapper.boardContent(theIdx);
		
		model.addAttribute("vo",vo);
		return "boardContent";
	}
	
	@RequestMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int theIdx) {
		mapper.boardDelete(theIdx);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int idx,Model model) {
		//쿼리스트링으로 값이 넘어오면 매개변수로 바로 받아올 수 있음
		
		//게시글 수정할 때 원래 게시글 내용을 볼 수 있도록
		//해당 idx를 가지는 게시글 내용 관련된 DB 일하기
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo",vo);
		return "boardUpdateForm";
	}
	
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
							//form 태그의 name 인식하여 Board객체에 매칭
		
		mapper.boardUpdate(vo);
		return"redirect:/boardList.do";
				
	}
	

}
