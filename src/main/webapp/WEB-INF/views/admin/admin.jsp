<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</head>
<body>
	<div>
		<form name="concertUpdateForm" id="concertUpdateForm">
			<label for="stdate"> 
				시작 날짜 : <input type="date" name="stdate" id="stdate">
			</label> 
			<label for="eddate"> 
				종료 날짜 : <input type="date"	name="eddate" id="eddate">
			</label>
			<select name="prfstate">
				<option value="01">공연 예정</option>
				<option value="02">공연 중</option>
				<option value="03">공연 완료</option>
			</select> <input type="button" id="concert_update_submit"
				name="concert_update_submit" value="공연 정보 업데이트">
		</form>
	</div>

	<button onclick="setDB('/admin/update/place');">공연 시설 정보 가져오기</button>
	<button onclick="setDB('/admin/update/boxoffice');">박스오피스 정보
		가져오기</button>
</body>

<script>
	//AJAX 통신 시작
	$( document ).ajaxStart(function() {
	    //마우스 커서를 로딩 중 커서로 변경
	    $('html').css("cursor", "wait"); 
	});
	//AJAX 통신 종료
	$( document ).ajaxStop(function() {
	    //마우스 커서를 원래대로 돌린다
	    $('html').css("cursor", "auto"); 
	});

	$(document).ready(function() {
		$("#concert_update_submit").click(function() {
			var formData = $("#concertUpdateForm").serialize();
			$.ajax({
				type : "POST",
				data : formData,
				url : "/admin/update/concert",
				cache : false,
				success : function() {
					alert("공연 정보가 정상적으로 업데이트 되었습니다");
				},
				error : function() {
					alert: ("error 발생");
				}
			})
		})
	})

	function setDB(url) {
		$.ajax({
			type : "POST",
			url : url,
			success : function() {
				alert("데이터베이스가 정상적으로 업데이트 되었습니다");
			},
			beforeSend : function() {
				alert("시작전");
			},
			complete : function() {
				alert("완료후");
			},
			error : function(e) {
				alert(e.responseText);
			}
		})
	}
</script>
</html>