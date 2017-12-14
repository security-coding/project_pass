<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>searchPlace(admin)</title>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <style>
        button {
            border: 0;
            background: transparent;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>공연 시설 검색</h3>
    <div class="input-group">
        <input class="form-control" type="text" id="search" name="search">
        <span class="input-group-btn"><input class="btn btn-info" type="button" id="btn" name="btn"
                                             onclick="searchPlace();" value="검 색"></span>
    </div>
    <hr/>
    <div id="table"></div>
</div>


<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
<script>
    $('#search').on('keypress', function (e) {
        if (e.which === 13)
            searchPlace();
    });

    function searchPlace() {
        let value = $('#search').val();
        if (value.length < 2) {
            alert('최소 두 글자 이상 입력해주세요');
            return;
        }

        $.ajax({
            url: '/admin/searchPlace',
            type: 'post',
            data: {
                value: value
            },
            success: function (data) {
                $('#table').empty();
                let str = '<table class="table table-bordered"><thead><tr><th class="info">공연 시설명</th><th class="info">지 역</th></tr></thead><tbody>';

                $.each(data, function (index, place) {
                    str += '<tr>';
                    str += '<td>' +
                        '<button onclick="sendValue(this);"><span>' + place.fcltynm + '</span></button>' +
                        '<span style="display: none">' + place.mt10id + '</span>' +
                        '</td>';
                    str += '<td>' + place.sidonm + '</td>';
                    str += '</tr>';
                });

                str += '</tbody></table>';
                str += '<button class="btn btn-sm btn-danger" onclick="window.close()">닫 기</button>';
                $('#table').append(str);
            }
        });
    }

    function sendValue(obj) {
        var fcltynm = $(obj).text();
        var mt10id = $(obj).next().text();

        $(opener.document).find('#fcltynm').val(fcltynm);
        $(opener.document).find('#mt10id').val(mt10id);

        window.close();
    }
</script>
</body>
</html>
