<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제요청</title>
</head>
<body>
<c:if test="${b eq true}">
<script>
	alert("[완료] 상품목록 페이지로 이동합니다.");
	location.href="controller?type=admin-product";
</script>
</c:if>
<c:if test="${b eq false}">
<script>
	alert("[실패] 패스워드를 확인하세요.");
	history.back();
</script>
</c:if>
</body>
</html>