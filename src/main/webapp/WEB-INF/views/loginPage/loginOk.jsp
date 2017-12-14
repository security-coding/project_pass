<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<style type="text/css">
    @media all and (min-width: 768px) and (max-width: 1300px) {
        .user {
            float: left;
            padding-top: 1px;
        }
    }

    .user_a {
        text-decoration: none;
        color: black;
        display: inline-flex;
    }

    .user_a:hover {
        color: gray;
        text-decoration: none;
    }

    .login-form {
        padding-top: 9px;
        padding-left: 10px;
    }
</style>


<form class="login-form navbar-right" action="/member/logout" method="post">
    <a href="/member/mypage" class="user_a">
        <p class="user">
            <img alt="" style="width:30px; height:30px;" src="${imageUrl}" onerror="this.style.display='none'">
            <span style="font-size: 15px;">&nbsp&nbsp${id}</span>
        </p>
    </a>
    &nbsp&nbsp&nbsp
    <button class="btn btn-sm btn-primary" id="logout">로그아웃</button>
    <!-- 버튼태그가 form태그안에 선언되면 해당되는  form이 submit이 선언된다 -->

</form>
