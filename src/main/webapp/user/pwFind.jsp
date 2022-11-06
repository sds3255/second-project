<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 찾기</title>
<script>
	
	function main() {
		if("${id}" == ''){
			location.href = "shop.jsp";
			return;
		} else if ("${id}" != ''){
			location.href = "shoplogin.jsp?id=${id}";
		}
	}
	function find_go(form) {
		if (form.name.value == "") {
			alert("이름을 입력하세요.");
			form.name.focus();
			return;
		}
		if (form.phone.value == "") {
			alert("연락처를 입력하세요.");
			form.phone.focus();
			return;
		}
		if (form.id.value == "") {
			alert("아이디를 입력하세요.");
			form.phone.focus();
			return;
		}
	
		
		form.submit();
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
	.col {
		width: 30%;
		margin: auto;
	}
	.find {
		text-align: right;
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
<h2 style="text-align:center;">비밀번호 찾기</h2>
<div class="col">
<form action="controller" method="get">
	<div class="form-group">
	<label for="name">이름</label>
		<input type="text" class="form-control" id="name"  name="name" placeholder="이름을 입력하세요.">
	</div>
	<div class="form-group">
	<label for="id">아이디</label>
		<input type="text" class="form-control" id="id"  name="id" placeholder="아이디를 입력하세요.">
	</div>
	<div class="form-group">
	<label for="phone">연락처</label>
		<input type="text" class="form-control" id="phone"  name="phone" placeholder="연락처를 입력하세요.">
	</div>
	<hr style="width:100%;">
	<div class="find">
	<input type="button" class="btn btn-dark"  value="비밀번호 찾기" onclick="find_go(this.form)">
	<input type="hidden" name="type" value="findpw">
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