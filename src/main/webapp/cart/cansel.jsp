<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림!!!</title>
</head>
<body>
<script>
	alert("결제가 취소되었습니다. 이전화면으로 돌아갑니다.");
	history.go(-2);
</script>
</body>
</html>