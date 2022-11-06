<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	System.out.println("id : " +  request.getParameter("id"));
	pageContext.setAttribute("id", request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script type="text/javascript">
	function shopclick() {
		if("${id}" != ''){
			location.href = "../user/shoplogin.jsp?id=${id}";
			return;
		} else {
			location.href = "../user/shop.jsp";
		}
	}
	function main() {
		if("${id}" != ''){
			location.href = "../user/shoplogin.jsp?id=${id}";
			return;
		} else {
			location.href = "../user/shop.jsp";
		}
	}
</script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css" >
</head>
<body>

<div id="wrap">
	<hr>
	<div id="header">
		<span class="title"><a type="button" onclick="main()">CASE #</a></span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a type="button" onclick="shopclick()" id="shop">SHOP</a> |  
			<ul>
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="review.jsp?id=${id }">review</a></li>
				<li><a href="qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
	<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	</c:when>
	<c:otherwise>
		<a href="../user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
		<a href="../ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>  
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	<br><br>
</div>


<br><br><br>
<h2 id="h2">community</h2>
<hr id="hr">
<div class="container mt-3">
	<a class="btn btn-dark" href="qna.jsp?id=${id }" >QnA</a>
	<a class="btn btn-dark" href="review.jsp?id=${id }" >Review</a>
</div>
</body>
</html>