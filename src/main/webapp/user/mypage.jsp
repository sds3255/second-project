<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String id = request.getParameter("id");
	
	pageContext.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script>
	function main() {
		if("${id}" == ''){
			location.href = "shop.jsp";
			return;
		} else {
			location.href = "shoplogin.jsp?id=${id}";
		}
	}
	function detail_customer() {
		location.href = "controller?type=detail_customer&id=${id}";
	}

	function update_customer() {
		location.href = "controller?type=update_customer&id=${id}";
	}
	
	function orderList() {
		location.href = "../ccontroller?func=payment&funcc=no&id=${id}";
	}
	
	function deletecheck() {
		location.href = "controller?type=deletecheck&id=${id}";
	}
	if("${id}" == ""){
		location.href = "login.jsp";
	}
	function shopclick() {
		if("${id}" == ""){
			location.href = "../user/shop.jsp";
		} else {
			location.href = "../user/shoplogin.jsp?id=${id}";
		}
	}
</script>
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
			<c:choose>
			<c:when test="${id == '' }">
			<a href="shop.jsp" id="shop">SHOP</a> | 
			</c:when>
			<c:otherwise>
			<a type="button" onclick="shopclick()" id="shop">SHOP</a> | 
			</c:otherwise>
			</c:choose>
			<ul>
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="../bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="../bord/review.jsp?id=${id }">Review</a></li>
				<li><a href="../bord/qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="user/login.jsp">LOGIN</a> |
		<a href="user/join.jsp">JOIN US</a> |
	</c:when>
	<c:otherwise>
		<a href="logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
	<a href="ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="user/mypage.jsp?id=${id}">MYPAGE</a>  
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	</div>
</div>

<br><br><br><br><br>

<div class="container">
<div class="col text-center">
<table class="table table-striped w-auto">
  <h2>마이페이지</h2>
  <hr>
  <div id="container">
 <%-- <form action="controller" method="get">  --%>
  	<input type="button" class="btn btn-dark" value="회원정보 조회" onclick="detail_customer()">
  	<input type="button" class="btn btn-dark" value="회원정보 변경" onclick="update_customer()">
  	<input type="button" class="btn btn-dark" value="주문내역 조회" onclick="orderList()">
  	<input type="button" class="btn btn-dark" value="회원 탈퇴" onclick="deletecheck()">
 <%-- </form>  --%>
  </div>
</table>
</div>
</div>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>