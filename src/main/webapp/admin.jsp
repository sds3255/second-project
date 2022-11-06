<%@page import="com.mystudy.vo.AdminCustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//로그인화면 연결 전 임시 관리자 아이디/비번 세션 저장 -> 합친 이후 지우기
	String loginUserId = "admin";
	String loginUserPwd = "admin";

    AdminCustomerVO vo = new AdminCustomerVO();
    vo.setId(loginUserId);
    vo.setPwd(loginUserPwd);
    System.out.println("MAIN접속/ ID: " + loginUserId + ", PWD: " + loginUserPwd);
 	        
	session.setAttribute("loginUser", vo);
	session.setAttribute("loginUserId", vo.getId());
	
	//===================================================
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div id="wrap">
	<hr>
	<div id="header">
		<span class="title"><a href="admin-main.jsp">ADMIN PAGE</a></span>
	</div>
	<hr>
	<div id="nav">
		<a href="controller?type=admin-product">PRODUCT</a> |
		<a href="controller?type=admin-order">ORDER</a> |
		<a href="controller?type=admin-member">MEMBER</a> | 
		<a href="controller?type=admin-review">REVIEW</a> |
		<a href="controller?type=admin-qna">Q & A</a> |
		<a href="Main.jsp">MAIN</a> 
	</div>
	<br><br>
	<img alt="home이미지" src="https://teastudio.cafe24.com/web/upload/NNEditor/20200529/main_pic.jpg" height=780>
</div>
</body>
</html>