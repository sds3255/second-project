<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script>
	if ("${delok}" == 1) {
		alert("정상적으로 탈퇴 처리 되었습니다.\n이용해주셔서 감사합니다.");
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
		<span class="title"><a type="button" onclick="shop.jsp">CASE #</a></span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a href="shop.jsp" id="shop">SHOP</a> | 
			<ul>
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="../bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
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
	<br><br>
	<img alt="home이미지" src="https://teastudio.cafe24.com/web/upload/NNEditor/20200529/main_pic.jpg">
</div>

</body>

<br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>

</html>