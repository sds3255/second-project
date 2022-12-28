<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보페이지</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
@font-face {
	font-family: 'Happiness-Sans-Title';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

img {
	float: left;
	width: 600px;
	margin-top: 50px;
	margin-bottom: 75px;
	margin-left: 15%;
	overflow: hidden
}

.inp {
	text-align: center;
	width: 35px;
}

table {
	/* margin: auto; */
	margin-left: 57%;
	width: 25%;
	height: 120px;
}

.one {
	border: 1px solid lightgray;
	border-collapse: collapse;
	width: 500px;
}

.two tr {
	line-height: 80%;
	text-align: center;
}

#mo {
	text-align: center;
	font-size: 3px;
	font-family: 'Happiness-Sans-Title';
}

#con {
	font-family: 'Pretendard-Regular';
}

.pri {
	font-family: 'Happiness-Sans-Title';
}

form {
	width: inherit;
}

footer {
	text-align: center;
}
</style>

</head>
<body>
	<div id="wrap">
		<hr>
		<div id="header">
				<c:choose>
		<c:when test="${id eq '' || id eq null}">
			<span class="title"><a href="user/shop.jsp?id=${id }">CASE		
					#</a></span>
		</c:when>
		<c:otherwise>
			<span class="title"><a href="user/shoplogin.jsp?id=${id }">CASE
					#</a></span>
	</c:otherwise>
		</c:choose>	
		</div>
		<hr>
		<div id="nav">
			<ul>
				<li><a type="button" onclick="shopclick()" id="shop">SHOP</a> |
					<ul>
						<li><a href="ccontroller?func=all&category=all">all</a></li>
						<li><a href="ccontroller?func=all&category=PC001">phone
								case</a></li>
						<li><a href="ccontroller?func=all&category=AC002">airpods
								case</a></li>
					</ul></li>
				<li><a href="bord/community.jsp?id=${id }" id="community">COMMUNITY</a>
					|
					<ul>
						<li><a href="bord/review.jsp?id=${id }">Review</a></li>
						<li><a href="bord/qna.jsp?id=${id }">Q&A</a></li>
					</ul></li>
			</ul>
		<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="user/login.jsp">LOGIN</a> |
		<a href="user/join.jsp">JOIN US</a> |
		<a href="user/login.jsp">CART</a> |
		<a href="user/login.jsp">MYPAGE</a>  
	</c:when>
	<c:otherwise>
		<a href="../user/logout.jsp">LOGOUT</a> |
		<a href="ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>  
	</c:otherwise>
	</c:choose>	
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	<form action="ccontroller" id="cart" method="post">
		<div id="img">
			<img src="image/${vo.image }.jpg" alt="제품이미지" class="click_img">
		</div>

		<div>
			<table class="total">
				<table class="one">
					<tr>
						<div id="mo">
							<th colspan="2" style="text-align: center; font-size: 2em;">●
								${vo.productName } - ${vo.model } ●</th>
						</div>
					</tr>

					<tr>
						<td colspan="2" class="con"><br>${fn:replace(vo.content, replaceChar, "<br/>")}
						</td>
					</tr>
				</table>
				<br>
				<br>
				<table class="two">
					<tr>
						<td colspan="2" class="pri">price :
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${vo.price}원
							&nbsp;(saleprice : ${vo.saleprice }원)</td>
					</tr>

					<tfoot>
						<tr>
							<td colspan="2"><br>
							<br>
							<c:if test="${vo.category =='PC001'}">
									<select class="model" id="model">
										<option value="" selected disabled>[필수선택]기종 선택</option>
										<option value="iphone12 mini">iphone12 mini</option>
										<option value="iphone12/12pro">iphone12/12pro</option>
										<option value="iphone12proMax">iphone12proMax</option>
										<option value="iphone13mini">iphone13mini</option>
										<option value="iphone13/13pro">iphone13/13pro</option>
										<option value="iphone13/13Max">iphone13/13Max</option>
									</select>
								</c:if><br>
							<br> <c:if test="${vo.category =='AC002'}">
									<select class="model" id="model">
										<option value="" selected disabled>[필수선택]기종 선택</option>
										<option value="airpods 2세대">airpods 2세대</option>
										<option value="airpods 3세대">airpods 3세대</option>
										<option value="airpods pro">airpods pro</option>
									</select>
								</c:if></td>
						</tr>
						<tr>
							<td colspan="2"><br> <input type="button" class="minus"
								onclick="javascript:this.form.amount.value--;" value="-">
								<input id="result" type="text" name="amount" class="inp"
								value="1" /> <input type="button" class="plus"
								onclick="javascript:this.form.amount.value++;" value="+">
							</td>
						</tr>
						<tr>
							<td><br>
							<br>
							<br>
							<br> <input class="btn btn-dark" type="button"
								value="장바구니 담기" onclick="add(${vo.productNum})"> <input
								type="hidden" name="id" value="${id}"></td>
							<td><br>
							<br>
							<br>
							<br> <input class="btn btn-dark" type="button"
								value="장바구니 보기" onclick="cart_go()"></td>
						</tr>
					</tfoot>
				</table>
			</table>
		</div>
	</form>
	<div></div>
	<script>
function page(cPage,category) {
	var frm = document.getElementById('nextpage');
	frm.action="ccontroller?func=all&category="+category+"&cPage="+cPage;
	frm.submit();
}
	function cart_go(){
		var frm = document.getElementById('cart');
		var id = document.getElementsByClassName("id");
 		if("${id}"=='undefined'||"${id}"==""){
			alert("장바구니는 로그인 후  이용가능합니다.");
			location.href="/Project_shop/user/login.jsp";			
		} else{
		frm.action = "ccontroller?func=cart&funcc=cartin";
		frm.submit();
		}
	}
	
	function add(productNum) {
		var frm = document.getElementById('cart');
		var id = document.getElementsByClassName("id");
		var model = $("#model option:selected").val();
		if (model == "") {
			alert("기종을 선택하세요.");
			return;
		}
 		if("${id}"=='undefined'||"${id}"==""){
			alert("장바구니는 로그인 후  이용가능합니다.");
			location.href="/Project_shop/user/login.jsp";			
		}else{ 
		frm.action = "ccontroller?func=cartadd&productNum=" + productNum+"&model="+model + "&id=${id}";
	frm.submit();
		
	}
	}
	var img = document.getElementsByClassName('click_img');
	for(var x=0; x<img.length; x++){
		img.item(x).onclick=function(){
			window.open(this.src)};
	}
	function shopclick() {
		if("${id}" != ""){
			location.href = "../user/shoplogin.jsp?id=${id}";
			return;
		} else {
			location.href = "../user/shop.jsp";
		}
	}

</script>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<hr>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights
		reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 :
		02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>