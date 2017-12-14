<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/dashboard.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/datepicker3.css"/>'>
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
            <li class="active"><a href="#">공연 목록<span class="sr-only">(current)</span></a></li>
            <li><a href="/admin/select/place">공연 시설 목록</a></li>
            <li><a href="/admin/select/boxoffice">주간 박스오피스</a></li>
        </ul>

        <ul class="nav nav-sidebar">
            <li><a href="/admin/member">사용자 정보 관리</a></li>
            <li><a href="/admin/comment">코멘트 관리</a>
        </ul>
    </div>

    <div id="content" class="container-fluid">
        <!-- page Content 부분 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">공연 정보 등록</h1>

            <div class="placeholders">
                <div class="placeholder">
                    <div class="table-responsive">
                        <form class="form-group" id="frm" name="frm" action="/admin/applyConcert" method="post" enctype="multipart/form-data">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="25%">
                                <col width="*">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">공연명</th>
                                <td><input type="text" class="form-control" id="prfnm" name="prfnm" required></td>
                            </tr>
                            <tr>
                                <th>공연 시작 날짜</th>
                                <td>
                                <div class="input-group date">
                                    <input type="text" class="form-control" id="prfpdfrom" name="prfpdfrom" required>
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <th>공연 종료 날짜</th>
                                <td>
                                <div class="input-group date">
                                    <input type="text" class="form-control" id="prfpdto" name="prfpdto" required>
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <th>공연 시설명</th>
                                <td><input type="text" class="form-control" id="fcltynm" name="fcltynm" onclick="openPlace(); required"></td>
                            </tr>
                            <tr>
                                <th>공연 출연진</th>
                                <td><input type="text" class="form-control" id="prfcast" name="prfcast" required></td>
                            </tr>
                            <tr>
                                <th>공연 제작진</th>
                                <td><input type="text" class="form-control" id="prfcrew" name="prfcrew" required></td>
                            </tr>
                            <tr>
                                <th>공연출연진</th>
                                <td><input type="text" class="form-control" id="prfruntime" name="prfruntime" required></td>
                            </tr>
                            <tr>
                                <th>공연 관람 연령</th>
                                <td><input type="text" class="form-control" id="prfage" name="prfage" required></td>
                            </tr>
                            <tr>
                                <th>제작사</th>
                                <td><input type="text" class="form-control" id="entrpsnm" name="entrpsnm" required></td>
                            </tr>
                            <tr>
                                <th>티켓 가격</th>
                                <td><input type="text" class="form-control" id="pcseguidance" name="pcseguidance" required></td>
                            </tr>
                            <tr>
                                <th>장르</th>
                                <td>
                                    <input type="radio" id="theater" name="genrenm" value="연극">연극
                                    <input type="radio" id="musical" name="genrenm" value="뮤지컬">뮤지컬
                                    <input type="radio" id="dancing" name="genrenm" value="무용">무용
                                    <input type="radio" id="ballet" name="genrenm" value="발레">발레
                                    <input type="radio" id="classic" name="genrenm" value="클래식">클래식
                                    <input type="radio" id="opera" name="genrenm" value="오페라">오페라
                                    <input type="radio" id="complex" name="genrenm" value="복합">복합
                                </td>
                            </tr>
                            <tr>
                                <th>공연시간</th>
                                <td><input type="text" class="form-control" id="dtguidance" name="dtguidance" required></td>
                            </tr>
                            </tbody>
                            <input type="hidden" id="mt10id" name="mt10id" required>
                        </table>
                            <input class="form-control" type="file" name="upload_file_0" id="upload_file_0">

                            <input type="submit" class="btn btn-default" value="등록하기">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap-datepicker.js"/>'></script>
<script src='<c:url value="/js/bootstrap-datepicker.kr.js"/>' charset="UTF-8"></script>

<script>
    var openWin;

    $(function () {
        $('.input-group.date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy.mm.dd",
            language: "kr"
        });
    });

    function openPlace() {
        window.name = "applyConcert";
        openWin = window.open("searchPlace",
        "searchPlace","width=570, height=350, resizable = no");
    }
</script>
</body>
</html>
