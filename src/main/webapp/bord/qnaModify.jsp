<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.getAttribute("vo");
	String cPage = request.getParameter("cPage");
	pageContext.setAttribute("cPage", cPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
<script type="text/javascript">
function qnaView(){
	
	let firstForm = document.forms[0];
	let pwd1 = document.getElementById('pwd1').value;
	let pwd2 = document.getElementById('pwd2').value;
	alert("firstForm.elements.length : " + firstForm.elements.length);
	for (let i = 0; i < firstForm.elements.length; i++){
		if (firstForm.elements[i].value.trim() == "") {
			alert(firstForm.elements[i].title + "입력을 하세요");
			firstForm.elements[i].value= "";
			firstForm.elements[i].focus();
			return;
		}
	}
	if(pwd1.trim() != pwd2.trim()){
		alert("비밀번호가 일치하지 않습니다. \n확인하고 다시 입력해주세요");
		return;
	}
	firstForm.submit();
	}
	
	function qna_go() {
		location.href="bord?type=qna";
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
		<span class="title">CASE #</span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a type="button" onclick="shopclick()" id="shop">SHOP</a> |  
			<ul>
				<li><a href="all.jsp">all</a></li>
				<li><a href="phonecase.jsp">phone case</a></li>
				<li><a href="airpods.jsp">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="community.jsp" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="review.jsp">review</a></li>
				<li><a href="qna.jsp">Q&A</a></li>
			</ul>
		</li>
	</ul>
		<a href="login.jsp">LOGIN</a> |
		<a href="join.jsp">JOIN US</a> |
		<a href="cart.jsp">CART</a> |
		<a href="mapage.jsp">MYPAGE</a> | 
		<a href="admin.jsp">ADMIN</a> 
	</div>
	<br><br>
	<form action="/Project_shop/bord" method="post">
			<caption>Q&A 수정하기</caption>
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
						<input type="text" title="제목" name="Qtitle" value="${vo.qTitle }">
					</td>
					<td >작성자 &nbsp;&nbsp;&nbsp; ${vo.id }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea name="Qcontent" title="내용"  rows="8" cols="50">${vo.qContents }</textarea>	
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="password" name="Qpwd" id="pwd1" title="비밀번호"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan="2"><input type="password" name="Qpwd1" id="pwd2" title="비밀번호 확인"></td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="button" class="btn btn-dark" value="수정" onclick="qnaView()">
					<input type="reset" value="초기화">
					<input type="button" value="목록보기" onclick="qna_go()">
					<input type="hidden" name="type" value="update_qna" >
					<input type="hidden" name="cPage" value="${cPage }" >
					<input type="hidden" name="qNum" value="${vo.qNum }" >
					</td>
				</tr>
			</tbody>
		
		</table>
	</form>
</div>

</body>
</html>