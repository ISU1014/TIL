<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 변수 저장 -->
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
	function goForm(){
		//location.href=""; 페이지 이동
		//location.href="/boardInserForm.do"; --> 어떤 프로젝트의 요청인지 찾지 못함
		//location.href="mvc/boardInsertForm.do" --> 만약 ContextPath가 달라지면 찾지 못함
		location.href="${cpath}/board/boardInsertForm.do";
	}
</script>
 
<div class="container">
  <h2>빅데이터 분석 서비스 개발자 과정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">제목</div>
    <div class="panel-body">Panel Content</div>
   	
   	<table class="table table-hover">
   		<thead>
   			<td>번호</td>
   			<td>제목</td>
   			<td>작성자</td>
   			<td>작성일</td>
   			<td>조회수</td>
   			</thead>
   			
   		<tbody>
   			<!-- DB에서 값 가져와 반복문 작성 공간 -->
   		<c:forEach items="${list}" var="b">
   		<tr>
   			<c:url var="contentLink" value="/board/boardContent.do/${b.idx}" />
   			<td><a href="${contentLink}">${b.idx}</td>
   			<%-- cpath/boardContent.do/idx 
   				c:url 에 정리할때는 jstl은 무조건 프로젝트 내에서 이동
   				cpath를 입력하지 않아도 됨--%>
   			<td><a href="${contentLink}">${b.title}</a></td>
   			<td>${b.writer}</td>
   			<td>${b.indate}</td>
   			<td>${b.count}</td>
   		</tr>
   		
   		</c:forEach>
   		<tr>
   			<td colspan="5"><button onclick="goForm()"  class="btn btn-outline-primary">글쓰기</button></td>
   		</tr>
   		</tbody>
   	</table>
   
    <div class="panel-footer">스프링 개발 류이수</div>
  </div>
</div>

</body>
</html>
