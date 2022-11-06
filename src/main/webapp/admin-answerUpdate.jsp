<%@page import="com.mystudy.vo.AdminQnaVO"%>
<%@page import="com.mystudy.dao.AdminQnaDAO"%>
<%@page import="com.mystudy.dao.AdminAnswerDAO"%>
<%@page import="com.mystudy.vo.AdminAnswerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int qaNum = Integer.parseInt(request.getParameter("qaNum"));
	AdminAnswerVO avo = AdminAnswerDAO.selectAnswerOne(qaNum);
	request.setAttribute("avo", avo);
	
	int qNum = Integer.parseInt(request.getParameter("qNum"));
	AdminQnaVO qvo = AdminQnaDAO.selectQnAVO(qNum);
	request.setAttribute("qvo", qvo);
	System.out.println("qvo : " + qvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<script>
 	function sendData() {
 	let firstForm = document.forms[0];
	console.log("firstForm.elements.length : " + firstForm.elements.length);
	console.log(firstForm.elements[1].value);
	if (firstForm.elements[1].value.trim() == "") {
		alert("내용을 입력하세요.");
		firstForm.elements[1].value="";
		firstForm.elements[1].focus();
		return;
		}
  		firstForm.submit();
 	}
		
	function list_go() {
 		location.href = "controller?type=admin-qna";
	}
</script>
<style>
	table {
		width: 500px;
		margin: 30px auto 0; 
	}
	th { text-align: center; }
	form button {
    	vertical-align: middle;
	}
</style>
</head>
<body>
<%@ include file="../common/adminmenu.jspf" %>
<br>
<div>
 	<form action="controller" method=get enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<th width="20%">TITLE</th>
				<td>
					<input type="text" name="qaTitle" title="제목" size="46.9px" value="${avo.qaTitle}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th width="20%">ANSWER</th>
				<td>
					<textarea name="qaContents" rows="5" cols="49" title="내용"><%=avo.getQaContents()%></textarea>
				</td>
			</tr>
			<tr>
				<th width="20%">QUESTION</th>
				<td>
					<textarea rows="5" cols="49" disabled>${qvo.qContents}</textarea>
				</td>
			</tr>
			<tr>
				<th width="20%">PRODUCT</th>
				<td>
					<input type="text" size="46.9px" 
						<c:if test="${empty productName}">
							value="선택안함"
						</c:if>
						<c:if test="${not empty productName}">
							value="${qvo.productName}"
						</c:if>
					 disabled="disabled">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="2" height="50px">
					<button type="button" class="btn btn-dark" onclick="sendData()">저장</button>
					<button type="reset" class="btn btn-dark" onclick="list_go()">목록</button>
					<input type="hidden" name="qaNum" value="${avo.qaNum}">
					<input type="hidden" name="qNum" value="${avo.qNum}">
					<input type="hidden" name="type" value="admin-answerUpdate">
				<th>
			</tr>
		</tfoot>
	</table>
	</form>		
</div>
</body>
</html>