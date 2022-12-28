<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디찾기</title>
<script>
	
	function main() {
		if("${id}" == ''){
			location.href = "shop.jsp";
			return;
		} else if ("${id}" != ''){
			location.href = "shoplogin.jsp?id=${id}";
		}
	}

	function shopclick() {
		if("${id}" == ""){
			location.href = "../user/shop.jsp";
		} else {
			location.href = "../user/shoplogin.jsp?id=${id}";
		}
	}
	 
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

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
				<li><a href="all.jsp?id=${id }">all</a></li>
				<li><a href="phonecase.jsp?id=${id }">phone case</a></li>
				<li><a href="airpods.jsp?id=${id }">airpods case</a></li>
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
			<a href="login.jsp">LOGIN</a> |
			<a href="join.jsp">JOIN US</a> |
			<a href="login.jsp">CART</a> 
			<a href="../user/mypage.jsp?id=${id }">MYPAGE</a>  
		<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp?id=${id }">ADMIN</a>
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
  <h2>아이디 찾기</h2>
  <form action="controller" method="get">  
  <table class="table table-bordered">
     <tbody>
		<tr>
     <c:choose>
     	<c:when test="${findid != null}">
		  <%--<th id="space">아이디</th>--%>
		  <td>아이디 : ${findid }</td>
     	</c:when>
		<c:otherwise>
		  <td>일치하는 회원정보가 없습니다.</td>
		</c:otherwise>
     </c:choose>
		</tr>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-dark" value="로그인" onclick="javascript:location.href='login.jsp'">
				<input type="button" class="btn btn-dark" value="비밀번호 찾기" onclick="javascript:location.href='pwFind.jsp'">
			</td>
		</tr>
	</tfoot>
  </table>
  </form>
  </table>
  </div>
</div>
</body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>