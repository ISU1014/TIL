<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <center><h2>게시글 수정하기</h2></center>
   <form class="form-horizontal" action="${cpath}/boardUpdate.do" method="post">
   
   <!-- idx hidden  -->
   <input type="hidden" name="idx" value="${vo.idx}">
   
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" value="${vo.title}" name="title">
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-10">
        <textarea class="form-control" id="content" name="content" rows="10" placeholder="${vo.content}"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="writer">작성자:</label>
      <div class="col-sm-10">          
        <div class="form-control" id="writer" name="writer">${vo.writer}</div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">수정</button>
      </div>
    </div>
  </form>

</body>
</html>