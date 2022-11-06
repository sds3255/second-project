<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("UTF-8");
	int qNum = Integer.parseInt(request.getParameter("qNum"));
	String cPage = request.getParameter("cPage");
	session.setAttribute("cPage", cPage);
	session.setAttribute("qNum", qNum);
	
	System.out.println(cPage);
	System.out.println(qNum);
	session.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>
<script>
	function qnaModify() {
		let pwd = document.getElementById('pwd').value;
/* 		location.href = "controller?type=qnaModify";
		let pwdcheck = "${pwdout}";
		if(pwdcheck == null){
			alert("비밀번호가 일치하지 않습니다. \n 다시 입력해주세요!!");
			return;
		} */
		let firstForm = document.forms[0];
		alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length; i++){
			console.log(firstForm.elements[i]);
			console.log(firstForm.elements[i].value);
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "입력을 하세요");
				firstForm.elements[i].value= "";
				firstForm.elements[i].focus();
				return;
			}
		}
		
		/* let pwdcheck = "${pwdout}"; */
		if("${vo.qPwd}" != pwd){
			alert("비밀번호가 일치하지 않습니다. \n 다시 입력해주세요!!");
			return;
		} 
		firstForm.submit();
		
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
</style>
<link href="/Project_shop/css/main.css" rel="stylesheet" type="text/css" >
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
			<a href="shop.jsp?id=${id }" id="shop">SHOP</a> | 
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
		<a href="../user/logout.jsp">LOGOUT</a> |
		<a href="../user/cart.jsp?id=${id }">CART</a> |
		<a href="../user/mypage.jsp?id=${id }">MYPAGE</a>  
		<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp?id=${id }">ADMIN</a>
		</c:when> 
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
	</div>
	<br><br>
</div>
<br><br>

<h2>게시판 수정 및 삭제 전 비밀번호 확인</h2>
  <hr>
<form action="/Project_shop/bord">
<div class="container">
  <table class="table table-bordered">
     <tbody>
     <tr>
     	<td colspan="2" id="font">* 게시판 수정을 위해 게시판 작성시 입력한 비밀번호를 입력해주세요! *</td>
     </tr>
		<tr>
		 <th id="space">비밀번호</th>
		  <td><input type="password" name="pwd" id="pwd" title="비밀번호"></td>
		</tr>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="2">
				<input type="button" class="btn btn-dark" value="수정" onclick="qnaModify()">
				<input type="hidden" name="qNum" value="${qNum }">
				<input type="hidden" name="cPage" value="${cPage }">
				<input type="hidden" name="id" value="${id }">
				<input type="hidden" name="type" value="qnaModify">
				<input type="button" class="btn btn-dark" value="돌아가기" onclick="javascript:location.href='bord/qna.jsp?id=${id}'">

			</td>
		</tr>
	</tfoot>
  </table>
</div>
</form>


</body>
</html>