<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Basic</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 목록</div>
    <div class="panel-body">
    
     <table class="table table-hover">
     <thead>
     	<tr>
     		<td>번호</td>
     		<td>제목</td>
     		<td>작성자</td>
     		<td>작성일</td>
     		<td>조회수</td>
		</tr>     
     </thead>
     <tbody>
     	<c:forEach items="${list} var="b">
          	<tr>
     		<td>${b.idx}</td>
     		<td>${b.title}</td>
     		<td>${b.writer}</td>
     		<td>${b.indate}</td>
     		<td>${b.count}</td>
		</tr>
		</c:forEach>   
     </tbody>
    
    </div>
    <div class="panel-footer">류이수😉</div>
  </div>
</div>

</body>
</html>
