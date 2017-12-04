<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	let certKey=${certKey};
	let html;
	if(certKey == "1") {
		alert("이미 가입");
		
	} else if(certKey == "2") {
		alert("가입 완료");
		
	} else if(certKey == "3") {
		alert("한적 없음");
	}
	document.location.href="../play";
});

</script>
<body>
</body>
</html>