<%@page import="com.mystudy.Project_shop.vo.customerVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String id = request.getParameter("id");
	System.out.println("id : "+ id);
	session.setAttribute("id", id);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css" >
</head>
<body>

<div id="wrap">
	<hr>
	<div id="header">
		<span class="title"><a href="../user/shoplogin.jsp?id=${id }">CASE #</a></span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a href="shoplogin.jsp" id="shop">SHOP</a> | 
			<ul>
				<li><a href="all.jsp">all</a></li>
				<li><a href="phonecase.jsp">phone case</a></li>
				<li><a href="airpods.jsp">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="../bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="../bord/review.jsp?id=${id }">Review</a></li>
				<li><a href="../bord/qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
		<a href="../user/logout.jsp?id=${id }">LOGOUT</a> |
		<a href="../ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id }">MYPAGE</a>  
		<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
	</div>
<br><br><br><br><br>

<div class="container">
<div class="col text-center">
<table class="table table-striped w-auto">

  <h2>회원정보 수정</h2>
  <hr>
  <form action="controller" method="get">  
  <table class="table table-bordered">
     <tbody>
		<tr>
		 <th id="space" style="width: 30%">이름</th>
		  <td><input type="text" class="w-50 P-3" name="name" title="이름" value="${vo.name }"></td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">비밀번호</th>
		  <td><input type="password" class="w-50 P-3" name="pwd" id="pwd" title="비밀번호"></td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">비밀번호 확인</th>
		  <td><input type="password" class="w-50 P-3" name="pwdok" id="pwdok" title="비밀번호 확인"></td>
		</tr>
		 <tr>
		 <th id="space" style="width: 30%">주소</th>
		  <td><input type="text" class="w-50 P-3" name="addr" title="주소" value="${vo.addr }"></td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">휴대전화</th>
		  <td><input type="text" class="w-50 P-3" name="phone" title="휴대전화" value="${vo.phone }"></td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">이메일</th>
		  <td><input type="email" class="w-50 P-3" name="email" title="이메일" value="${vo.email }"></td>
		</tr>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-dark" value="수 정" onclick="update(this.form)">
				<input type="hidden" class="btn btn-dark" name="id" value="${id }">
				<input type="reset" class="btn btn-dark" value="RESET">
				<input type="hidden" name="type" value="updateOk">
			</td>
		</tr>
	</tfoot>
  </table>
  </form>
  </table>
  </div>
</div>
</body>

<script>
	function update(form) {
		let pwd = document.getElementById("pwd").value;
		let pwdok = document.getElementById("pwdok").value;
		
		let firstForm = document.forms[0]; //폼 자체의 값을 의미
		
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "을(를) 입력하세요");
				console.log("firstForm.elements[i] : " + firstForm.elements[i]);
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			} 
		}
		if (pwd.trim() != pwdok.trim()) {
			alert("비밀번호가 일치하지 않습니다.\n다시 입력해 주세요.");
			return;
		}
		
		firstForm.submit();
	}
	
	
</script>
<br><br><br><br><br><br>

<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>

</html>