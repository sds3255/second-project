<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
</style>
<link href="css/main.css" rel="stylesheet" type="text/css" >
</head>
<body>


<div id="wrap">
	<hr>
	<div id="header">
		<span class="title">CASE #</span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a href="shop.jsp" id="shop">SHOP</a> | 
			<ul>
				<li><a href="all.jsp">all</a></li>
				<li><a href="phonecase.jsp">phone case</a></li>
				<li><a href="airpods.jsp">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="login.jsp" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="review.jsp">Review</a></li>
				<li><a href="login.jsp">Q&A</a></li>
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
<script>
	if ("${delok}" == 1) {
		alert("정상적으로 탈퇴 처리 되었습니다.\n이용해주셔서 감사합니다.");
	}

</script>
<br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>

</html>