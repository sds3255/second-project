<%@page import="com.mystudy.vo.AdminQnaVO"%>
<%@page import="com.mystudy.dao.AdminQnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Q&A상세보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link href="css/adminmenu.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script></head>
<script>
	function sendData() {
		location.href = "controller?type=admin-answerAdd";
	}

	function list_go() {
		location.href = "controller?type=admin-answerExpected&cPage=${cPage}";
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
        <th width = 30%>No.</th>
        <td>${vo.qNum }</td>
      </tr>
      <tr>
        <th width = 30%>TITLE</th>
        <td>${vo.qTitle }</td>
      </tr>
      <tr>
        <th width = 30%>ID</th>
        <td>${vo.id }</td>
      </tr>
      <tr>
        <th width = 30%>DATE</th>
        <td>${vo.qDate.substring(0,10) }</td>
      </tr>
      <tr>
        <th width = 30%>CONTENTS</th>
        <td>${vo.qContents }</td>
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
  </tbody>
  </table>
  </div>
  <form action="admin-answerAdd.jsp" method="get">
	<div style=" text-align: center;">
		<button type="submit" class="btn btn-dark" style=" display: inline-block;" onclick="sendDate()">답변</button>
		<button type="reset" class="btn btn-dark" style=" display: inline-block; " onclick="list_go()">목록</button>
		<input type="hidden" name="qNum" value="${vo.qNum}">
	</div>
</form>	
</body>
</html>
