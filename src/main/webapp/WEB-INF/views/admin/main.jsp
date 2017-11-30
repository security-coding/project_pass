<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지(메인)</title>
	
	<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
	<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
	<script src='<c:url value="/js/bootstrap-datepicker.js"/>'></script>
	<script src='<c:url value="/js/bootstrap-datepicker.kr.js"/>' charset="UTF-8"></script>
	    
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/datepicker3.css"/>'>

    <style type="text/css">

        .wrap-loading { /*화면 전체를 어둡게 합니다.*/
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.2); /*not in ie */
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000'); /* ie */
        }

        .wrap-loading div { /*로딩 이미지*/
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -21px;
            margin-top: -21px;
        }

        .display-none { /*감추기*/
            display: none;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Pass Admin Page</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><p>공연 관련 정보 관리</p></li>
                <li class="active"><a href="#">정보 업데이트<span class="sr-only">(current)</span></a></li>
                <li><a href="/admin/select/concert">공연 목록</a></li>
                <li><a href="#">공연 시설 목록</a></li>
                <li><a href="#">주간 박스오피스</a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li><p>사용자 정보 관리</p></li>
                <li><a href="">Nav item</a></li>
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
                <li><a href="">More navigation</a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li><p>코멘트 & 기타 관리</p></li>
                <li><a href="">Nav item again</a></li>
                <li><a href="">One more nav</a></li>
                <li><a href="">Another nav item</a></li>
            </ul>
        </div>

        <!-- page Content 부분 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">정보 업데이트</h1>

            <div class="row placeholders">
                <div class="col-xs-6 col-sm-4 placeholder">
                    <img src="images/audience-868074_640.jpg" width="200" height="200" class="img-circle"
                         alt="Generic placeholder thumbnail">
                    <h4>공연 정보 업데이트</h4>
                    <span class="text-muted">Something else</span>
                    <div>
                        <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-music"></span>
                            업데이트
                        </button>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-4 placeholder">
                    <img src="images/walt-disney-center-1629173_1280.jpg" width="200" height="200" class="img-circle"
                         alt="Generic placeholder thumbnail">
                    <h4>공연 시설 정보 업데이트</h4>
                    <span class="text-muted">Something else</span>
                    <div>
                        <button class="btn btn-sm btn-primary" onclick="updateInf('/admin/update/place');">
                        
                            업데이트
                        </button>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4 placeholder">
                    <img src="images/service-1186371_640.png" width="200" height="200" class="img-circle"
                         alt="Generic placeholder thumbnail">
                    <h4>주간 박스오피스 정보 업데이트</h4>
                    <span class="text-muted">매일 오전 1시에 자동 업데이트 됩니다</span>
                    <div>
                        <button class="btn btn-sm btn-primary" onclick="updateInf('/admin/update/boxoffice');">
                            업데이트
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">공연 정보 업데이트</h4>
            </div>
            <div class="modal-body container-fluid">
                <form class="form-group" name="concertUpdateForm" id="concertUpdateForm">
                    <div>
                        <div class="pull-left  col-md-5 col-sm-5 col-xs-5">
                            <span>공연 시작 날짜</span>
                            <div class="input-group date">
                                <input type="text" class="form-control" name="stdate">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                        <span class="col-md-2 col-sm-2 col-xs-2 text-center"> - </span>
                        <div>
                            <div class="pull-right col-md-5 col-sm-5 col-xs-5">
                                <span>공연 종료 날짜</span>
                                <div class="input-group date">
                                    <input type="text" class="form-control" name="eddate">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                        <h5>공연 상태</h5>
                        <select class="form-control-static" name="prfstate">
                            <option value="01">공연 예정</option>
                            <option value="02">공연 중</option>
                            <option value="03">공연 완료</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <button type="button" class="btn btn-primary" id="concert_update_submit">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap-loading display-none">
    <div><img src="images/ajax_loader6.gif"></div>
</div>
</div>
<script>
    $(document).ajaxStart(function () {
        $('.wrap-loading').removeClass('display-none');
    });

    $(document).ajaxStop(function () {
        $('.wrap-loading').addClass('display-none');
    });

    $(function () {
        $('#concert_update_submit').click(function () {
            var formData = $("#concertUpdateForm").serialize();
            $.ajax({
                type: "POST",
                data: formData,
                url: "/admin/update/concert",
                cache: false,
                success: function () {
                    alert("공연 정보가 정상적으로 업데이트 되었습니다");
                },
                error: function () {
                    alert: ("error 발생");
                }
            })
        });

        $('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
    });

    function updateInf(url) {
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
	
</body>
</html>