<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');

	#wrap { 
		margin: 0 auto;
		text-align: center;
		font-family: 'Alfa Slab One', cursive;
		font-family: 'Anton', sans-serif;
	 }
	#wrap hr { width: inherit; border: 1px solid navy; }
	#header, #nav {
		width: 700px; 
		margin: 10px auto;
		text-align: center;
	}
	#header { font-size: 2em; }
	img { width: 1250px; }
	div a {
	  text-decoration: none;
	  color: black;
	  font-size: 20px;
	  padding: 15px;
	  display:inline-block;
	}
	ul {
	  display: inline;
	  margin: 0;
	  padding: 0;
	}
	ul li {display: inline-block;}
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
		display:block !important;
		font-size: 1.2em;
	}
	ul li ul li: hober { 
		dropdown;
	 }
</style>
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
			<a href="Main.jsp" id="shop">SHOP</a> | 
			<ul>
				<li><a href="list.jsp">all</a></li>
				<li><a href="phone.jsp">phone case</a></li>
				<li><a href="air.jsp">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="community.jsp" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="review.jsp">review</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</li>
	</ul>
		<a href="login.jsp">LOGIN</a> |
		<a href="join.jsp">JOIN US</a> |
		<a href="cart.jsp">CART</a> |
		<a href="mapage.jsp">MYPAGE</a>
	</div>
	<br><br>
	<img alt="home이미지" src="https://teastudio.cafe24.com/web/upload/NNEditor/20200529/main_pic.jpg">
</div>


</body>
</html>