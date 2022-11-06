<%@page import="com.mystudy.Project_shop.dao.ProductDAO"%>
<%@page import="com.mystudy.Project_shop.common.Paging"%>
<%@page import="com.mystudy.Project_shop.vo.ProductPriceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<link href="css/main.css" rel="stylesheet" type="text/css">

<style>

	img {
		float: left;
		width: 450px;
		height: 650px;
		margin: 50px 10px 30px 10px;
	}
	.disable {
		font-size: 1.2em;
	}
	#paging {
		text-align: center;
	}
	form { width: inherit;}
		footer {
		text-align: center;}
	
	
</style>
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
				<li><a href="Project_shop/ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="Project_shop/ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="Project_shop/ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="review.jsp?id=${id }">review</a></li>
				<li><a href="qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
	<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	</c:when>
	<c:otherwise>
		<a href="../user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
		<a href="cart.jsp?id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>  
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	<br><br><br><br>
	<div>
	

<form action="ccontroller" method="post" id="nextpage" name="nextpage">
<div align="center" id="margin">
	<c:forEach var="vo" items="${clist }">
	<ul>
		<li>
			<a href="product_content.jsp?productNum=${vo.productNum }&cPage=${pvo.nowPage }">
				<img src="image/${vo.image }.jpg">
			</a>
		</li>
	</ul>
	</c:forEach>
</div>


<br><br>
	
	<div id="paging">
		<ul>
			<c:if test="${pvo.beginPage == 1 }">
				<li class="disable">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</li>
			</c:if>
			<c:if test="${pvo.beginPage != 1 }">
				<li>
					<a href="#" onclick="page(${pvo.beginPage - 1 })">&nbsp;&nbsp;&lt;&nbsp;&nbsp;</a>
				</li>
			</c:if>
		</ul>
		
		<ul>
			<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li>${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li><a href="#" onclick="page(${pageNo},${category })">${pageNo }</a></li>
				</c:if>
			</c:forEach>
		</ul>
		
		<ul>
			<c:if test="${pvo.endPage < pvo.totalPage }">
				<li>
					<a href="#" onclick="page(${pvo.endPage + 1 })">&nbsp;&nbsp;&gt;&nbsp;&nbsp;</a>
				</li>
			</c:if>
			<c:if test="${pvo.endPage >= pvo.totalPage }">
				<li class="disable">&nbsp;&nbsp;&gt;&nbsp;&nbsp;</li>
			</c:if>
			
		</ul>
	</div>
		</form>
		</div>
	<script>
	function page(cPage,category) {
		var frm = document.getElementById('nextpage');
		console.log(cPage);
		console.log(category);
		frm.action="ccontroller?func=all&cPage="+cPage+"category="+category;
		frm.submit();
	}
	function all_go(category) {
		var frm = document.getElementById('main');
		console.log(frm);
		console.log(category);
		if (category == "all") {
			console.log(category);
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "PC001" || category == "AC002") {
			console.log(category);
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		}
	}
		function cart_go(){
			var frm = document.getElementById('main');
			console.log(frm);
			frm.action = "ccontroller?func=cart&funcc=cartin";
			frm.submit();
		}
		function main() {
			if("${id}" == ""){
				location.href = "../user/shop.jsp";
			} else {
				location.href = "../user/shoplogin.jsp?id=${id}";
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
</body>
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>