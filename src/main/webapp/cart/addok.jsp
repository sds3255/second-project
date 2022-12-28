<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<input type="hidden"  id="id" name="id" value="${id }">

<script>
	if(confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")==true){
		var id =  document.getElementById('id').value;
		location.href ="ccontroller?func=cart&funcc=cartin&id="+id;
	} else{
		history.go(-1);
	}
	</script>
</body>
</html>