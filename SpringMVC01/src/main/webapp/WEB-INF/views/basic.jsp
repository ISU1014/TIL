<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- JAVA에서 제공해주던 함수 기능을 사용하고 싶을때 : jstl의 function core처럼
	태그모양으로 쓰는게 아니라 중괄호 ({})안에 fn: 표시로 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix=fn" %>
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
 
<div class="container">
  <h2>빅데이터 분석 서비스 개발자 과정</h2>
  <div class="panel panel-default">
    <div class="panel-heading">제목</div>
    <div class="panel-body">Panel Content</div>
    <div class="panel-footer">스프링 개발 류이수</div>
  </div>
</div>

</body>
</html>
