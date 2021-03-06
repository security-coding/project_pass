﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 지도 api -->		

<script>
	let idCheck = false;
	let emailCheck = false;
	
	function checkId() {
		$("#joinId").on("blur", function() {
			$.ajax({
				type : "POST",
				async : true,
				dataType : 'json',
				url : "/member/joinIdCheck",
				data : {
					inputId : $("#joinId").val()
				},
				success : function(data) {
					let html;
					if ($("#joinId").val() != "") {
						if (data == "1") {
							html = "<b>사용 가능한 아이디입니다.</b>";
							$("#idCheck").html(html).css("color", "blue");
							console.log("가능한 아이디");
							idCheck=true;
							
						} else {
							html = "<b>중복된 아이디입니다.<b>";
							$("#idCheck").html(html).css("color", "red");
							console.log("중복된 아아디");
							idCheck=false;
							
						}
					} else {
						html = "<b>아이디를 입력해 주세요</b>";
						$("#idCheck").html(html).css("color", "red");
						idCheck=false;
						
					}
				},
				error : function(xhr) {
					alert("error html=" + xhr.statusText);
				}
			});
		});
	}
	
	$(function() {
		$("#email").on("blur", function() {
			$.ajax({
				type : "POST",
				async : true,
				dataType : 'json',
				url : "/member/joinemailCheck",
				data : {
					inputemail : $("#email").val(),
					str_email:$("#str_email").val()
				},
				success : function(data) {
					let html;
					if ($("#email").val() != ""&&$("#str_email").val()!="") {
						if (data == "1") {
							html = "<b>사용 가능한 이메일입니다.</b>";
							$("#emailCheck").html(html).css("color", "blue");
							 emailCheck=true;
							 
						} else {
							html = "<b>중복된 이메일입니다.<b>";
							$("#emailCheck").html(html).css("color", "red");
							 emailCheck=false;
							 
						}
					} else if($("#email").val() != ""||$("#str_email").val()!=""){	
						html = "<b>이메일을입력해주세요</b>";
						$("#emailCheck").html(html).css("color", "red");
						 emailCheck=false;
						 
					}
				}
			});
		});
	});
	
	
	function availability(){
		let html;
		if(idCheck==true&&emailCheck==true){
			alert("메일인증을 보냈습니다\n잠시만기다려주세요");
			html="<img src='/resources/images/'>";
			return true;
		}else if(!idCheck || !emailCheck){
			alert("확인해주세요");
			return false;
		}
	}
/*지도 스크립트 */
	
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detailaddress').focus();
            }
        }).open();
    }

</script>

</head>

		<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    	<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
	
	<article class="container-fluid">
	<div class="page-header">
<%-- 	<%@include file="../loginPage/header.jsp"%> --%>
	</div>
	
	<div class="col-xs-8 col-sm-6">
		<form id="joinForm" name="" class="form-horizontal" role="form" action="/member/insertuser" method="post" onsubmit="return availability()"><!-- form -->
			
			<div class="form-group">
				<label for="joinId">ID:</label> <input type="text"
					class="form-control" id="joinId" name="joinId" placeholder="ID" oninput="checkId()">
				<div id="idCheck"></div>
			</div>
			
			<div class="form-group">
				<label for="joinPass">비밀번호</label> <input type="password"
					class="form-control" id="joinPass" name="joinPass" placeholder="비밀번호">
					<div id="passcheck"></div>
			</div>
			
			<div class="form-group">
				<label>비밀번호 확인</label> <input type="password"
					class="form-control" id="joinPassCheck" placeholder="비밀번호 확인" >
					<div id="passCheck2"></div>
			</div>
			
			<div class="form-group">

				<table>
					<tr>
						<label for="email">Email:
							<td><div>
									<input id="email" name="email" type="text" class="form-control"
										placeholder="Email" style="width: 200px"></td>
							<td>@</td>
							<td><input type="text" name="str_email" id="str_email" class="form-control"
								style="width: 100px" disabled value="naver.com">
								</div></td>
						<td><select style="width: 120px" name="str_email"
								id="selectEmail" class="form-control">
									<option value="1">직접입력</option>
									<option value="naver.com" selected>naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
							</select><td><div id="emailCheck"></div></td>
						</label>
						</td>
					</tr>
				</table>
				
			<tr>
			<label>Address:
			<div>
				<p>
				<input class="form-control" type="text" id="postcode" placeholder="우편번호" onclick="execDaumPostcode()">
				</p>
				<input type="text" id="address" name="address" placeholder="주소"> - <input type="text" id="detailaddress" name="detailaddress" placeholder="상세주소">
			</div>
			</label>
			</tr>
			</div>
			
			
	
			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info">
					회원가입<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">
					가입취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>

	
	</article>
</body>
	
<!-- /container -->
	<!--부트스트랩-->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<!-- 	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> -->


<script>
	//이메일 입력방식 선택
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {

			if ($(this).val() == '1') { //직접입력일 경우
				$("#str_email").val(''); //값 초기화
				$("#str_email").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우
				$("#str_email").val($(this).text()); //선택값 입력
				$("#str_email").attr("disabled", true); //비활성화
			}
		});
	});
	
	 $(function(){
//	 	 폼이벤트 처리할때는 event.preventDefault();가 안먹는 이유...알아내기
		 $("#joinForm").on("submit", function(){
//	 		 event.preventDefault();
			 var id=$("#joinId").val();
			 var pass=$("#joinPass").val(); 
			 var passCheck=$("#joinPassCheck").val();
			 var email=$("#email").val();
			 var str_email=$("#str_email").val();
			 
			 if(id==""){
			 	alert("아이디를 입력하세요");
			 	$("#joinId").focus();
			 	return false;
			 }
			 if(pass==""){
			 	alert("패스워드를 입력하세요");
			 	$("#joinPass").focus();
			 	return false;
			 }
			 if(email==""){
				 alert("이메일을 입력하세요");
				 $("#email").focus();
				 return false;
			 }
			 if(str_email==""){
				 alert("주소를 입력해주세요");
				 $("#str_email").focus();
				 return false;
			 }
			 if(pass!=passCheck){
				 alert("패스워드가 일치하지 않습니다");
			 	$("#joinPassCheck").focus();
				 return false;
			 }
			 $("#joinForm").submit();
		 })
	 });
 	
	 
		$("#joinId").blur(function(){
			let html;
			if($("#joinId").val()==""){
				html="<b>암호를 입력해주세요</b>";
				$("#passCheck").html(html).css("color","red");
			}else{
				html="";
				$("#passCheck").html(html).css("color","white");
			}
		});
		 
	 	$("#joinPassCheck").blur(function(){
	 		let html;
	 		if($("#joinPass").val()!=$("#joinPassCheck").val()){
				html="<b>암호가 일치하지 않습니다.</b>";
				$("#passCheck2").html(html).css("color","red");
	 		}else if($("#joinPass").val()==$("#joinPassCheck").val()&&$("#joinPass").val()!=""&&$("#pass2").val()!=""){
				html="<b>암호가 일치합니다.</b>";
				$("#passCheck2").html(html).css("color","blue");
	 		}
	 	});

		
	</script>
</html>