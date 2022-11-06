<%@page import="com.mystudy.vo.AdminCustomerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<style>
	td, form, tr { text-align: center; }
	#h { 
		text-align: center; 
		color: navy;
		} 
	input[type="text"]{
 		line-height: 16px;
  		vertical-align: middle;
	}
	select{
 		height: 27px;
  		vertical-align: middle;
	}
	button {
		height: 33px;
  		vertical-align: middle;
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
<%@ include file="../common/adminmenu.jspf" %>
 	<hr>
	<form action="controller" method="get" enctype="multipart/form-data">
		<select name="select">
			<option title="상품" value="0">PRODUCT</option>
			<option title="아이디" value="1">ID</option>
		</select>
		<input type="text" name="keyword" style=" height:27px;">
		<button type="submit" class="btn btn-secondary">Search</button>
		<input type="hidden" name="type" value="admin-reviewList">
	</form>
	<br>
<div class="container">
	<table class="table table-striped">
		<thead>
			<tr>
				<th width="10%">No.</th>
				<th width="15%">ID</th>
				<th width="30%">TITLE</th>
				<th width="25%">PRODUCT</th>
				<th>DATE</th>
				<th width="10%">HITS</th>
			</tr>
		</thead>
		<tbody>
	
	<c:if test="${empty list }">
			<tr>
				<td colspan="6">검색된 후기가 없습니다.</td>
			</tr>
	</c:if>	
	
	<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.bNum }</td>
					<td>${vo.id }</td>
					<td>
						<a class="link" href="controller?type=admin-reviewDetailSearch&bNum=${vo.bNum}&cPage=${pvo.nowPage }&select=${select}&keyword=${keyword}" style="font-size: 1em; color: black;">
							${vo.title }
						</a>
					</td>
					<td>${vo.productName }</td>
					<td>${vo.bDate.substring(0,10) }</td>
					<td>${vo.hits }</td>
				</tr>				
			</c:forEach>
		</c:if>
		</tbody>
	</table>
</div>
<div class="center">
	<div id="page">
		<ol class="paging">
		<c:if test="${pvo.beginPage == 1}">
			<li class="disable">&nbsp;&lt;&nbsp;</li>
		</c:if>
		<c:if test="${pvo.beginPage != 1}">	
			<li>
					<a href="controller?type=admin-reviewList&cPage=${pvo.beginPage - 1 }&select=${select}&keyword=${keyword}">&nbsp;&lt;&nbsp;</a> 
			</li>
		</c:if>
		
		<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:if test="${pageNo == pvo.nowPage }">
				<li class="now">${pageNo}</li>
			</c:if>
			<c:if test="${pageNo != pvo.nowPage }">
	 			<li class="notnow"><a href="controller?type=admin-reviewList&cPage=${pageNo }&select=${select}&keyword=${keyword}">${pageNo}</a></li> 
			</c:if>
		</c:forEach>	
		
		<c:if test="${pvo.endPage < pvo.totalPage}">
			<li>
					<a href="controller?type=admin-reviewList&cPage=${pvo.endPage + 1 }&select=${select}&keyword=${keyword}">&nbsp;&gt;&nbsp;</a>
			</li>
		</c:if>
		<c:if test="${pvo.endPage >= pvo.totalPage}">
			<li class="disable">&nbsp;&gt;&nbsp;</li>
		</c:if>
		</ol>
	</div>
</div>
</body>
</html>