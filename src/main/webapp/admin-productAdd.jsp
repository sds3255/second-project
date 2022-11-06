<%@page import="com.mystudy.vo.AdminProductVO"%>
<%@page import="com.mystudy.dao.AdminProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="css/adminmenu.css" rel="stylesheet" type="text/css">
<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < 7; i++) {
			//console.log(firstForm.elements.length);
			console.log(firstForm.elements[3].value);
			console.log(firstForm.elements[4].value);
			console.log(firstForm.elements[i] + " : " + firstForm.elements[i].value);
			if (firstForm.elements[i].value.trim() == "") {
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
 		location.href = "controller?type=admin-product";
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
	<form action="controller?type=admin-productAdd" method="post" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" title="카테고리">
						<option value="" selected disabled hidden>선택</option>
						<option title="PC001">PC001</option>
						<option title="AC002">AC002</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>모델</th>
				<td>
					<select name="model" title="모델">
						<option value="" selected disabled hidden>선택</option>
						<option title="IPHONE">IPHONE </option>
						<option title="AIRPODS">AIRPODS</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" name="productName" title="상품명">
					
				</td>
			</tr>
			<tr>
				<th>정가</th>
				<td>
					<input type="number" name="price" title="정가">
				</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td>
					<input type="number" value="0" name="saleprice" title="세일가">
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
					<textarea name="content" rows="2" cols="50" title="상세설명"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-dark" onclick="sendData()">등록</button>
					<button type="button" class="btn btn-dark" onclick="list_go()">목록</button>
					<button type="reset" class="btn btn-dark">초기화</button>
				</td>
			</tr>
		</tfoot>
	</table>	
	</form>
</div>
</body>
</html>