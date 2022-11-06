<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세조회</title>
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
 		location.href = "controller?type=admin-order&cPage=${cPage}";
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
<h1 style="text-align: center;">DETAILS</h1>
<div class="container">
  <table class="table" style="width: 700px;">
  <tbody>
      <tr>
        <th>No.</th>
        <td>${vo.oNum }</td>
      </tr>
      <tr>
        <th>ID</th>
        <td>${vo.id }</td>
      </tr>
      <tr>
        <th>PRODUCT</th>
        <td>${vo.productName } (${vo.cCount }ea)</td>
      </tr>
      <tr>
        <th>MODEL</th>
        <td>${vo.model }</td>
      </tr>
      <tr>
        <th>PRICE</th>
        <td>${vo.price}원 
			<span style="color: red;"> 
				<c:if test="${0 ne vo.saleprice}">
					(할인가 : ${vo.saleprice}원)
				</c:if>
			</span>
		</td>
      </tr>
      <tr>
        <th>PAYMENT</th>
        <td>${vo.payment }
        	(${vo.oPayment})
        </td>
      </tr>
      <tr>
        <th>RECEIVER</th>
        <td>${vo.receiver }</td>
      </tr>
      <tr>
        <th>ADDRESS</th>
        <td>${vo.oAddr }</td>
      </tr>
      <tr>
        <th>PHONE</th>
        <td>${vo.oPhone }</td>
      </tr>
      <tr>
        <th>MEMO</th>
        <td>${vo.memo }</td>
      </tr>
      <tr>
        <th>ORDER DATE</th>
        <td>${vo.oDate.substring(0,10) }</td>
      </tr>
  </tbody>
  </table>
  </div>
  <form action="admin-answerAdd.jsp" method="get">
	<div style=" text-align: center;">
		<button type="reset" class="btn btn-dark" style=" display: inline-block; " onclick="list_go()">목록</button>
	</div>
</form>	
</body>
</html>
