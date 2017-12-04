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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 지도 api -->		

<script>
function setMyimage(imgsrc){
	let myimage=document.getElementById('myimage');
	let nowProfile=document.getElementById('Profile');
	let img = imgsrc.getAttribute('src');
	myimage.setAttribute('src',img);
	nowProfile.setAttribute('src',img);
	$.ajax({
		type:"POST",
		async : true,
		dataType : 'String',
		url:'/member/updateprofile',
		data : {
			srcinput :myimage.getAttribute('src') 
		},
		success:function(data){
			
			console.log(data);
		}
	});
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
//          document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('detailaddress').focus();
        }
    }).open();
}

</script>

</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
 <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
	
	<article class="container-fluid">

	
	<div class="page-header">
		<h1>
			마이페이지
		</h1>
	</div>
	
	<div class="col-sm-3 col-md-2 sidebar">
		<ul class="nav nav-sidebar">
			<li><p>메뉴</p></li>
			<li class="active"><a href="/member/myInf">내정보<span class="sr-only">(current)</span></a></li>
			<li><a href="">비밀번호변경</a></li>
			<li><a href="#">공연 시설 목록</a></li>
			<li><a href="#">주간 박스오피스</a></li>
		</ul>
	</div>

	<div class="col-xs-8 col-sm-6">		
		<form id="loginForm" class="form-horizontal" role="form" action="/member/updateuser" method="post"><!-- form -->
			
			<div class="form-group">
				<label for="id" id="id" name="id">ID:${id}
				<div id="idcheck"></div>
			</div>
			
			<div class="form-group">
				<label for="password">변경할비밀번호</label> <input type="password"
					class="form-control" id="password" name="password" placeholder="변경할비밀번호">
			</div>
			
			<div class="form-group">
				<label>변경한 비밀번호 확인</label> <input type="password"
					class="form-control" id="pass2" placeholder="변경할비밀번호 확인" >
			</div>
			
			<div class="form-group">

				<table>
					<tr>
						<label for="email">Email:
							<td><div>
									<input id="email" name="email" type="text" class="form-control"
										placeholder="Email" style="width: 200px"  value="${email}"></td>
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
							</select>
						</label>
						</td>
					</tr>
				</table>
				
			<tr>
			<label>Address:
			<div>
				<input type="text" id="address" name="address" placeholder="주소" value="${address}"> - <input type="text" id="detailaddress" name="detailaddress" placeholder="상세주소" value="${detailAddress}"> <input type="button" onclick="execDaumPostcode()" value="주소변경">
			</div>
			</label>
			</tr>

			</div>


			<div>
			<img src="${imageUrl}" alt="..." id="Profile" class="img-thumbnail">
			</div>
			<div class="btn-group">
				<button type="button" class="btn btn-default btn-lg dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					<img id="myimage" src="${imageUrl}"> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><img id="img1" class="img"
						src="/resources/images/profile/img1.png"
						onclick="setMyimage(this)">악마</li>
					<li><img id="img2" class="img"
						src="/resources/images/profile/img2.png"
						onclick="setMyimage(this)">판다</li>
					<li><img id="img3" class="img"
						src="/resources/images/profile/img3.png"
						onclick="setMyimage(this)">스파이더맨</li>
				</ul>
			</div>

			<div class="form-group text-center">
				<button id="signupbtn" type="submit" class="btn btn-info" >
					수정하기<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning" onclick="javascript:history.back(-1)">
					수정취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</form>
		
	</div>

	
	</article>
</body>

<!-- /container -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

<script type="text/javascript">
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
		 $("#loginForm").on("submit", function(){
//	 		 event.preventDefault();

			 var pass=$("#password").val(); 
			 var passcheck=$("#pass2").val();
			 

			 if(pass==""){
			 	alert("패스워스를 입력하세요");
			 	$("#password").focus();
			 	return false;
			 }
			 if(pass!=passcheck){
				 alert("패스워드가 일치하지 않습니다")
			 	$("#pass2").focus();
				 return false;
			 }
			 
			 $("#loginForm").submit();
		 })
		 
	 });

</script>

</html>