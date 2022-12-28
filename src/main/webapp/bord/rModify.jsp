<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.getAttribute("vo");
	String cPage = request.getParameter("cPage");
	pageContext.setAttribute("cPage", cPage);
	String bNum = request.getParameter("bNum");
	pageContext.setAttribute("bNum", bNum);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>문의글 작성</title>
<script type="text/javascript">
function rModify_ok(frm){
	
	let firstForm = document.forms[0];
	alert("firstForm.elements.length : " + firstForm.elements.length);
	for (let i = 0; i < firstForm.elements.length; i++){
		if (firstForm.elements[i].value.trim() == "") {
			if(i == 2)continue;
			alert(firstForm.elements[i].title + "입력을 하세요");
			firstForm.elements[i].value= "";
			firstForm.elements[i].focus();
			return;
		}
	}
	firstForm.submit();
	}
	
	function reView_go() {
		location.href="/Project_shop/bord/review.jsp?cPage=${cPage}&bNum=${bNum}";
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
	table {
		width: 90%;
		margin-left:auto;
		margin-right:auto;
	}  
	th, td {
		 padding: 8px;
		 text-align: left;
		 border-bottom: 1px solid #ddd;
		 border-color: navy;
	}
	table {
		width: 80%;
		margin-left:auto;
		margin-right:auto;
	}
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
				<li><a href="all.jsp?id=${id }">all</a></li>
				<li><a href="phonecase.jsp?id=${id }">phone case</a></li>
				<li><a href="airpods.jsp?id=${id }">airpods case</a></li>
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
	<c:when test="${id == ''}">
		<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	</c:when>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
	<c:otherwise>
		<a href="../user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
		<a href="cart.jsp?id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>  
	</div>
	<br><br>
	<form action="/Project_shop/bord?type=rModify_ok&cPage=${cPage }&bNum=${bNum}&id=${id}" method="post" enctype="multipart/form-data">
			<caption>Review 작성하기</caption>
			<hr>
			<br>
		<table>
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
						<input type="text" title="제목" name="Qtitle" value="${vo.title }">
					</td>
					<td >작성자: ${vo.id }</td>
				</tr>
				<tr>
					<th>구매상품</th>
					<td>${vo.productName }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea name="Qcontent" title="내용"  rows="8" cols="50">${vo.bContents }</textarea>	
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="fileName"  title="file"> ${vo.oriName }</td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" class="btn btn-dark" value="수정" onclick="rModify_ok(this.form)">
					<input type="button" value="돌아가기" onclick="reView_go()">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>