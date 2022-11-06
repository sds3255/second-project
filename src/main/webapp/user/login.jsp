<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<script>
	function main() {
		if("${id}" == ''){
			location.href = "shop.jsp";
			return;
		} else if ("${id}" != ''){
			location.href = "shoplogin.jsp?id=${id}";
		}
	}
	
	function login(form) {
		if (form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.usr.focus();
			return;
		}
		if (form.pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pw.focus();
			return;
		}
		form.submit();
	}
	
	function shopclick() {
		if("${id}" == ""){
			location.href = "../user/shop.jsp";
			return;
		} else {
			location.href = "../user/shoplogin.jsp?id=${id}";
		}
	}

	 
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
	.col {
		width: 30%;
		margin: auto;
	}
	.find {
		text-align: center;
		font-size: 10px;
	}
		
	
	
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
				<li><a href="../ccontroller?func=all&category=all"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002">airpods case</a></li>
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
			<a href="login.jsp" >CART</a> |
			<a href="login.jsp">MYPAGE</a>  
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

<div class="col">
<form action="controller" method="get">
<table>
	<tbody>
	<div class="form-group col-xs-4">
		<label for="id">아이디</label>
		<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요.">
	</div>
	<div class="form-group">
		<label for="pwd">비밀번호</label>
		<input type="password" class="form-control" id="pwd"  name="pwd" placeholder="비밀번호를 입력하세요.">
	</div>
</tbody>	
		<input type="button" class="btn btn-dark btn-block" value="로그인" onclick="login(this.form);" >
	 	<input type="hidden" name="type" value="login">
</table>	
	<div class="find">
  		<a href="idFind.jsp">아이디 찾기</a>
		<a href="pwFind.jsp">비밀번호 찾기</a>
	</div>	
</form>
</div>	
</body>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>