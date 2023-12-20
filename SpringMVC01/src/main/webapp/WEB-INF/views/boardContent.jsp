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
</head>
<body>
<script type="text/javascript">
	function goUpdate(){
		//boardUpdateForm.do 요청을 보내고
		//idx같이 보내기
		//(UpdateForm에서는 해당 게시글의 정보도 담아와야함)
		location.href="${cpath}/boardUpdateForm.do?idx=${vo.idx}";
		//?name=value는 path로 넘어가지 않고 url에 포함되어 get방식으로 넘어감
		//쿼리스트링으로 넘어감
	}
</script>


  <center><h2>게시글 내용</h2></center>
   
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-10">
        <div>${vo.title}</div>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-10">
      	<!-- \n을 <br>로 바꾸는 작업  **EL 표현식은 \n을 인식할 수 없음 그래서 페이지영역에 변수로 \n값을 저장해놓고 사용 
      		fn : replace(바꿀데이터, 무엇을, 무엇으로)-->
      	<% //스크립틀릿
      	pageContext.setAttribute("newLine","\n");
      	%>
      	
      	<%-- <div class="form-control" id="content" name="content" rows="10">${vo.content}</div> --%>
      	<div>${fn:replace(vo.content,newLine,"<br>") }</div>
      	
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="writer">작성자:</label>
      <div class="col-sm-10">          
        <div  rows="10" >${vo.writer}</div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button class="btn btn-default" onclick="goUpdate()">수정</button>
        <a href="<c:url value='/boardDelete.do/${vo.idx}'/>" class="btn btn-default" type=button >삭제</a>
        <a href="${cpath}/boardList.do" type=button class="btn btn-default">목록</a>
      </div>
      
    </div>
 

</body>
</html>
