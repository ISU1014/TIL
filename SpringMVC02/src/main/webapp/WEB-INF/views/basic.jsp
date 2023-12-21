<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- JAVA에서 제공해주던 함수 기능을 사용하고 싶을때 : jstl의 function core처럼
	태그모양으로 쓰는게 아니라 중괄호 ({})안에 fn: 표시로 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href="${cpath}/resources/css/index.css">
  
  <script type="text/javascript">
     // 제이쿼리 기본 골격 $(선택자).text
     // 현재의 문서가(document) 실행이 되면~ 곧바로 시작할 내용
     // $(document).ready();
     // function(){} 표현도 있고 ()=>도 있음
     $(document).ready(function(){      
        //   alert("제이쿼리 시작!!!")
        // 문서가 시작되면 바로 요청을 보냈다가 응답 받아오는 함수를 호출
        boardList();
     });
  
     function boardList(){
        // ajax가 통신하는 서버는 REST SERVER
        // 응답할 때 Json 형식으로 주고받게 됨
        $.ajax({
           url : "${cpath}/boardAjaxList.do",
           type : "get",
           // data 보내줄 데이터 없음
           dataType : "json",
           // 응답해왔을 때 처리할 수 있는 콜백 함수를 사용
           // ajax에서 함수를 부를 때는 ()붙이지 않음
           success : callBack,
           error : function(){
              alert("게시글 목록 가져오기 실패ㅜ");
           }
           
        });//ajax 끝
     } // boardList 끝
     
     function callBack(data){
        // alert --> [Object],[Object],[Object]
        console.log(data); // --> Array [{idx : 1, title : '스프링 게시판 첫글', content : }]
        var bList = "<table class='table table-hover table-striped'>";
        bList += "<tr>";
        bList += "<td>번호</td>";
        bList += "<td>제목</td>";
        bList += "<td>작성자</td>";
        bList += "<td>작성일</td>";
        bList += "<td>조회수</td>";
        bList += "</tr>";
        // 여러개의 데이터를 반복문으로 꺼내서 출력
        // 제이쿼리의 반복문 $.each(데이터, 데이터를 처리할 함수);
        // 가져온 데이터 배열, 인덱스를 가지고 있음 -> json데이터 인덱스(index), 데이터(object)
        $.each(data,(index,obj)=>{
           
           bList += "<tr>"
           bList += "<td>" + obj.idx + "</td>";
           // a태그를 눌렀을때 새로운 페이지X, 새로운 요청X, 다른 JS함수로 보내겠다~
           // javascript : 함수이름
           bList += "<td><a href='javascript:cview("+obj.idx+")'>" + obj.title + "</a></td>";
           bList += "<td>" + obj.writer + "</td>";
           bList += "<td>" + obj.indate + "</td>";
           bList += "<td id='count"+obj.idx+"'>" + obj.count + "</td>";
           bList += "</tr>";
           
           // 게시글 한줄이 끝나고 콘텐츠가 보이도록 하는 태그
           // a태그를 눌렀을때 보이고 안보이고를 조정
           bList += "<tr style='display:none' id='c"+obj.idx+"'>";
           bList += "<td>내용</td>";
           bList += "<td colspan='4'>";
           bList += "<textarea id='nc"+obj.idx+"' class='from-control' row='7'>"+ obj.content + "</textarea>";
           bList += "<button class='btn btn-sm btn-primary' onclick='goUpdate("+obj.idx+")'>수정</button>&nbsp;";
           bList += "<button class='btn btn-sm btn-warning' onclick='goDel("+obj.idx+")'>삭제</button>&nbsp;";
           bList += "<button class='btn btn-sm btn-danger' onclick='closeFn("+obj.idx+")'>접어놓기</button>";
           bList += "</td>";
           bList += "</tr>";
           
        }); // each 끝
        
        
        
        bList += "<tr>";
        bList += "<td>";
        bList += "<button class='btn btn-sma btn-info' onclick='goForm()'>글쓰기</button>";
        bList += ""; 
        bList += "</tr>";
        bList += "</td>";
        
        
        
        
        bList += "</table>"; 
        $("#list").html(bList);
        
     } // callBack 끝
     
     function cview(idx){
        // c1, c2, ... 아이디를 특정해서 그 자리의 display 속성 변경
        // $("#c"+idx).css("display") ==> none
        if($("#c"+idx).css("display") == "none"){ 
        	//컨텐츠 열릴때 조회수 올려줌
        	$.ajax({
        		url : "${cpath}/updateCount.do/"+idx,
        		type : "get",
        		dataType : "",
        		//조회수 +1하고 나면 바로 게시글에 갱신하기
        		success : function(res){
        			//res 해당되는 게시글 번호, 조회수 조회해옴
        			//조회수 태그 자리에 받아온 조회수 넣기
        			$("#count"+idx).text(res.count);
        			
        		},
        		error : function(){
        			alert("조회수 올리기 오류 발생")
        		}
        		
        	});
        	
        	// 안보이고 있었으면 보여줌
           $("#c"+idx).css("display","table-row");
        }else{
           // 보이고 있었으면 닫아줌
           $("#c"+idx).css("display","none");
        }
     } // cview 끝
     
     
     function goForm(){
     $("#list").css("display","none");
     $("#wform").css("display","block");
     }
     
     
     function insertFn(){
    	 
    	 var fData = $("#frm").serialize();
    	 console.log(fData);
    	 
    	 $.ajax({
    		 url : "${cpath}/boardAjaxInsert.do",
    		 type : "post",
    		 data : fData,
    		 //가져올 값 없음 dataType ㅌ
    		 //통신이 끝나고 나면 다시 게시글 목록이 뜨기
    		 //boardList() JS 함수에 이미 만듦
    		 success : boardList,
    		 error : function(){
    			 alert("글쓰기 실패 ㅠㅠ")
    		 }
    	 });
    	 
    	 $("#list").css("display","block");
         $("#wform").css("display","none");
         //form에 작성된 내용 초기화
         
         $("#reset").trigger("click"); //id가 click기능을 강제로 실행한다
     }
     
     function closeFn(idx){
    	 $("#c"+idx).css("display","none");
     }
     
     function goDel(idx){
    	 //confirm -> T/F => 조건
		var real = confirm("정말로 삭제하시겠습니까?");
    	 
    	 if(real){
    		 $.ajax({
    			url : "${cpath}/boardAjaxDelete.do/"+idx, //pathvariable
    			type : "delete",
    			// data : {"idx" : idx}
    		 	success : boardList,
    		 	error : function(){
    		 		alert("글 삭제 실패 ㅜㅜ");
    		 	}
    		 });
    	 }
    	 
     }
     
     function goUpdate(idx){
    	 var newContent = $("#nc"+idx).val();
    	 $.ajax({
    		 url : "${cpath}/boardAjaxUpdate.do",
    		 type : "put",
    		 contentType : "application/json;charset=utf-8", //json형식
    		 data : JSON.stringify({"idx":idx, "content":newContent}), //json형식
    		 success : boardList,
    		 error : function(){
    			 alert("수정 실패");
    		 }
    		 
    	 });
     }
     
     
  </script>

</head>
<body>

<div class="container">
  <h2>빅데이터 분석 서비스 개발자과정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판2</div>
    <div class="panel-body" id="list">게시글 목록</div>
    <div class="panel-body" id="wform" style="display:none">
    
    <form class="form-horizontal" id="frm">
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-10">
        <textarea class="form-control" id="content" name="content" rows="10"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="writer">작성자:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="writer" placeholder="작성자 이름을 입력하세요" name="writer">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      <!-- submit이 되면 다른 화면으로 가버리니까 button으로 수정 -->
        <button type="button" class="btn btn-default" onclick="insertFn()">등록</button>
        <button type="reset" class="btn btn-default" id="reset">취소</button>
      </div>
    </div>
  </form>
    
    </div>
    <div class="panel-footer">스프링 개발 류이수😉</div>
  </div>
</div>

</body>
</html>