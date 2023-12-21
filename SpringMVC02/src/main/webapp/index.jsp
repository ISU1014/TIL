<!-- 톰캣 실행되면 자동 실행할 웰컴 페이지 -> index. ...
	servers/web.xml 제일 밑에 정리되어있대 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<!-- jstl은 따로 지정해주지 않아도 현재의 프로젝트내에서만 찾을 수 있게 실행 -->
	<c:redirect url="boardAjaxMain.do"/>
</body>
</html>