<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
$(document).ready(function(){
	let passFail=${passFail};
	if(passFail == 0) {
		alert("비밀번호가 틀렸습니다. 다시확인해주세요");
	}
	document.location.href="./main";
});

</script>
<script>
$(function(){
	let Notmember=${Notmember};
	if(Notmember == 0) {
		alert("존재하지않는 아이디 입니다.\n회원가입을해주세요");
	}
	document.location.href="./main";
});
</script>
</head>
<body>

</body>
</html>