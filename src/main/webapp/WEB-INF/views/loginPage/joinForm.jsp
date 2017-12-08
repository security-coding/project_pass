<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>joinForm.jsp * 회원 가입</title>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>

    <!-- jQuery 모달 불러들이기 필수요소-->
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>
    <!-- 지도 api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

    
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
							html = "<b>사용 가능한 아이디입니다.</b>"
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
						html = "<b>아이디를 입력해 주세요</b>"
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
							html = "<b>사용 가능한 이메일입니다.</b>"
							$("#emailCheck").html(html).css("color", "blue");
							 emailCheck=true;
							 
						} else {
							html = "<b>중복된 이메일입니다.<b>";
							$("#emailCheck").html(html).css("color", "red");
							 emailCheck=false;
							 
						}
					} else if($("#email").val() != ""||$("#str_email").val()!=""){	
						html = "<b>이메일을입력해주세요</b>"
						$("#emailCheck").html(html).css("color", "red");
						 emailCheck=false;
						 
					}
				}
			});
		});
	});
	
	
	function availability(){
		let html;
		
		 var id=$("#joinId").val();
		 var pass=$("#joinPass").val(); 
		 var passCheck=$("#joinPassCheck").val();
		 var email=$("#email").val();
		 var str_email=$("#str_email").val();
		 var address=$("#address").val();
		 var detailaddress=$("#detailaddress").val();
		 
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
			 alert("이메일주소를 입력해주세요");
			 $("#str_email").focus();
			 return false;
		 }
		 if(pass!=passCheck){
			 alert("패스워드가 일치하지 않습니다")
		 	$("#joinPassCheck").focus();
			 return false;
		 }
		 if(address==""){
			 alert("주소를 입력해주세요");
			 return false;
		 }
		 if(detailaddress==""){
			 alert("상세주소를 입력해주세요");
		 	 $("#detailaddress"),focus();
			 return false;
		 }
		if(idCheck==true&&emailCheck==true){
			alert("메일인증을 보냈습니다\n잠시만기다려주세요");
			return true;
		}else if(!idCheck || !emailCheck){
			alert("확인해주세요");
			return false;
		}
	}
	

$(function() {
	//	 	 폼이벤트 처리할때는 event.preventDefault();가 안먹는 이유...알아내기

	$("#joinPass").blur(
			function() {
				let html;
				if ($("#joinPass").val() == "") {
					html = "<b>암호를 입력해주세요</b>"
					$("#passCheck").html(html).css("color",
							"red");
				} else {
					html = ""
					$("#passCheck").html(html).css("color",
							"white");
				}
			});

	$("#joinPassCheck").blur(
			function() {
				let html;
				if ($("#joinPass").val() != $("#joinPassCheck").val()) {
					html = "<b>암호가 일치하지 않습니다.</b>"
					$("#passCheck2").html(html).css("color", "red");
				} else if ($("#joinPass").val() == $("#joinPassCheck").val()&& $("#joinPass").val() !=""&& $("#joinPassCheck").val() != "") {
					html = "<b>암호가 일치합니다.</b>"
					$("#passCheck2").html(html).css("color", "blue");
				}
			});
	
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
	
});
	

	
	/*지도 스크립트 */

	function execDaumPostcode() {
		//주소-좌표 변환 객체를 생성
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
										+ data.buildingName
										: data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' ('
									+ extraAddr + ')'
									: '');
						}
	
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address').value = fullAddr;
	
						
						
						// 커서를 상세주소 필드로 이동한다.
						document
								.getElementById('detailaddress')
								.focus();
					
				           geocoder.addressSearch(data.address, function(results, status) {
			                    // 정상적으로 검색이 완료됐으면
			                    if (status === daum.maps.services.Status.OK) {
									$(".label").css("display","none");
			                        var result = results[0]; //첫번째 결과의 값을 활용
			                        document.getElementById('la').value = result.y; //위도
									document.getElementById('lo').value = result.x; //경도  
			                       
			                
			                    }
			                });	
						
						
					}
				}).open();
	}
				</script>
    
            <!-- CSS -->
<!--         <link rel="stylesheet" href="assets/typicons/typicons.min.css"> -->
<!--         <link rel="stylesheet" href="assets/css/animate.css"> -->
<!--         <link rel="stylesheet" href="assets/css/style.css"> -->
<!--         <link rel="stylesheet" href="assets/css/media-queries.css"> -->
    
    
    </head>
    
<!--     바디시작 -->
    <body>
    
