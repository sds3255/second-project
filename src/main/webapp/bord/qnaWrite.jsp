<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
pageContext.setAttribute("id", id);
%>
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
<title>문의글 작성</title>
<script type="text/javascript">
	function sendData() {
		let firstForm = document.forms[0];
		let pwd1 = document.getElementById('pwd1').value;
		let pwd2 = document.getElementById('pwd2').value;
		alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length; i++) {
			console.log(firstForm.elements[i]);
			console.log(firstForm.elements[i].value);
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "입력을 하세요");
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			}
		}
		if (pwd1.trim() != pwd2.trim()) {
			alert("비밀번호가 일치하지 않습니다. \n확인하고 다시 입력해주세요");
			return;
		}
		firstForm.submit();
	}

	function qna_go() {
		location.href = "qna.jsp?id=${id }";
	}
	function shopclick() {
		if ("${id}" == "") {
			location.href = "../user/shop.jsp";
		} else {
			location.href = "../user/shoplogin.jsp?id=${id}";
		}
	}
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap')
	;
</style>
<link href="/Project_shop/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<hr>
		<div id="header">
			<span class="title">CASE #</span>
		</div>
		<hr>
		<div id="nav">
			<ul>
				<li><a type="button" onclick="shopclick()" id="shop">SHOP</a> |
					<ul>
						<li><a href="../ccontroller?func=all&category=all&id=${id }">all</a></li>
						<li><a
							href="../ccontroller?func=all&category=PC001&id=${id }">phone
								case</a></li>
						<li><a
							href="../ccontroller?func=all&category=AC002&id=${id }">airpods
								case</a></li>
					</ul></li>
				<li><a href="community.jsp" id="community">COMMUNITY</a> |
					<ul>

								<li><a href="review.jsp?id=${id }">review</a></li>
								<li><a href="qna.jsp?id=${id }">Q&A</a></li>

					</ul></li>
			</ul>
			<c:choose>
				<c:when test="${id eq '' || id eq null}">
					<a href="/Project_shop/user/login.jsp">LOGIN</a> |
					<a href="/Project_shop/user/join.jsp">JOIN US</a> |
	</c:when>
				<c:otherwise>
					<a href="/Project_shop/user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
			</c:choose>
			<a href="/Project_shop/ccontroller?func=cart&funcc=cartin&id=${id }">CART</a>
			| <a href="/Project_shop/user/mypage.jsp?id=${id}">MYPAGE</a>
			<c:choose>
				<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
				</c:when>
			</c:choose>
		</div>

		<br>
		<br>
		<form action="../bord" method="get">
			<caption>Q&A 작성하기</caption>
			<hr>
			<br>
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
							<td><input type="text" title="제목" name="Qtitle"></td>
							<td>작성자 &nbsp;&nbsp;&nbsp; ${id }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="2"><textarea name="Qcontent" title="내용"
									rows="8" cols="50"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="2"><input type="password" name="Qpwd" id="pwd1"
								title="비밀번호"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td colspan="2"><input type="password" name="Qpwd1"
								id="pwd2" title="비밀번호 확인"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="button" value="저장"
								onclick="sendData()"> <input type="reset" value="초기화">
								<input type="button" value="목록보기" onclick="qna_go()"> <input
								type="hidden" name="id" value="${id }"> <input
								type="hidden" name="type" value="Qwrite_ok"></td>
						</tr>
					</tbody>

				</table>
			</div>
		</form>
	</div>

</body>
</html>