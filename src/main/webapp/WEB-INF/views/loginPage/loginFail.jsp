<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script>

        $(function () {
            let passFail =${passFail};
            if (passFail == 0) {
                alert("비밀번호가 틀렸습니다. 다시확인해주세요");
            }
            history.back();
        });

    </script>
    <script>
        $(function () {
            let Notmember =${Notmember};
            if (Notmember == 0) {
                alert("존재하지않는 아이디 입니다.\n회원가입을해주세요");
            }
            document.location.href = "../";
        });
    </script>

    <script>
        $(function () {
            let loginBan =${loginBan};
            if (loginBan == 0) {
                alert("정지된 아이디 입니다.");
            };
            history.back();
        });
    </script>

</head>
<body>

</body>
</html>