<%@page import="com.mystudy.Project_shop.vo.customerVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script>
	function sendData() {
		let firstForm = document.forms[0];
		let id = document.getElementById("id").value;
		let pwd = document.getElementById("pwd").value;
		let pwdok = document.getElementById("pwdok").value;
		let idcheck = "${idok }";
		console.log("idcheck : " + idcheck);
		alert("firstForm.elements.length : " + firstForm.elements.length);
		
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "을(를) 입력하세요");
				console.log("firstForm.elements[i] : " + firstForm.elements[i]);
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			} 
		}
		if (pwd.trim() != pwdok.trim()) {
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요.");
			return;
		}
		if (idcheck == id){
			alert("중복된 아이디입니다.\n다른 아이디를 사용해 주세요!");
			return;
		} 
		if (idcheck != id && pwd.trim() == pwdok.trim()) {
			alert("회원가입이 완료되었습니다.\n저희 쇼핑몰을 이용해 주셔서 감사합니다 :)");
		}	
		firstForm.submit();
	}
	
	function main() {
		if("${id}" == ''){
			location.href = "shop.jsp";
			return;
		} else {
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
/* 	if("<c:out value='${findid}'/>" !=''){
		let msg = "<c:out value='${msg}'/>";
		alert(msg);
	} */
</script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
	.col {
		width: 30%;
		margin: auto;
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
			<a href="login.jsp" id="community">COMMUNITY</a> | 
			<ul>
			<li><a href="../bord/review.jsp">Review</a></li>
				<li><a href="../bord/qna.jsp">Q&A</a></li>
			</ul>
		</li>
	</ul>
		<a href="login.jsp">LOGIN</a> |
		<a href="join.jsp">JOIN US</a> |
		<a href="login.jsp">CART</a> |
		<a href="login.jsp">MYPAGE</a>
	</div>
</div>
<br><br><br><br><br>

<h2 style="text-align:center;">회원가입</h2>
<div class="col">
<form action="controller" method="get">
	<div class="form-group">
		<label for="name">이름</label>
		<input type="text" class="form-control" id="name"  name="name" title="이름" placeholder="이름을 입력하세요.">
	</div>
		<div class="form-group">
	<label for="id">아이디</label>
		<input type="text" class="form-control" id="id"  name="id" title="아이디" placeholder="아이디를 입력하세요.">
	</div>
	<div class="form-group">
	<label for="pwd">비밀번호</label>
		<input type="password" class="form-control" id="pwd"  name="pwd" title="비밀번호" placeholder="비밀번호를 입력하세요.">
	</div>
	<div class="form-group">
	<label for="pwdok">비밀번호 확인</label>
		<input type="password" class="form-control" id="pwdok"  name="pwdok" title="비밀번호 확인" placeholder="비밀번호 확인을 입력하세요.">
	</div>
	<div class="form-group">
	<label for="addr">주소</label>
		<input type="text" class="form-control" id="addr"  name="addr" title="주소" placeholder="주소를 입력하세요.">
	</div>
	<div class="form-group">
	<label for="phone">연락처</label>
		<input type="text" class="form-control" id="phone"  name="phone" title="연락처" placeholder="ex) 010-1234-5678">
	</div>
	<div class="form-group">
	<label for="email">이메일</label>
		<input type="email" class="form-control" id="email"  name="email" title="이메일" placeholder="ex) case@naver.com">
	</div>
	<div>
		<input type="button" class="btn btn-dark btn-block" value="회원가입" onclick="sendData()" >
		<input type="hidden" name="type" value="join">
	</div>
</form>
</div>
</body>
<br><br><br><br><br><br>

<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>

</html>