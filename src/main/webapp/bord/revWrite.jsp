<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	request.getParameter("cPage");
	request.getParameter("bNum");
	List<productVO> Plist = ShopDAO.PList(id);
	session.setAttribute("Plist", Plist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>문의글 작성</title>
<script type="text/javascript">
function sendData(){
	let firstForm = document.forms[0];
	alert("firstForm.elements.length : " + firstForm.elements.length);
	for (let i = 0; i < firstForm.elements.length; i++){
		if (firstForm.elements[i].value.trim() == "") {
			if(i == 3 || i == 6) continue; //첨부파일은 제외
			alert(firstForm.elements[i].title + i + " 입력 하세요");
			firstForm.elements[i].value= "";
			firstForm.elements[i].focus();
			return;
		}
	}
	firstForm.submit();
	}
	
	function Rev_go() {
		location.href="review.jsp?id=${id }";
	}
	function main() {
		if("${id}" == ""){
			location.href = "/Project_shop/user/shop.jsp";
		} else {
			location.href = "/Project_shop/user/shoplogin.jsp?id=${id}";
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
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="bord/review.jsp?id=${id }">review</a></li>
				<li><a href="qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	<a href="../user/login.jsp">CART</a> |
		<a href="../user/login.jsp">MYPAGE</a>  
	</c:when>
	<c:otherwise>
		<a href="../user/logout.jsp">LOGOUT</a> |
		<a href="../ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
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
	<br><br><br><br>
			<hr>
			<br>
			<h3>Review 작성하기</h3>
			<br><br><br>
	<form action="/Project_shop/bord?type=Rwrite_ok" method="post" enctype="multipart/form-data">
<div class="container">
	<table class="table table-hover">
		<colgroup>
                <col width="20%" />
                <col width="60%" />
                <col width="10%" />
                <col width="10%" />
         </colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" title="제목" name="title">	
					</td>
					<td >작성자 &nbsp;&nbsp;&nbsp; ${id }</td>
				</tr>
				<tr>
					<th>구매상품</th>
						<td>
							<select name="proName" >
							<option value=" " disabled selected hidden>-- 선택 --</option>
				<c:forEach var="vo" items="${Plist}">
								<option value="${vo.model} ${vo.productName }">${vo.model} - ${vo.productName }</option>
				</c:forEach>
							</select>
						</td>
				<tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea name="bContent" title="내용"  rows="8" cols="50"></textarea>	
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="fileName" title="file"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" value="저장" onclick="sendData()">
					<input type="hidden" name="id" value="${id }">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="button" value="목록보기" onclick="Rev_go()">
					</td>
				</tr>
			</tbody>
		
		</table>
		</div>
	</form>
</div>

</body>
</html>