<%@page import="com.mystudy.vo.AdminAnswerVO"%>
<%@page import="com.mystudy.dao.AdminAnswerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int qaNum = Integer.parseInt(request.getParameter("qaNum"));
	AdminAnswerVO vo = AdminAnswerDAO.selectAnswerOne(qaNum);
	request.setAttribute("vo", vo);
	String adId = (String) session.getAttribute("loginUserId");
%>
<html>
<head>
<meta charset="UTF-8">
<title>답변삭제</title>
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	div { text-align: center; }
	table { display:inline-block;}
	div p a:hover {
	 color: red;
	 text-decoration: none;
	}
</style>
</head>
<body>
	<%@ include file="../common/adminmenu.jspf" %>
<div>
	<form action="controller?type=admin-answerDelete" method="post">
	<p><a href="admin-productUpdate.jsp?qaNum=${vo.qaNum}" style="color: black;">이전 페이지로 돌아가려면 여기를 클릭하세요.</a></p>
		<table>
			<tr>
				<td>
					<input type="password" name="ad_pwd" placeholder="INSERT ADMIN PASSWORD" size="22">
					<input type="submit" value="삭제">
					<input type="hidden" name="qaNum" value= "${vo.qaNum}">
					<input type="hidden" name="adId" value= "<%=adId%>">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>