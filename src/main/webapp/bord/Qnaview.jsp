<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("utf-8");
//파라미터 값 추출
int qNum = Integer.parseInt(request.getParameter("qNum"));
String cPage = request.getParameter("cPage");

System.out.println("qNum : " + qNum);
System.out.println("cPage : " + cPage);

//조회수 1 증가
int up = ShopDAO.upHit(qNum);

qnaVO vo = ShopDAO.selectOne(qNum);
System.out.println("qNum : " + qNum);
System.out.println("vo : " + vo);

session.setAttribute("vo", vo);
session.setAttribute("qNum", qNum);
session.setAttribute("cPage", cPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>QNA VIEW</title>
<script>
	function qna_go() {
		location.href = "/Project_shop/bord/qna.jsp?id=${id}&cPage=${cPage}";
	}
	function qna_modify() {
		location.href = "/Project_shop/bord?type=modify&qNum=${qNum}&cPage=${cPage}&id=${id}";
	}
	function qna_delete() {
		location.href = "/Project_shop/bord?type=delete&qNum=${qNum}&cPage=${cPage}&id=${id}";
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

}
h2 {text-align: center;}
#title {
	text-align: center;
	font-size: 2em;
	border-top: none;	
}

th,td { text-align: center; font-size: 1.4em;}
</style>
<link href="/Project_shop/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<hr>
		<div id="header">
			<span class="title"><a type="button" onclick="main()">CASE
					#</a></span>
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
				<li><a href="community.jsp?id=${id }" id="community">COMMUNITY</a>
					|
					<ul>
						<li><a href="review.jsp?id=${id }">review</a></li>
						<li><a href="qna.jsp?id=${id }">Q&A</a></li>
					</ul></li>
			</ul>
			<c:choose>
				<c:when test="${id eq '' || id eq null}">
					<a href="../user/login.jsp">LOGIN</a> |
		<a href="../user/join.jsp">JOIN US</a> |
	</c:when>
				<c:otherwise>
					<a href="../user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
			</c:choose>
			<a href="../ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
			<a href="../user/mypage.jsp?id=${id}">MYPAGE</a>
			<c:choose>
				<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
			</div></div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="container">
			<h2>&lt;Q&A&gt;</h2><br><br><br><br>
				<table class="table">
					<colgroup>
						<col width="20%" />
						<col width="65%" />
						<col width="15%" />
					</colgroup>
					<tbody>
						<tr>
							<th id="title" colspan="2">NO. ${vo.qNum }</th>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${vo.id }</td>
						</tr>
						<tr>
							<th>작성일자</th>
							<td>${vo.qDate }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${vo.qTitle }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${vo.qContents }</td>
						</tr>
						<tr>
							<td colspan="2"><c:choose>
									<c:when test="${id == vo.id || fn:contains(id, 'admin')}">
										<button onclick="qna_modify()">수정</button>
										<button onclick="qna_delete()">삭제</button>
										<button onclick="qna_go()">목록보기</button>
									</c:when>
									<c:otherwise>
										<button onclick="qna_go()">목록보기</button>
									</c:otherwise>
								</c:choose> <input type="hidden" name="id" value="${id }"> <input
								type="hidden" name="cPage" value="${cPage }"> <input
								type="hidden" name="qNum" value="${qNum }"></td>
						</tr>
					</tbody>

				</table>
			</div>
			<br>
			<br>
			<br>
</body>
</html>