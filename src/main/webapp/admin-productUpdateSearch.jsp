<%@page import="com.mystudy.vo.AdminProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.dao.AdminProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
 request.setCharacterEncoding("UTF-8");
  	int productNum = Integer.parseInt(request.getParameter("productNum"));
  	String cPage = request.getParameter("cPage");
  	String keyword = request.getParameter("keyword");
  	String select = request.getParameter("select");
  	
  	AdminProductVO vo = AdminProductDAO.selectProduct(productNum);
  	request.setAttribute("vo", vo);
  	request.setAttribute("cPage", cPage);
  	request.setAttribute("keyword", keyword);
  	request.setAttribute("select", select);
  	System.out.println("update vo : " + vo);
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품업데이트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length-4; i++) {
			console.log(firstForm.elements.length);
			console.log(firstForm.elements[i] + " : " + firstForm.elements[i].value);
			console.log("firstForm.elements[3].value : " + firstForm.elements[3].value )
			console.log("firstForm.elements[4].value : " + firstForm.elements[4].value )
			if (firstForm.elements[i].value.trim() == "") {
				if(i == 5) continue;
				alert(firstForm.elements[i].title + "을(를) 추가하세요.");
				firstForm.elements[i].value="";
				firstForm.elements[i].focus();
				return;
			}
		}
		if (firstForm.elements[3].value <= firstForm.elements[4].value) {
			alert("[입력오류]할인가는 정가보다 작아야합니다.");
			return;
		}
		firstForm.submit();
	}
	
	function list_go() {
 		location.href = "controller?type=admin-productList&cPage=${cPage}&keyword=${keyword}&select=${select}";
	}
</script>
<style>
	table {
		width: 500px;
		margin: 30px auto 0;
	}
</style>
</head>
<body>
<%@ include file="../common/adminmenu.jspf" %>
<div>
	<form action="controller?type=admin-productUpdate" method="post" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" title="카테고리">
						<c:if test="${'PC001' eq vo.category}">
							<option title="PC001" selected>PC001</option>
							<option title="AC002">AC002</option>
						</c:if>
						<c:if test="${'AC002' eq vo.category}">
							<option title="PC001">PC001</option>
							<option title="AC002"selected >AC002</option>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>모델</th>
				<td>
					<select name="model" title="모델">
						<c:if test="${'IPHONE' eq vo.model}">
							<option title="IPHONE" selected>IPHONE </option>
							<option title="AIRPODS">AIRPODS</option>
						</c:if>
						<c:if test="${'AIRPODS' eq vo.model}">
							<option title="IPHONE">IPHONE </option>
							<option title="AIRPODS" selected>AIRPODS</option>
						</c:if>
						
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" value="${vo.productName}" name="productName" title="상품명">
					
				</td>
			</tr>
			<tr>
				<th>정가</th>
				<td>
					<input type="number" value="${vo.price}"name="price" title="정가">
				</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td>
					<input type="number" value="${vo.saleprice}" name="saleprice" title="세일가">
				</td>
			</tr>
			<tr>
				<th>이미지파일</th>
				<td>
					<input type="file" name="image" title="이미지파일">
				</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td>
					<textarea name="content" rows="2" cols="50" title="상세설명">${vo.content}</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-dark" onclick="sendData()">수정</button>
 					<button type="button" class="btn btn-dark" onclick="location.href='admin-productDelete.jsp?productNum=${vo.productNum}'">삭제</button>
 					<button type="reset" class="btn btn-dark"  onclick="list_go()">목록</button> 
					<input type="hidden" name="productNum" value="${vo.productNum}">
				</td>
			</tr>
		</tfoot>
	</table>	
	</form>
</div>
</body>
</html>