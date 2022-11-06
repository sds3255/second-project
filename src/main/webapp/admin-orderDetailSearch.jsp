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
 		location.href = "controller?type=admin-orderList&cPage=${cPage}&select=${select}&keyword=${keyword}";
	}
</script>
<style>
	tr { text-align: center; }
	td { text-align: left; }
	table {
	margin: 60px auto 0; 
	}
	a {
		color:black;
		text-decoration: none; 
	}
	a:hover {
		color: silver;
		text-decoration: none; 
	}
</style>
</style>
<body>
<%@ include file="/common/adminmenu.jspf" %>
<hr>
<br>
<br>
<h1 style="text-align: center;">DETAILS</h1>
<div class="container">
  <table class="table" style="width: 700px;">
  <tbody>
   <tr>
        <th>No.</th>
        <td>${oNum }</td>
      </tr>
      <tr>
        <th>ID</th>
        <td>${id }</td>
      </tr>
	  <tr>
      	<th>PRODUCT</th>
      	<td>
	      <c:forEach var="vo" items="${list }">
		       <a href="ccontroller?func=content&productNum=${vo.productNum} "> ${vo.productName}-${vo.model} (${vo.cCount}개)</a><br>
	      </c:forEach>
	      </td>
	     </tr>
      <tr>
        <th>PRICE</th>
        <td>${totalPrice}원 
		</td>
      </tr>
      <tr>
        <th>PAYMENT</th>
        <td>${payment }
        	(${oPayment})
        </td>
      </tr>
      <tr>
        <th>RECEIVER</th>
        <td>${receiver }</td>
      </tr>
      <tr>
        <th>ADDRESS</th>
        <td>${oAddr }</td>
      </tr>
      <tr>
        <th>PHONE</th>
        <td>${oPhone }</td>
      </tr>
      <tr>
        <th>MEMO</th>
        <td>${memo }</td>
      </tr>
      <tr>
        <th>ORDER DATE</th>
        <td>${oDate.substring(0,10) }</td>
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
