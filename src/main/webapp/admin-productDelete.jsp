<%@page import="com.mystudy.dao.AdminProductDAO"%>
<%@page import="com.mystudy.vo.AdminProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
  int productNum = Integer.parseInt(request.getParameter("productNum"));
    	AdminProductVO vo = AdminProductDAO.selectProduct(productNum);
    	request.setAttribute("vo", vo);
    	String loginUserId = (String) session.getAttribute("loginUserId");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품삭제</title>
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
	<form action="controller?type=admin-productDelete" method="post">
	<p><a href="admin-productUpdate.jsp?productNum=${vo.productNum}" style="color: black;">이전 페이지로 돌아가려면 여기를 클릭하세요.</a></p>
		<table>
			<tr>
				<td>
					<input type="password" name="ad_pwd" placeholder="INSERT ADMIN PASSWORD" size="22">
					<input type="submit" value="삭제">
					<input type="hidden" name="productNum" value= "${vo.productNum}">
					<input type="hidden" name="adId" value= "<%=loginUserId%>">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>