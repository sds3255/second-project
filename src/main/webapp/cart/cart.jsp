<%@page import="com.mystudy.Project_shop.common.Paging"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.CartDAO"%>
<%@page import="com.mystudy.Project_shop.vo.CartVO"%>
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
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>장바구니</title>
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
	min-width: 1000px;
	max-width: 1000px;
	height: 50%;
}

.container h2 {
	padding-top: 50px;
	padding-bottom: 80px;
	text-align: center;
}

table {
	text-align: center;
}

#btn {
	text-align: center;
}

#btn>input {
	margin: 20px;
}

#cnt {
	width: 50px;
}

.paging {
	list-style: none;
	padding-left: 380px;
	padding-top: 40px;
	padding-bottom: 40px;
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

#tbody td {
	vertical-align: middle;
}

thead th {
	vertical-align: middle;
}

#btnupdate {
	font-size: 0.6em;
}
td:nth-child(5) a {
	font-size: medium;
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
		<h2>장바구니</h2>

		<table class="table table-striped">
			<colgroup>
				<col style="width: 3%;">
				<col style="width: 10%;">
				<col style="width: 12%;">
				<col style="width: 20%;">
				<col style="width: 20%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 15%">
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="ch1" name="chk1"
						onclick="checkAll(this)"></th>
					<th>No.</th>
					<th>상품번호</th>
					<th>상품사진</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>할인가</th>
					<th>수량</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:if test="${empty list }">
					<tr>
						<td colspan="9">장바구니가 비었습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td id="1">
							<form action="ccontroller" method="post" name="frm1">
								<input type="checkbox" id="ch2" name="chk2" value="${vo.cNum }">
							</form>
						</td>
						<td>${vo.cNum }</td>
						<td>
							<form action="ccontroller" method="post" name="frm3">
								<input type="hidden" name="id" value="${id }">${vo.productNum }
							</form>
						</td>
						<td><img alt="제품사진" src="image/${vo.image}.jpg"
							style="width: 100%; height: 150px;"></td>
						<td><a href="#" onclick="nameclick(${vo.productNum})">${vo.productName}<br>(${vo.model })
						</a></td>
						<td><fmt:formatNumber value="${vo.price}" />원</td>
						<td><fmt:formatNumber value="${vo.saleprice}" />원</td>
						<td>
							<form action="ccontroller" method="post" name="frm3">
								<input id="cnt" type="number" min="1" max="10" value="${vo.cCount }" name="count">&nbsp;개
								<td>
								<input type="button" id="btnupdate" class="btn btn-outline-secondary" onclick="update(this.form,${pvo.nowPage})" value="수 정"> 
								<input type="hidden" name="cnum"  id="cnum" value="${vo.cNum }">
								</td>
 						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
 <form action="ccontroller" method="post" name="frm3"> 
		<ol class="paging">
			<%--[이전으로]에 대한 사용여부 처리 --%>
			<c:if test="${pvo.beginPage == 1 }">
				<li class="disable">&nbsp;&lt;&nbsp;</li>
			</c:if>
			<c:if test="${pvo.beginPage != 1 }">
				<li><a href="#" onclick="back(${pvo.beginPage - 1})">&nbsp;&lt;&nbsp;</a></li>
			</c:if>

			<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
			<c:forEach var="pageNo" begin="${pvo.beginPage }"
				end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != pvo.nowPage }">
					<li><a href="#" onclick="back(${pageNo})">${pageNo }</a></li>
				</c:if>
			</c:forEach>

			<%--[다음으로]에 대한 사용여부 처리 --%>
			<c:if test="${pvo.endPage < pvo.totalPage }">
				<li><a href="#" onclick="back(${pvo.endPage + 1 })">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			<c:if test="${pvo.endPage >= pvo.totalPage }">
				<li class="disable">&nbsp;&gt;&nbsp;</li>
			</c:if>

		</ol>
</form>
		<br>
		<div id="btn">
			<input type="button" class="btn btn-outline-dark" onclick="pay()"
				value="결제하기"> <input type="button"
				class="btn btn-outline-dark" onclick="del(${pvo.nowPage})" value="삭제">
		</div>

	</div>
	<script>
		$(document).ready(function() {
			$("#ch1").click(function() {
				if ($("#ch1").is(":checked"))
					$("input[name=chk2]").prop("checked", true);
				else
					$("input[name=chk2]").prop("checked", false);
			});

			$("input[name=chk2]").click(function() {
				var total = $("input[id=ch2]").length;
				var checked = $("input[id=ch2]:checked").length;

				if (total != checked)
					$("#ch1").prop("checked", false);
				else
					$("#ch1").prop("checked", true);
			});
		});
		//페이지넘기기 기능
		function back(pageNo) {
			var frm = document.forms.frm3;
			frm.action = "ccontroller?func=cart&funcc=cartin&cPage="+pageNo;
			frm.submit();
		}	

		//수정클릭
		function update(frm,cPage) {
			frm.action = "ccontroller?func=cart&funcc=update&cPage="+cPage+"&id=${id}";
			alert("수량이 변경되었습니다.");
			frm.submit();
		}

		//삭제클릭
		function del(cPage) {
			var array = new Array();
			$("input:checkbox[name=chk2]:checked").each(function() {
				array.push(this.value);
			});

			let frm = document.forms.frm1;
			frm.action = "ccontroller?func=cart&funcc=del&chk2=" + array+"&cPage="+cPage+"&id=${id}";
			alert("선택 상품이 장바구니에서 삭제되었습니다.");
			frm.submit();
		}
		//결제클릭
		function pay() {
			var array = new Array();
			$("input:checkbox[name=chk2]:checked").each(function() {
				array.push(this.value);
			});
			let frm = document.forms.frm3;
			frm.action = "ccontroller?func=cart&id=${id}&funcc=cart&chk2=" + array;
			frm.submit();
		}
		//상품이름클릭
		function nameclick(productnum) {
			let frm = document.forms.frm3;
			frm.action = "ccontroller?func=content&id=${id}&productNum="+productnum;
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
			}else if (category == "AC002") {
				frm.action = "ccontroller?func=all&category=" + category;
				frm.submit();
			}
		}
		//네비게이션바에서 cart누를시
		function cart_go(){
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
</body>
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>