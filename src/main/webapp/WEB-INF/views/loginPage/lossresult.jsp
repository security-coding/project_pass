<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>


    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <style>
        .fail {
            color: #c91a6e;

        }
    </style>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>

<!-- 부가적인 테마 -->
	<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>
<div>
    <article class="container-fluid">
        <div class="page-header">
            <h1 class="center-block" style="width: 300px;padding:15px;">아이디찾기 결과</h1>
        </div>
        <div class="center-block" style="width: 300px;padding:5px;">
            <form id="idForm" class="form-horizontal" role="form" method="post">
                <!-- form -->
                <div class="form-group text-center">
                    <p class="user">당신의아이디는:${resultid} 입니다.</p>
                    <input type="button" value="비밀번호찾기" class="btn btn-info"
                           onclick="document.location.href='./userloss'">
                </div>
            </form>
        </div>
    </article>
</div>

</body>
</html>