<%@page import="com.mystudy.Project_shop.vo.qnaVO"%>
<%@page import="com.mystudy.Project_shop.vo.reviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@page import="com.mystudy.Project_shop.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="dao" class="com.mystudy.Project_shop.dao.ShopDAO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	Paging p = new Paging();

	p.setTotalRecord(ShopDAO.getTotalCount());
	p.setTotalPage();
	String cPage = request.getParameter("cPage");
	if(cPage != null){
		p.setNowPage(Integer.parseInt(cPage));
	}
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	if (p.getEnd() > p.getTotalRecord()) p.setEnd(p.getTotalRecord());
	
	int nowPage = p.getNowPage();
	int beginPage = (nowPage - 1) / p.getNumPerBlock() *p.getNumPerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getNumPerBlock() -1);
	
	if (p.getEndPage() > p.getTotalPage()) p.setEndPage(p.getTotalPage());
	
	List<qnaVO> list = ShopDAO.getlist(p.getBegin(), p.getEnd());
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>QnA ?????? ?????? ?????????</title>
<script>
	function search_go() {
		let firstForm = document.forms[0];
		alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length-4; i++){
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "??? ?????? ?????????");
				firstForm.elements[i].value= "";
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	function write() {
		if("${id}" == ""){
			location.href = "../user/login.jsp";
		} else {
			location.href="qnaWrite.jsp?id=${id}";
		}
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
				<li><a href="/Project_shop/ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="/Project_shop/ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="/Project_shop/ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="/Project_shop/bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="/Project_shop/bord/review.jsp?id=${id }">review</a></li>
				<li><a href="/Project_shop/bord/qna.jsp?id=${id }">Q&A</a></li>
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
	<div>
		<h3>&lt; Q&A &gt;</h3>
		<br><br><br>
	</div>
	<div class="container">
	<table class="table table-hover">
	 <colgroup>
                <col width="10%" />
                <col width="70%" />
                <col width="10%" />
                <col width="10%" />
     </colgroup>
		<thead>
			<tr>
				<th>??????</th>
				<th id="subject">??????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>?????????</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5"> <h2>?????? ????????? ???????????? ????????????.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.qNum }</td>
						<td>
						<a href="/Project_shop/bord/Qnaview.jsp?qNum=${vo.qNum }&cPage=${pvo.nowPage}&id=${id}">${vo.qTitle }</a> </td>
						<td>${vo.id }</td>
						<td>${vo.qDate }</td>
						<td>${vo.qHits }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
		<tr>
		</tr>
			<tr>
				<td colspan="4"  style="border-bottom: none;">
					<ol class="paging">
						<c:if test="${pvo.beginPage == 1 }">
								<li class="disable">????????????</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
								<li><a href="/Project_shop/bord/qna.jsp?cPage=${pvo.beginPage -1 }&id=${id}">????????????</a></li>
						</c:if>
						
						<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>									
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li><a href="/Project_shop/bord/qna.jsp?cPage=${pageNo }&id=${id}">${pageNo }</a></li>
								</c:if>
						</c:forEach>
						<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="/Project_shop/bord/qna.jsp?cPage=${pvo.endPage +1}&id=${id}">????????????</a></li>
							</c:if>
							
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">????????????</li>
						</c:if>
						
					</ol>
				</td>
				<td style="border-bottom: none;">
					<button type="button" class="btn btn-default"><a href="javascript:write();">?????????</a></button>
					<!-- <input type="button" value="?????????" class="btn btn-default"  onclick="write()"> -->
				</td>
			</tr>
			<tr>
				<td colspan="5"  style="border-bottom: none;">
					<div id="search">
					<form action="../bord?type=search&id=${id}" method="post"> 
						<select name="idx">
							<option value="0">?????????</option>
							<option value="1">??????</option>
						</select>
						<input type="text" name="keyword" title="?????????">
						<input type="hidden" name="type" value="search">
						<input type="hidden" name="begin" value="${p.beginPage }">
						<input type="hidden" name="end" value="${p.endPage }">
						<input type="hidden" name="id" value="${id }">
						<input type="button" value="??????" class="btn btn-dark" onclick="search_go()">
					</form>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
</div>
<br>

</body>
</html>