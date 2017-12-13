<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<form class="navbar-form navbar-right" role="form" method="post" action="/member/login" onsubmit="CertifyCheck()">
    <div class="form-group">
        <!-- modal 구동 버튼 (trigger) -->
        <button type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#myModal" onclick="empty()">로그인
        </button>
        <button type="button" class="btn btn-primary"
                onclick="location.href='/member/joinForm'">회원가입
        </button>