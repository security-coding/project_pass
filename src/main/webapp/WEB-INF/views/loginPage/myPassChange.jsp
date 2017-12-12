<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

		
<!-- <script src="//code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<!-- 지도api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

<style>
ul{
   list-style:none;
   }
.sidebar{
    color: rgba(95, 219, 234, 0.5);
    border-color:rgba(255,255,255,0.4);
    border: 1px dotted rgba(129, 161, 199,0.5) ;
    border-radius: 10px;
	margin-right: 15px;
	-moz-box-shadow: -2px 7px 22px #696485;
	-webkit-box-shadow: -2px 7px 22px #696485;
	box-shadow: -2px 7px 22px #696485;
}
</style>

<script>
	let addressCheck = false;
	let passCheck = false;

	$(function() {
		$("#currentPw").on("blur", function() {
			$.ajax({
				type : "POST",
				async : true,
				dataType : 'json',
				url : "/member/currentPwCheck",
				data : {
					currentPw : $("#currentPw").val()
				},
				success : function(data) {
					let html;
					console.log(data);
					if ($("#currentPw").val() != "") {
						if (data === 1) {
							passCheck = true;
							
						} else if(data==0) {
							html = "<b>현재 비밀번호 틀림<b>";
							console.log('현재 비밀번호 틀림');
							passCheck = false;
							
						}
					} else {
						html = "<b>현재비밀번호를 입력해 주세요</b>"
						passCheck = false;
						console.log("비밀번호 입력");
					}
				},
				error : function(xhr) {
					// 				alert("error html=" + xhr.statusText);
				}
			});
		});
	});
	
	if ($('#address').val() != ""&& $('#detailAddress').val() != "") {
	addressCheck = true;
} else {
	addressCheck = false;
}
	
	function submitCheck() {
		if (passCheck == true||addressCheck==true) {
			if(passCheck==true){
				var pass=$("#changePass").val(); 
				var passcheck=$("#changPassCheck").val();
				
				 if(pass==""){
					 	alert("패스워스를 입력하세요");
					 	$("#changePass").focus();
					 	return false;
					 }
				if(pass!=passcheck){
						 alert("패스워드가 일치하지 않습니다")
					 	$("#changPassCheck").focus();
						 return false;
					}
				return true;	
			}
			if(addressCheck==true){
				var address=$("#address").val();
				var detailaddress=$("#detailAddress").val();
				
				if(address==null){
					alert("주소를 입력해주세요");
					return false;
				}
				if(detailaddress==null){
					alert("상세주소를 써주세요");
					return false;
				}
				return true;
			}
		}else{
			alert("확인해주세요");
			return false;
		}
	}
	
	function execDaumPostcode() {
		var geocoder = new daum.maps.services.Geocoder();

		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						//          document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('detailAddress').focus();

						geocoder.addressSearch(data.address, function(results,
								status) {
							// 정상적으로 검색이 완료됐으면
							if (status === daum.maps.services.Status.OK) {
								$(".label").css("display", "none");
								var result = results[0]; //첫번째 결과의 값을 활용
								document.getElementById('la').value = result.y; //위도
								document.getElementById('lo').value = result.x; //경도  
							}
						});
					}
				}).open();
	}

	function memberClear() {
		if (confirm("회원 탈퇴하시겠습니까?") == true) {

		} else {
			return false;
		}
	}
</script>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
 <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
	
	<article class="container-fluid">

	
	<div class="page-header">
	<div>
	<%@include file="../header.jsp"%>
	</div>
	</div>
	
	<div class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar">
			<li><p>메뉴</p></li>
			<li class="active"><a href="/member/mypage">내정보<span class="sr-only">(current)</span></a></li>
			<li><a href="/member/myPassChange">회원정보 변경</a></li>
			<li><a href="/member/memberClearForm">회원탈퇴</a></li>
		</ul>
	</div>

	<div class="col-xs-8 col-sm-6">		
		<form id="loginForm" class="form-horizontal" role="form" action="/member/updateuser" method="post" onsubmit="return submitCheck()"><!-- form -->
			
			<div class="form-group">
				<label for="id" id="id" name="id" >ID:${userInf.id}</label>
			</div>
			
			<div class="form-group">
				<label for="currentPw">현재비밀번호</label> <input type="password"
					class="form-control" id="currentPw" name="currentPw" placeholder="현재비밀번호">
			</div>
			
			<div class="form-group">
				<label for="changePass">변경할비밀번호</label> <input type="password"
					class="form-control" id="changePass" name="changePass" placeholder="변경할비밀번호">
			</div>
			
			<div class="form-group">
				<label for="changPassCheck">변경한 비밀번호 확인</label> <input type="password"
					class="form-control" id="changPassCheck" placeholder="변경할비밀번호 확인" >
			</div>
			
			<div class="form-group">
			<label>Address:
			<div>
				<input type="text" id="address" name="address" placeholder="주소" value="${userInf.address}" > - <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${userInf.detailAddress}"> <input type="button" onclick="execDaumPostcode()" value="주소변경">
			</div>
			</label>
			</div>
			
			<input type="hidden" name="la" id="la" value='${userInf.la}'>
			<input type="hidden" name="lo" id="lo" value='${userInf.lo}'>
			
			<div class="form-group text-center">
				<button id="passUpbtn" type="submit" class="btn btn-info" >
					회원정보변경<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">
					되돌아기<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
		
	</div>	
</article>
<%@include file="../footer.jsp" %>
</body>

<!-- /container -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>




</html>