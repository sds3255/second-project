<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Anton&display=swap');

#wrap {
	margin: 0 auto;
	text-align: center;
	font-family: 'Anton';
}

#wrap hr {
	width: inherit;
	border: 1px solid navy;
}

#header, #nav {
	width: 700px;
	margin: 10px auto;
	text-align: center;
}

#header {
	font-size: 2em;
}

img {
	width: 1250px;
}

div a {
	text-decoration: none;
	color: black;
	font-size: 20px;
	padding: 15px;
	display: inline-block;
}

ul {
	display: inline;
	margin: 0;
	padding: 0;
}

ul li {
	display: inline-block;
}

ul li:hover ul {
	display: block;
	text-align: left;
}

ul li ul {
	position: absolute;
	width: 200px;
	display: none;
}

ul li ul li {
	display: block;
}

ul li ul li a {
	display: block !important;
	font-size: 1.2em;
}

ul li ul li: hober {dropdown;
	
}
</style>
</head>
<body>
	<form action="ccontroller" method="post" id="main" name="main">
		<div id="wrap">
			<hr>
			<div id="header">
				<span class="title">CASE #</span>
			</div>
			<hr>
			<div id="nav">
				<ul>
					<li><a href="Main.jsp" id="shop">SHOP</a> |
						<ul>
							<li><a href="#" onclick="all_go('all')">all</a></li>
							<li><a a href="#" onclick="all_go('PC001')">phone case</a></li>
							<li><a a href="#" onclick="all_go('AC002')">airpods</a></li>
						</ul></li>
					<li><a href="community.jsp" id="community">COMMUNITY</a> |
						<ul>
							<li><a href="review.jsp">review</a></li>
							<li><a href="qna.jsp">Q&A</a></li>
						</ul></li>
				</ul>
				<a href="login.jsp">LOGOUT</a> | 
				<a href="join.jsp">JOIN US</a> | 
				<a href="#" onclick="cart_go()">CART<input type="hidden" name="id" value="${id }"></a> | 
					<a href="mapage.jsp">MYPAGE</a> | 
					<a href="admin.jsp">ADMIN</a>
			</div>
			<br>
			<br> <img alt="home이미지"
				src="https://teastudio.cafe24.com/web/upload/NNEditor/20200529/main_pic.jpg">
		</div>
	</form>
	<script>
		function all_go(category) {
			var frm = document.getElementById('main');
			if (category == "all") {
				frm.action = "ccontroller?func=all&category=" + category;
				frm.submit();
			} else if (category == "PC001") {
				frm.action = "ccontroller?func=all&category=" + category;
				frm.submit();
			}else if (category == "AC002") {
				frm.action = "ccontroller?func=all&category=" + category;
				frm.submit();
			}
		}
		function cart_go(){
			var frm = document.getElementById('main');
			frm.action = "ccontroller?func=cart&funcc=cartin";
			frm.submit();
		}
	</script>
</body>
</html>