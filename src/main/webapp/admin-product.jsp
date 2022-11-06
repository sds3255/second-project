<%@page import="com.mystudy.common.AdminPaging"%>
<%@page import="com.mystudy.vo.AdminProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.dao.AdminProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("list",request.getAttribute("list"));
	pageContext.setAttribute("pvo",request.getAttribute("pvo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	table {
		width: 800px;
		margin: 30px auto 0;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { 
		border: 1px solid black; 
		padding: 4px; 
	}
	.red { color: red; }
	td { text-align: center; }
	img {
  		width: 150px;
  		height: 170px;
  		object-fit: cover;
	}
	input[type="text"]{
 		line-height: 16px;
  		vertical-align: middle; 
	}
	select{
 		height: 27px;
   		vertical-align: middle; 
	}
	form button {
		height: 34px;
    	vertical-align: middle;
	}
	form {
	 	position: absolute;
		left: 51.5%;
	}
	th { 
		text-align: center;
	}
	@import
	url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
	@font-face {
	    font-family: 'IBMPlexSansKR-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.paging {
		list-style: none;
		padding-left: 300px;
		padding-top: 40px;
		padding-bottom: 40px;
		font-family: 'Anton';
		text-align: center;
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
		color: black;
	}
	.paging .disable {
		padding: 3px 7px;
		color: silver;
	}
	
	.paging .now {
		padding: 3px 7px;
		font-size: 0.8em;
	}
	.center {
		width: 85%;
		text-align: center;
	}
	#page {
		display: inline-block;
	}

</style>
</head>
<body>
	<%@ include file="/common/adminmenu.jspf" %>
 	<hr>
	<div style="display: flex; justify-content: center;">
 		<button type="button" class="btn btn-info"  onclick="addProduct()">상품등록</button>
 	</div>
 	<hr>
		<form action="controller" method="get" enctype="multipart/form-data"> 
		<select name="select">
			<option title="카테고리" value="0">CATEGORY</option>
			<option title="모델" value="1">MODEL</option>
		</select>
		<input type="text" name="keyword" style=" height:27px;">
		<button type="submit" class="btn btn-secondary">Search</button>
		<input type="hidden" name="type" value="admin-productList">
	</form>
	<br>
	<table>	
		<thead>
			<tr>
				<th width="10%">No.</th>
				<th width="15%">CATEGORY</th>
				<th width="20%">NAME</th>
				<th width="20%">PRICE</th>
				<th width="15%">MODEL</th>
				<th>IMAGE</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">현재 등록된 제품이 없습니다.</td>
			</tr>
		</c:if>	
		<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.productNum }</td>
					<td>${vo.category }</td>
					<td>${vo.productName }</td>
					<td>${vo.price}원<br>
						<span class="red"> 
							<c:if test="${0 ne vo.saleprice}">
								(할인가 : ${vo.saleprice}원)
							</c:if>
						</span>
					</td>
					<td>${vo.model }</td>
					<td>
						<a href="admin-productUpdate.jsp?productNum=${vo.productNum}&cPage=${cPage}">
							<img src="images/${vo.image}.jpg">
						</a>
					</td>
				</tr>				
			</c:forEach>
		</c:if>
		</tbody>
	</table>
<div class="center">
	<div id="page">
		<ol class="paging">
		<c:if test="${pvo.beginPage == 1}">
			<li class="disable">&nbsp;&lt;&nbsp;</li>
		</c:if>
		<c:if test="${pvo.beginPage != 1}">	
			<li>
 				<a href="controller?type=admin-product&cPage=${pvo.beginPage - 1 }">&nbsp;&lt;&nbsp;</a> 
			</li>
		</c:if>
		
		<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:if test="${pageNo == pvo.nowPage }">
				<li class="now">${pageNo}</li>
			</c:if>
			<c:if test="${pageNo != pvo.nowPage }">
	 			<li class="notnow"><a href="controller?type=admin-product&cPage=${pageNo }">${pageNo}</a></li> 
			</c:if>
		</c:forEach>	
		
		<c:if test="${pvo.endPage < pvo.totalPage}">
			<li>
 				<a href="controller?type=admin-product&cPage=${pvo.endPage + 1 }">&nbsp;&gt;&nbsp;</a>
			</li>
		</c:if>
		<c:if test="${pvo.endPage >= pvo.totalPage}">
			<li class="disable">&nbsp;&gt;&nbsp;</li>
		</c:if>
		</ol>
	</div>
</div>
<script>
	function addProduct() {
 		location.href = "admin-productAdd.jsp";
	}
</script>	
</body>
</html>