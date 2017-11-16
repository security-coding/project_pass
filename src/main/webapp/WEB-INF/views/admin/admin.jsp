<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin page</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<button onclick="setDB('/pass/admin/update/concert');">공연 정보 가져오기</button>
	<button onclick="setDB('/pass/admin/update/place');">공연 시설 정보 가져오기</button>
	<button onclick="setDB('/pass/admin/update/boxoffice');">박스오피스 정보 가져오기</button>
</body>

<script>
	function setDB(url) {
		$.ajax({
			type:"POST",
			url:url,
			success: function() {
				alert("데이터베이스가 정상적으로 업데이트 되었습니다");
			},
			beforeSend : function(){
				alert("시작전");
			},
			complete: function(){
				alert("완료후");
			},
			error: function(e) {
				alert(e.responseText);
			}
		})	
	}
</script>
</html>