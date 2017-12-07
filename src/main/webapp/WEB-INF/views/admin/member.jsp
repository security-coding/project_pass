<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Page(member)</title>

<script src='<c:url value="/js/paging.js"/>'></script>

<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>

<style>
 .table th {
	color : white;
 	background-color: #428BCA;
 	text-align: center;
 }
 .btn-group button, .btn-group a {
 	width: 100%;
 }
</style>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Pass Admin Page</a>
			</div>
		</div>
	</nav>


	<div class="row">
		<div id="navbar" class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="/admin">공연 정보 업데이트</a></li>
				<li><a href="/admin/select/concert">공연 목록<span class="sr-only">(current)</span></a></li>
				<li><a href="/admin/select/place">공연 시설 목록</a></li>
				<li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
			</ul>

			<ul class="nav nav-sidebar">
				<li class="active"><a href="#">사용자 정보 관리</a></li>
				<li><a href="/admin/comment">코멘트 관리</a>
			</ul>
		</div>

		<div id="content" class="container-fluid">
			<!-- page Content 부분 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">사용자 정보 관리</h1>

				<div class="placeholders">
					<div>
						<div class="btn-group" align="center" style="display:flex;">
      		 				<button class="btn btn-info active" value="">전	체</button>
       						<button class="btn btn-primary" value=1>활성 회원</button>
       						<button class="btn btn-danger" value=0>비활성 회원</button>
						</div>
						<div class="pull-right">
							<span>유저 DB 갯수 <span class="badge"></span></span>
						</div>
						<div class="clearfix"></div>
						<div class="placeholder">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>E-Mail</th>
											<th>Addr1</th>
											<th>Addr2</th>
											<th>Certify</th>
											<th>Grade</th>
											<th>Comment</th>
										</tr>
									</thead>
									<tbody id="table-body">
									</tbody>
								</table>
							</div>
							<%@include file="../paging.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
	<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
	
		<script>
		$(function() {
			paging.ajax = ajaxList;
			ajaxList();
			
			$('.btn-group button').on('click',function(){
				$(this).addClass('active').siblings().removeClass('active');
				ajaxList();
			});
		});
			
		var ajaxList = function() {
			var submitData = {};
			submitData.index = paging.p.index;
			submitData.pageStartNum = paging.p.pageStartNum;
			submitData.value = $(".btn-group .active").attr('value');
			submitData.filter = "grade";
			
			    $.ajax({
			        url: '/admin/member',
			        type: 'post',
			        data: submitData,
			        success : function(obj){
			        		$("#table-body").empty();    
			        	
			            var str = '';
			            $.each(obj.list, function(index, member) {
			            		str += "<tr>";
							str += "<td id='id'>"+member.id+"</td>";
							str += "<td>"+member.email+"</td>";
							str += "<td>"+member.address+"</td>";
							str += "<td>"+member.detailAddress+"</td>";
							if(member.certify == 1) {
								str += "<td>이메일 인증</td>";
							} else {
								str += "<td>이메일 미인증</td>";
							}
							if(member.grade == 1) {
								str += "<td><button class='btn-sm btn-primary grade' value=1 onclick='changeGrade(this);'>Active</button></td>";
							} else {
								str += "<td><button class='btn-sm btn-danger grade' value=0 onclick='changeGrade(this);'>Block</button></td>";
							}
							str += "<td><a href='/admin/comment/"+member.id+"' class='btn-sm btn-default'>confirm</a></td>";
							
							str += "</tr>";
						});
			            
			            $("#table-body").append(str);
			            $(".badge").html(obj.p.total);
			            
			            paging.p = obj.p;
			            paging.create();
			        }
			    });   
		};
		
			function changeGrade(obj) {
				var id = $(obj).parents().prevAll("#id").text();
				var grade = 1 - $(obj).val();
				if(confirm("회원 상태를 변경하시겠습니까?") == true) {
	 				$.ajax({
	 					type : "POST",
	 					url : "/admin/member/changeGrade",
	 					data : {
	 						id : id,
	 						grade : grade
	 					},
	 					success : function() {
	 						if(grade == 0){
	 							$(obj).html('Block');
	 							$(obj).removeClass("btn-primary").addClass("btn-danger");
	 							$(obj).attr('value',grade);
	 						}
	 						else{
	 							$(obj).html('Active');
	 							$(obj).removeClass("btn-danger").addClass("btn-primary");
	 							$(obj).attr('value',grade);
	 						}
	 						alert("회원 상태 변경이 완료되었습니다");
	 					},
	 					error : function(e) {
	 						alert(e.responseText);
	 					}
	 				});		
				console.log(id);
			}
		}
	</script>
</body>
</html>