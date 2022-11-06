<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
/* 	String id = request.getParameter("id");
	
	session.setAttribute("id", id); */
	session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 탈퇴</title>
<script>
	function main() {
		if("${id}" == ""){
			location.href = "shop.jsp";
			return;
		} else {
			location.href = "shoplogin.jsp?id=${id}";
		}
	}
	function delete_go(form) {
		if (form.pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pwd.focus();
			return;
		} 
		if (form.pwd.value != "${result}") {
			console.log("pwd : " + form.pwd.value);
			console.log("pwd : " + '${result}');
			alert ("비밀번호가 일치하지 않습니다.");
			return;
		} else {
				if (confirm("탈퇴를 원하시면 확인을 누르시고 탈퇴를 하지 않으려면 취소를 눌러주세요")) {	
					form.submit();
				} else {
					alert("취소되었습니다.");
				} 
			} 	
	}

</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css" >
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
			<c:choose>
			<c:when test="${id == '' }">
			<a href="shop.jsp" id="shop">SHOP</a> | 
			</c:when>
			<c:otherwise>
			<a href="shoplogin.jsp?id=${id }" id="shop">SHOP</a> |
			</c:otherwise>
			</c:choose>
			<ul>
				<li><a href="all.jsp?id=${id }">all</a></li>
				<li><a href="phonecase.jsp?id=${id }">phone case</a></li>
				<li><a href="airpods.jsp?id=${id }">airpods case</a></li>
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
			| <a href="admin.jsp?id=${id }">ADMIN</a>
		</c:when> 
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
	</div>
<br><br><br><br><br>

<div class="container">
<div class="col text-center">
<table class="table table-striped w-auto">

  <h2>회원탈퇴</h2>
  <hr>
  회원 탈퇴를 원하시면 비밀번호를 입력해 주세요.
   <form action="controller" method="get">
  <table class="table table-bordered">
     <tbody>		  
		<tr>
		  <th id="space">비밀번호</th>
		  <td><input type="password" class="w-50 P-3" name="pwd" id="pwd" title="비밀번호" placeholder="PASSWORD를 입력하세요"></td>
		</tr>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-dark" value="탈퇴" onclick="delete_go(this.form)">
				<input type="button" class="btn btn-dark" value="메인 화면으로 돌아가기" onclick="javascript:location.href='shoplogin.jsp'">
				<input type="hidden" name="type" value="delete_customer">
				<input type="hidden" name="id" value="${id}">
			</td>
		</tr>
	</tfoot>
  </table>
  </form>
  </table>
  </div>
</div>
</body>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>