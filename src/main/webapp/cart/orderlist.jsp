<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="shop-main.jsp">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link href="css/main.css" rel="stylesheet" type="text/css">
<style>
	@import
url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
	@font-face {
	    font-family: 'IBMPlexSansKR-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
.container {
	overflow: auto;
	min-width: 1300px;
	max-width: 1300px;
}

.container h2 {
	padding-top: 50px;
	padding-bottom: 80px;
	text-align: center;
}

table {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 50px;
}

#btn {
	width:
	display: flex;
	justify-content: center;
}

#btn>.btn3 {
	padding-right: 90px;
	padding-left: 90px;
}

.paging {
	list-style: none;
	padding-left: 400px;
	padding-top: 40px;
}

.paging li {
	float: left;
	margin-right: 45px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	font-weight: bord;
}

.paging .disable {
	padding: 3px 7px;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
}
#one td{
vertical-align: middle
}

td:nth-child(3) a{  font-size: medium;}
	footer {
		text-align: center;
	}
</style>
<title>??????/????????????</title>
</head>
<body>
<div id="wrap">
	<hr>
	<div id="header">
		<span class="title"><a href="user/shoplogin.jsp?id=${id }">CASE #</a></span>
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
	</c:when>
	<c:otherwise>
		<a href="user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
	<a href="ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="user/mypage.jsp?id=${id}">MYPAGE</a>  
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	<div class="container">
		<h2>??????/????????????</h2>
		<form action="ccontroller" method="post" name="o_frm" id="frm">

			<table class="table table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>????????????</th>
						<th>?????????</th>
						<th>??????</th>
						<th>????????????</th>
						<th>?????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th></th>
					</tr>
				</thead>
				<tbody  id="one">
								<c:if test="${empty olist }">
					<tr>
						<td colspan="9">??????????????? ????????????.</td>
					</tr>
				</c:if>
					<c:forEach var="vo" items="${olist}">
						<tr>
							<td>${vo.oNum}</td>
							<td>${vo.productNum}</td>
							<td><a href="#" onclick="nameclick(${vo.productNum})">${vo.productName}<br>(${vo.model })</a>
								<input type="hidden" name="id" value="${id }"></td>
							<td>${vo.cCount}&nbsp;???</td>
							<td><fmt:formatNumber value="${vo.price}"/>???</td>
							<td><fmt:formatNumber value="${vo.saleprice}"/>???</td>
							<td>${vo.oDate}</td>
							<td>${vo.payment}</td>
					<c:if test="${vo.payment eq '????????????'}">
							<td>
								<button  class="btn btn-outline-secondary"  name="onum" value="${vo.oNum}" id="detail">????????????</button> 
							 	<input type="hidden" name="funcc" value="detail"> 
								<input type="hidden" name="func" value="payment">
								<input type="hidden" name="id" value="${id }">
							</td>
					</c:if>
					<c:if test="${vo.payment eq '????????????'}">
							<td></td>
					</c:if>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9">
							<ol class="paging">
								<%--[????????????]??? ?????? ???????????? ?????? --%>
								<c:if test="${pvo.beginPage == 1 }">
									<li class="disable">&nbsp;&lt;&nbsp;</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li><a href="#" onclick="back(${pvo.beginPage - 1})">&nbsp;&lt;&nbsp;</a></li>
								</c:if>
								<%--???????????? ????????? ????????? ????????????(???????????????~????????????) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<li class="now">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<li><a href="#" onclick="back(${pageNo})">${pageNo }</a></li>
									</c:if>
								</c:forEach>
								<%--[????????????]??? ?????? ???????????? ?????? --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a href="#" onclick="back(${pvo.endPage + 1 })">&nbsp;&gt;&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">&nbsp;&gt;&nbsp;</li>
								</c:if>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script>
	//????????????&??????, ??????&?????? ??????
	$(document).ready(function() {
		$("#ch3").click(function() {
			if ($("#ch3").is(":checked"))
				$("input[name=chk4]").prop("checked", true);
			else
				$("input[name=chk4]").prop("checked", false);
		});

		$("input[name=chk4]").click(function() {
			var total = $("input[id=ch4]").length;
			var checked = $("input[id=ch4]:checked").length;

			if (total != checked)
				$("#ch3").prop("checked", false);
			else
				$("#ch3").prop("checked", true);
		});
	});
	
	//?????????????????? ??????
	function back(pageNo) {
		var frm = document.getElementById('frm');
		frm.action = "ccontroller?func=payment&funcc=cart&cPage="+pageNo;
		frm.submit();
	}	
	//???????????? ??????
	function nameclick(productnum) {
		let frm = document.forms.o_frm;
		frm.action = "ccontroller?func=content&productNum="+productnum;
		frm.submit();
	}
	function all_go(category) {
		var frm = document.getElementById('main');
		if (category == "all") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "PC001") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "AC002") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		}
	}
	function cart_go() {
		var frm = document.getElementById('main');
		frm.action = "ccontroller?func=cart&funcc=cartin";
		frm.submit();
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
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright ?? 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">?????? : ????????? ????????? ???????????? 124,4F(?????????,????????????) | ???????????? : 02-0123-4567 | ?????? : phonecaseshop@co.kr</p>
</footer>
</html>
