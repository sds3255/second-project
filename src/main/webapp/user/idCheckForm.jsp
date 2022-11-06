<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script>
	function pValue() {
		document.getElementById("id").value = opener.document.userInfo.id.value;
	}
	
	function idCheck() {
		let id = document.getElementById("id").value;
		
		if (!id) {
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		else {
			
		}
	}

</script>
</head>
<body id="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="idinput" id="userId">
			<input type="button" value="중복확인" onclick="idCheck()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()"><br>		
	</div>		
</div>
</body>
</html>