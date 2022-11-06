<%@page import="com.mystudy.dao.AdminAnswerDAO"%>
<%@page import="com.mystudy.vo.AdminAnswerVO"%>
<%@page import="com.mystudy.vo.AdminQnaVO"%>
<%@page import="com.mystudy.dao.AdminQnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>답변조회</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link href="css/adminmenu.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script></head>
<script>
	function list_go() {
 		location.href = "controller?type=admin-qna&cPage=${cPage}";
	}
</script>
<style>
	tr { text-align: center; }
	td { text-align: left; }
	table {
	margin: 60px auto 0; 
	}
</style>
<body>
<%@ include file="../common/adminmenu.jspf" %>
<hr>
<br>
<br>
<h1 style="text-align: center;">Q&A</h1>
<div class="container">
  <table class="table" style="width: 700px;">
  <tbody>
	      <tr>
	        <th width = 30%>TITLE</th>
	        <td>${vo.qaTitle }</td>
	      </tr>
	      <tr>
	        <th width = 30%>ID</th>
	        <td>관리자</td>
	      </tr>
	      <tr>
	        <th width = 30%>DATE</th>
	        <td>${vo.qaDate.substring(0,10) }</td>
	      </tr>
	      <tr>
	        <th width = 30%>QUSETION</th>
	        <td>${vo2.qContents }</td>
	      </tr>
    	  <tr>
	        <th width = 30%>PRODUCT</th>
	        <td>
	        	<c:if test="${empty vo.productName}">
	        		선택안함
	        	</c:if>
	        	<c:if test="${not empty vo.productName}">
	        		 ${vo.productName }
	        	</c:if>
     	   </td>
	      </tr>
	      <tr>
	        <th width = 30%>ANSWER</th>
	        <td>${vo.qaContents }</td>
	      </tr>

  </tbody>
  </table>
</div>
	<div style=" text-align: center;">
		<button type="submit" class="btn btn-dark" style=" display: inline-block;" onclick="location.href='admin-answerUpdate.jsp?qaNum=${vo.qaNum}&qNum=${vo.qNum}'">수정</button>
		<button type="submit" class="btn btn-dark" style=" display: inline-block;" onclick="location.href='admin-answerDelete.jsp?qaNum=${vo.qaNum}'">삭제</button>
		<button type="reset" class="btn btn-dark" style=" display: inline-block;" onclick="list_go()">목록</button>
 	</div> 
</body>
</html>
