<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
	String bNum = request.getParameter("bNum");
 	int bNum1 = Integer.parseInt(request.getParameter("bNum"));
	String cPage = request.getParameter("cPage");
	int up = ShopDAO.rUpHit(bNum1);
	
	reviewVO vo = ShopDAO.selectOneRev(bNum1);
	session.setAttribute("vo", vo);
	session.setAttribute("bNum", bNum);
	session.setAttribute("cPage", cPage);
	
	List<reviewCommentsVO> cmtList = ShopDAO.cmtList(bNum1);
	
	pageContext.setAttribute("List", cmtList); 
	pageContext.setAttribute("id", request.getParameter("id")); 
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
<title>QNA VIEW</title>
<script>
	function cmtInsertGo() {
		let firstForm = document.forms[0];
		if (document.getElementById('cmtCnt').value.trim() == ""){
			alert("댓글을 작성해 주세요");
			document.getElementById("cmtCnt").focus();
			return;
		} 
		firstForm.submit();
	} 

	if(${cmtDre} == 1){
		alert("댓글이 삭제되었습니다.");
	}
	function shopclick() {
		if("${id}" == ""){
			location.href = "../user/shop.jsp";
		} else {
			location.href = "../user/shoplogin.jsp?id=${id}";
		}
	}
	function main() {
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
	h3  { text-align: center;}	
	#title { text-align : center; border-top: none; font-size: 2em;}
th, td { text-align: center; font-size: 1.5em;}
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
				<li><a type="button" onclick="shopclick()" id="shop">SHOP</a> | 
					<ul>
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
					</ul></li>
				<li><a href="community.jsp" id="community">COMMUNITY</a> |
					<ul>
						<li><a href="review.jsp">review</a></li>
						<li><a href="qna.jsp">Q&A</a></li>
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
		</div>
		<br>
		<br>
	</div>
<br><br>
<div class="container">
<h3>&lt; Review &gt;</h3><br><br><br><br>
	<table class="table">
<%-- 		<colgroup>
			<col width="20%" />
			<col width="65%" />
			<col width="15%" />
		</colgroup> --%>
		<tbody>
			<tr>
				<th colspan="2" id="title">NO. ${vo.bNum }</th>
				</tr>
			<tr>
				<th>작성자 </th>
				<td> ${vo.id }</td>
			</tr>
			<tr>
				<th>작성일시 </th>
				<td>${vo.bDate }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td >${vo.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td >${vo.bContents }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<c:choose>
					<c:when test="${empty vo.fileName }">
						<td >등록한 첨부파일이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<td colspan="2"><img style="max-width:200px;" alt="사진" src="/Project_shop/temp/${vo.fileName }" ></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="3">
				<c:choose>
					<%-- 	<c:when test="${id eq vo.id || fn:contains(id, 'admin')}">  --%>
						<c:when test="${id == vo.id || fn:contains(id, 'admin')}">  
							<button type="button" class="btn btn-default"><a href="/Project_shop/bord?type=rModify&bNum=${bNum}&cPage=${cPage}&id=${id}">수정</a></button>
							<button type="button" class="btn btn-default"><a href="/Project_shop/bord?type=rDelete&bNum=${bNum}&cPage=${cPage}&id=${id}">삭제</a></button>
							<button type="button" class="btn btn-default"><a href="javascript:window.history.back();">뒤로가기</a></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-default"><a href="review.jsp?cPage=${cPage }">뒤로가기</a></button>
						</c:otherwise>
					</c:choose> 
					<input type="hidden" name="id" value="${id }"> 
					<input type="hidden" name="cPage" value="${cPage }"> 
					<input type="hidden" name="bNum" value="${bNum }">
				</td>
			</tr>
		</tbody>

	</table>
	</div>
	<br>
	<br>
	<br>

	<hr id="hr">
	<div>
		<!-- 	<div class="comment-txt">
		<textarea id="cmtCnt" name="cmtCnt" placeholder="댓글을 작성해주세요!"></textarea>
	</div>
	<div class="comment-button">
		<button id="comment-btn">댓글달기</button>
	</div> -->
		<form action="bord">
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">
			<div>
				<textarea id="cmtCnt" name="cmtCnt" placeholder="댓글을 작성해주세요!"></textarea>
			</div>
			<div>
				<input type="button" value="작성" id="comment-btn" onclick="cmtInsertGo()">
			</div>
				<input type="hidden" name="bNum" value="${bNum }"> 
				<input type="hidden" name="cPage" value="${cPage }"> 
				<input type="hidden" name="id" value="${id }"> 
				<input type="hidden" name="type" value="cmtInsert">
		</c:when>
	</c:choose>
		</form>
	</div>
	<!-- 		게시글에 딸린 댓글 표시 영역 -->
		<c:choose>
			<c:when test="${empty List }">
				<h3>작성된 댓글이 없습니다.</h3>
			</c:when>
			<c:otherwise>
			<c:forEach var="cmt" items="${List }">
			<div class="comment">	
					작성자 : ${cmt.id } &nbsp;&nbsp; 작성일 : ${cmt.cDate }
					<p>내용 : ${cmt.content }</p>
			<c:choose>	
			<c:when test="${cmt.id == id }">
				<input type="button" value="삭제" onclick='javascript:location.href="bord?type=cmtDelete&bNum=${bNum }&cNum=${cmt.cNum}"'>
			</c:when>	
			</c:choose>		
<%-- 					<input type="submit" value ="댓글삭제">
					<input type="hidden" name="commentIdx" value="${commVO.commentIdx }">
					<input type="hidden" name="bbsIdx" value="${commVO.bbsIdx }">	 --%>	
			<hr>			
			</div>
			</c:forEach>
			</c:otherwise>
		</c:choose>
</body>
</html>