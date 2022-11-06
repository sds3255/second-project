<%@page import="com.mystudy.Project_shop.common.Paging"%>
<%@page import="com.mystudy.Project_shop.dao.ProductDAO"%>
<%@page import="com.mystudy.Project_shop.vo.ProductPriceVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="css/main.css" rel="stylesheet" type="text/css">
<style>
@font-face {
	font-family: 'BinggraeSamanco-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/BinggraeSamanco-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#font {
	font-family: 'BinggraeSamanco-Bold';
}
  @import
	url('https://fonts.googleapis.com/css2?family=Anton&display=swap'); 
img {
	width: 450px;
	height: 650px;
	margin: auto;
	text-align: center;
}

.disable {
	font-size: 1.2em;
}

#paging {
	text-align: center;
	font-family: 'Anton';
}

#underline {
	text-decoration: line-through;
}

form {
	width: 1700px;
}

	form {
		width: inherit;
	}
	.div1 {
		font-family: 'KyoboHand';
	}
	
	.box{
	  margin-left: 45%;
	  margin-right: 25%;
	  margin-bottom: 15px;
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
		<span class="title"><a type="button" onclick="main1()">CASE #</a></span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a type="button" onclick="shopclick()" id="shop">SHOP</a> | 
			<ul>
				<li><a href="ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="bord/review.jsp?id=${id }">Review</a></li>
				<li><a href="bord/qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
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
<div class="box">	
	<div class="container-1">
		<form action="ccontroller"  method="post">
			<input type="search" name="keyword" id="search" placeholder="Search...">
			<input type="hidden" name="func" value="search">
			<input type="hidden" name="id" value="${id }">
		</form>
	</div>
</div>

	<form action="ccontroller" method="post" id="nextpage" name="nextpage">
		<div id="font" align="center">
			<ul>
				<c:forEach var="vo" items="${plist}">
					<li><a href="ccontroller?func=content&productNum=${vo.productNum}&id=${id}" > <img
							src="image/${vo.image}.jpg" alt="제품이미지"><br> <c:choose>
								<c:when test="${vo.saleprice eq 0 }">
									<span>${vo.productName}<br>(<fmt:formatNumber
											value="${vo.price}" />원)
									</span>
									<br>
								</c:when>
								<c:otherwise>
									<span>${vo.productName}</span>
									<br>
				 			(<span id="underline"><fmt:formatNumber
											value="${vo.price}" />원</span> ><span><fmt:formatNumber
											value="${vo.saleprice }" />원</span> )
				 		</c:otherwise>
							</c:choose>
					</a></li>
				</c:forEach>

			</ul>
		</div>

		<br> <br>

		<div id="paging">
			<ul>
				<c:if test="${pvo.beginPage == 1 }">
					<li class="disable">&nbsp;&lt;&nbsp;</li>
				</c:if>
				<c:if test="${pvo.beginPage != 1 }">
					<li><a href="#"
						onclick="page(${pvo.beginPage - 1 },'${category }')">&nbsp;&lt;&nbsp;</a></li>
				</c:if>
			</ul>
			<ul>
				<c:forEach var="pageNo" begin="${pvo.beginPage }"
					end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li>${pageNo }</li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li><a href="#" onclick="page(${pageNo},'${category }')">${pageNo }</a></li>
					</c:if>
				</c:forEach>
			</ul>

			<ul>
				<c:if test="${pvo.endPage < pvo.totalPage }">
					<li><a href="#"
						onclick="page(${pvo.endPage + 1 },'${category }')">&nbsp;&gt;&nbsp;</a></li>
				</c:if>
				<c:if test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable">&nbsp;&gt;&nbsp;</li>
				</c:if>
			</ul>
		</div>
	</form>
	<script>
	function page(cPage,category) {
		var frm = document.getElementById('nextpage');
		console.log(cPage);
		console.log("category:"+category);
		frm.action="ccontroller?func=all&category="+category+"&cPage="+cPage;
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
	function content_go(productNum) {
		var frm = document.getElementById('main');
		console.log(productNum);
		frm.action = "ccontroller?func=content&productNum=";
		frm.submit();
	}

	function cart_go(){
		var frm = document.getElementById('main');
		console.log(frm);
		frm.action = "ccontroller?func=cart&funcc=cartin";
		frm.submit();
	}
	function main1() {
		if("${id}" == ""){
			location.href = "user/shop.jsp";
		} else {
			location.href = "user/shoplogin.jsp?id=${id}";
		}
	}
	function shopclick() {
		if("${id}" == ""){
			location.href = "user/shop.jsp";
		} else {
			location.href = "user/shoplogin.jsp?id=${id}";
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