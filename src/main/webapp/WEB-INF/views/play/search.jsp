<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Result page (search.jsp)</title>

    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <style>
        table tr th {
            vertical-align: top;
            background-color: #f7f7f7;
            text-align: center;
        }

        table tr td {
            text-overflow: clip;
            font-size: 0.85em;
            padding: 0.3rem;
        }

        .i-am-centered {
            margin: auto;
            max-width: 80%;
        }
    </style>
</head>
<body>
<div>
    <%@include file="../header.jsp"%>
</div>
<div class="container" style="margin-top: 6%;">
    <div>
        <h2 align="center">검색 결과</h2>
    </div>
    <div class="i-am-centered">
        <form action="/play/search" onsubmit="return blank();">

            <div class="input-group panel-body">
                <input id="keyword" name="keyword" type="text" class="form-control" placeholder="공연 제목 입력">
                <span class="input-group-btn"><input class="btn btn-info" type="submit" value="검색"></span>
            </div>

        </form>


        <c:forEach var="keyword" items="${keyword}">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
                    <a href="/play/detail?mt20id=${keyword.mt20id}">
                        <img src="${keyword.imageUrl}" class="img-fluid img-thumbnail rounded"
                             style="width: 100%; height: auto">
                    </a>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-7 col-xs-12">
                    <h3 align="center">${keyword.prfnm}</h3>
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="30%;">
                            <col width="*">
                        </colgroup>
                        <tr>
                            <th>공연 시작일</th>
                            <td>${keyword.prfpdfrom}</td>
                        </tr>
                        <tr>
                            <th>공연 종료일</th>
                            <td>${keyword.prfpdto}</td>
                        </tr>
                        <tr>
                            <th>공연 총시간</th>
                            <c:set var="dtguidance" value="${keyword.dtguidance}"/>
                            <td>${fn:replace(dtguidance, '),' , ')<br/>')}</td>
                        </tr>
                        <tr>
                            <th>공연 시설</th>
                            <td>${keyword.fcltynm}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <hr/>
        </c:forEach>
        <c:if test="${empty keyword}">
            <section id="wrapper" style="margin-top: 20%; margin-bottom: 15%;">
                <div class="error-body text-center">
                    <h1 class="text-muted" style="margin-bottom: 3%">해당 검색 결과가 없습니다</h1>
                    <h4 class="text-muted" style="margin-bottom: 2%">다시 한번 검색하기 바랍니다</h4>
                    <a href="/" class="btn btn-danger btn-rounded">메인으로 돌아가기</a>
                </div>
            </section>
        </c:if>
    </div>
</div>
<div>
	<%@include file="../footer.jsp" %>
</div>
   

<!-- Bootstrap core JavaScript -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</body>
</html>