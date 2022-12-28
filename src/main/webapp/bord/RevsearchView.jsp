<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mystudy.Project_shop.dao.*"%>
<%@page import="com.mystudy.Project_shop.common.Paging" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="dao" class="com.mystudy.Project_shop.dao.ShopDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	session.setAttribute("keyword", request.getParameter("keyword"));
	session.setAttribute("idx", request.getParameter("idx"));
	session.setAttribute("id", request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Review 검색 게시판</title>
<script>
	function search_go() {
		let firstForm = document.forms[0];
		alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length-4; i++){
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "를 입력 하세요");
				firstForm.elements[i].value= "";
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	function shopclick() {
		if("${id}" == ""){
			location.href = "/Project_shop/user/shop.jsp";
		} else {
			location.href = "/Project_shop/user/shoplogin.jsp?id=${id}";
		}
	}
	function main() {
		if("${id}" == ""){
			location.href = "/Project_shop/user/shop.jsp";
		} else {
			location.href = "/Project_shop/user/shoplogin.jsp?id=${id}";
		}
	}
</script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
	.paging {
		list-style: none;
		margin: auto;
	}
	.paging li {
		float: left;
		margin-right: auto;
		 
	}
	.paging li a {
		text-decoration: none;
		padding: 3px 7px;
		display: block;
		font-weight: bold;
	}
	.paging .disable {
		display:inline-block;
		border: 1px solid sliver;
		font-weight: bold;
		color: silver;
	}
	.paging .now {
		padding: 3px 7px;
		font-weight: bold;
	}
	.paging {
		text-align: center;
	}
	
</style>
<link href="/Project_shop/css/main.css" rel="stylesheet" type="text/css" >
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
				<li><a href="/Project_shop/ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="/Project_shop/ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="/Project_shop/ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="/Project_shop/bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="/Project_shop/bord/review.jsp?id=${id }">review</a></li>
				<li><a href="/Project_shop/bord/qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
	<c:choose>
	<c:when test="${id == ''}">
		<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	</c:when>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp?id=${id}">ADMIN</a>
		</c:when> 
	<c:otherwise>
		<a href="../user/logout.jsp?id=${id }">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
		<a href="cart.jsp?id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>  
	</div>
	<br><br><br><br>
	<div>
		<h3>&lt; Review &gt;</h3>
		<br><br><br>
	</div>
	<div class="container">
	<table class="table table-hover">
	 <colgroup>
                <col width="10%" />
                <col width="70%" />
                <col width="10%" />
                <col width="10%" />
     </colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th id="subject">제목</th>
				<th>아이디</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5"> <h2>검색된 게시글이 없습니다.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bNum }</td>
						<td>
						<a href="/Project_shop/bord/Rview.jsp?bNum=${vo.bNum }&cPage=${pvo.nowPage}&id=${id}">${vo.title }</a> </td>
						<td>${vo.id }</td>
						<td>${vo.bDate }</td>
						<td>${vo.hits }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
		<tr>
		</tr>
			<tr>
				<td colspan="4"  style="border-bottom: none;">
					<ol class="paging">
						<c:if test="${pvo.beginPage == 1 }">
								<li class="disable">이전으로</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
								<li><a href="/Project_shop/bord?type=revSearch&cPage=${pvo.beginPage -1 }&keyword=${keyword }&idx=${idx}&id=${id}">이전으로</a></li>
						</c:if>
						
						<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>									
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li><a href="/Project_shop/bord?type=revSearch&cPage=${pageNo }&keyword=${keyword }&idx=${idx}&id=${id}">${pageNo }</a></li>
								</c:if>
						</c:forEach>
						<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="/Project_shop/bord?type=revSearch&cPage=${pvo.endPage +1}&keyword=${keyword }&idx=${idx}&id=${id}">다음으로</a></li>
							</c:if>
							
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
						</c:if>
						
					</ol>
				</td>
				<td style="border-bottom: none;">
					<input type="button" value="글쓰기" class="btn btn-dark" onclick='javascript:location.href="/Project_shop/bord/revWrite.jsp?id=${id}"'>
				</td>
			</tr>
			<tr>
					<td colspan="5"  style="border-bottom: none;">
					<div id="search">
					<form action="bord?type=revSearch" method="post"> 
						<select name="idx">
							<option value="0">아이디</option>
							<option value="1">제목</option>
						</select>
						<input type="text" name="keyword" title="검색어">
						<input type="hidden" name="type" value="search">
						<input type="hidden" name="begin" value="${p.beginPage }">
						<input type="hidden" name="end" value="${p.endPage }">
						<input type="hidden" name="id" value="${id }">
						<input type="button" value="검색" class="btn btn-dark" onclick="search_go()">
					</form>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
</div>
<br>

</body>
</html>