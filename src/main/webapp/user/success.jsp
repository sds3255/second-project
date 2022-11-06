<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String id =  request.getParameter("id");
	
	pageContext.setAttribute("id", id);
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 확인처리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script>
	alert("정상적으로 로그인 되었습니다.\n${id}님 반갑습니다 :)");
	location.href= "shoplogin.jsp?id=${id}";
</script>
</head>
</html>