<!--     로그인 모달 헤더 불러오기 -->
    <%@include file="../header.jsp"%>

    	<div class="loader">
    		<div class="loader-img"></div>
    	</div>
				
        <!-- Top content -->
        <div class="top-content">
        	
        	<!-- Top menu -->

        	<div class="inner-bg">
                <div class="container">
                
                    <div class="row text-center" style="margin-top: 100px">
                        <div class="col-sm-8 col-sm-offset-2 text wow fadeInLeft">
                            <h1><strong>회원가입</strong></h1>
                            <div class="description">
                            	<p>회원 가입을 통해 즐겨보세요!</p>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row">
						<div class="col-sm-6 col-sm-offset-3 subscribe wow fadeInUp">
						
							<form id="joinForm" name="" class="" role="form" action="/member/insertuser" method="post" onsubmit="return availability()"><!-- form -->		
<!-- 							아이디 입력창 -->
								<div class="form-group">
									<label class="sr-only" for="joinId">ID</label>
									<input type="text" name="joinId" placeholder="아이디" class="form-control" id="joinId" oninput="checkId()">

<!-- 							아이디 성공, 실패여부 체크 -->
								<div id="idCheck"></div>
								
								</div>
								
<!-- 								비밀번호 입력창 (첫번째) -->
								<div class="form-group">
									<label class="sr-only" for="joinPass">Password</label>
									<input type="password" name="joinPass" placeholder="비밀번호" class="form-control" id="joinPass">
								</div>

<!--								비밀번호 첫번째 성공 실패 체크 -->
								<div id="passCheck"></div>								
								
<!-- 								비밀번호 입력창 (두번째) 확인 -->
								<div class="form-group">
									<label class="sr-only" for="joinPassCheck">checkPassword</label>
									<input type="password" name="joinPassCheck" placeholder="비밀번호확인" class="form-control" id="joinPassCheck">
								</div>
								
								<div id="passCheck2"></div>
								
<!-- 								이메일 부분 1행 4열 (골뱅이 포함) -->

								<!-- 1행 1열 - 이메일아이디 부분 -->
								<table>
								<tr>
								<td>
								<div class="form-group">
									<label class="sr-only" for="email">email</label>
									<input type="text" name="email" placeholder="이메일아이디" class="form-control" id="email" style="width:200px">
								</div>
								</td>
								
								
<!-- 								1행 2열 - 1,3열 사이 골뱅이 부분 -->
								<td>
								<p>@</p>
								</td>

								<!-- 1행 3열 이메일 도메인주소 부분								 -->
								<td>
								<div class="form-group">
									<label class="sr-only" for="str_email">email_2nd</label>
									<input type="text" name="str_email" placeholder="도메인주소" class="form-control" id="str_email" style="width: 220px" disabled value="naver.com">
								</div>
								</td>
								
								<!-- 1행 4열 이메일 선택 박스부분			 -->
								<td>
								<div class="form-group">
									<label class="sr-only" for="str_email">selectEmail</label>
									<select style="width: 120px" id="selectEmail" name="str_email" class="form-control">
									<option value="1">직접입력</option>
									<option value="naver.com" selected>naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									</select>
									</div>
								</td>
								</tr>
								<tr>
								<td><div id="emailCheck"></div></td>
								</tr>
								</table>

				<!-- 이메일 체크 끝난 뒤 주소로 넘어가는 부분 -->

								<table>
								<tr>
								<td colspan="2">
								<div class="form-group">
									<label class="sr-only" for="subscribe-location">ZipCode</label>
									<input type="text" name="ZipCode" placeholder="우편 주소" class="form-control" id="postcode" onclick="execDaumPostcode()">
								</div>
								</td>
								</tr>
								
								<tr>
								<td>
								<div class="form-group">
									<label class="sr-only" for="address">address</label>
									<input type="text" name="address" placeholder="주소" class="form-control" id="address" readonly="readonly">
								</div>
								</td>
								
								<td>
								<p> ━ </p>
								</td>
								
								<td>
								<div class="form-group">
									<label class="sr-only" for="detailaddress">detailaddress</label>
									<input type="text" name="detailaddress" placeholder="상세주소" class="form-control" id="detailaddress">
								</td>
								</div>
								</table>
								<input type="hidden" name="la" id="la">
								<input type="hidden" name="lo" id="lo">
								
						<!--폼 다끝나고 회원가입 버튼 및 가입 취소 구간 -->
								
								<div class="form-group text-center">
								<button id="signupbtn" type="submit" class="btn btn-info">회원 가입 </button>
								<button id="reset" type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">가입 취소</button>
								</div>
							</form>
						</div>
					</div>  
                </div>
            </div>        
    </body>
    
           <!-- Javascript -->
<!--         <script src="assets/js/jquery.backstretch.min.js"></script> -->
<!--         <script src="assets/js/wow.min.js"></script> -->
<!--         <script src="assets/js/retina-1.1.0.min.js"></script> -->
<!--         <script src="assets/js/scripts.js"></script> -->
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
    
    </html>