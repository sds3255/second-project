<%@page import="com.mystudy.Project_shop.common.Paging"%>
<%@page import="com.mystudy.Project_shop.vo.reviewVO"%>
<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.Project_shop.dao.ShopDAO"%>
<%@page import="com.mystudy.Project_shop.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Paging p = new Paging();
	
	p.setTotalRecord(ShopDAO.RgetTotalCount());
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
	List<reviewVO> list = ShopDAO.Rgetlist(p.getBegin(), p.getEnd());

	pageContext.setAttribute("id", request.getParameter("id"));
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
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
<title>리뷰 게시판</title>
<script>
	if("${result}" == 1){
		alert("게시글이 수정되었습니다.");
	}
	if("${Deleteresult}" == 1){
		alert("게시글이 삭제되었습니다.");
	}
	
	function search_go() {
		let firstForm = document.forms[0];
		alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length-4; i++){
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "를 입력 하세요");
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
			location.href="revWrite.jsp?id=${id}&bNum=${bNum }&cPage=${nowPage}";
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
		if("${id}" != ""){
			location.href = "../user/shoplogin.jsp?id=${id}";
			return;
		} else {
			location.href = "../user/shop.jsp";
		}
	}
</script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Anton&display=swap');
	.paging {
		list-style: none;
		margin: auto;
		text-align: center;
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
				<li><a href="../ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="../ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="../ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
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
	
		<h3>&lt; Review &gt;</h3>
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
				<th>번호</th>
				<th id="subject">제목</th>
				<th>아이디</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5"> <h2>현재 등록된 게시글이 없습니다.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bNum }</td>
						<td>
						<a href="/Project_shop/bord/Rview.jsp?bNum=${vo.bNum }&cPage=${pvo.nowPage}&id=${id}">${vo.title }</a> </td>
						<td>${vo.id }</td>
						<td>${vo.bDate }</td>
						<td>${vo.hits }</td>
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
								<li class="disable">이전으로</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
								<li><a href="/Project_shop/bord/review.jsp?cPage=${pvo.beginPage -1 }">이전으로</a></li>
						</c:if>
						
						<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>									
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li><a href="/Project_shop/bord/review.jsp?cPage=${pageNo }">${pageNo }</a></li>
								</c:if>
						</c:forEach>
						<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="/Project_shop/bord/review.jsp?cPage=${pvo.endPage +1}">다음으로</a></li>
							</c:if>
							
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
						</c:if>
						
						
					</ol>
				</td>
				<td style="border-bottom: none;">
					<button type="button" class="btn btn-small"><a href="javascript:write();">글쓰기</a></button>
				</td>
			</tr>
			<tr>
				<td colspan="5"  style="border-bottom: none;">
					<div id="search">
					<form action="../bord?type=revSearch&id=${id}" method="post"> 
						<select name="idx">
							<option value="0">아이디</option>
							<option value="1">제목</option>
						</select>
					<input type="text" name="keyword" title="검색어">
						<input type="hidden" name="type" value="search">
						<input type="hidden" name="begin" value="${p.beginPage }">
						<input type="hidden" name="end" value="${p.endPage }">
						<input type="hidden" name="id" value="${id }">
						<input type="button" value="검색" class="btn btn-dark" onclick="search_go()">
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