<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script>
	function update_customer() {
		location.href = "controller?type=update_customer&id=${id}";
	}
	
	function delete_customer() {
		location.href = "controller?type=deletecheck&id=${id}";
	}
	function main() {
		if("${id}" == ""){
			location.href = "shop.jsp";
		} else {
			location.href = "shoplogin.jsp?id=${id}";
		}
	}
</script>

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

  <h2>회원정보 상세보기</h2>
  <hr>
  <table class="table table-bordered">
     <tbody>
		<tr>
		 <th id="space" style="width: 30%">이름</th>
		  <td>${vo.name }</td>
		</tr>
		<tr>
		  <th id="space" style="width: 30%">아이디</th>
		  <td>${vo.id }</td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">비밀번호</th>
		  <td>${vo.pwd }</td>
		</tr>
		 <tr>
		 <th id="space" style="width: 30%">주소</th>
		  <td>${vo.addr }</td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">휴대전화</th>
		  <td>${vo.phone }</td>
		</tr>
		<tr>
		 <th id="space" style="width: 30%">이메일</th>
		  <td>${vo.email }</td>
		</tr>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-dark" value="수 정 " onclick="update_customer()">
				<input type="button" class="btn btn-dark" value="탈 퇴" onclick="delete_customer()">
				<input type="hidden" class="btn btn-dark" name="id" value="${shopVO.id }">
				<input type="button" class="btn btn-dark" value="메인 화면으로 돌아가기" onclick="javascript:location.href='shoplogin.jsp?id=${id}'">
			</td>
		</tr>
	</tfoot>
  </table>

  </table>
  </div>
</div>
</body>
<br><br><br><br><br><br>

<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>