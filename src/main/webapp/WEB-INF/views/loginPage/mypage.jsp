<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>

    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

    <style>
        ul {
            list-style: none;

        }

        #profileLine {
            margin: 0 0 0 0;
            padding: 0 0 0 0;
            border: 0;
            float: left;
        }

        @media all and (min-width: 768px) and (max-width: 1300px) {
            #menu {
                border-style: solid;
                border-color: rgba(0, 0, 0, 0.5);
                position: fixed;
                border-radius: 10px;
                width: 150px;
                height: 165px;
            }

            #headerMenu {
                font-size: 16px;
                margin-left: 15px;
                color: rgba(122, 157, 255, 1);

            }
        }

        #menu {
            border-style: solid;
            border-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            width: 150px;
            height: 165px;
        }

        #headerMenu {
            font-size: 16px;
            margin-left: 15px;
            color: rgba(122, 157, 255, 1);

        }
    </style>

    <script>
        function setMyimage(imgsrc) {
            let nowProfile = document.getElementById('myimage');
            let img = imgsrc.getAttribute('src');
            nowProfile.setAttribute('src', img);
            $.ajax({
                type: "POST",
                async: true,
                dataType: 'String',
                url: '/member/updateprofile',
                data: {
                    srcinput: nowProfile.getAttribute('src')
                },
                success: function (data) {

                    console.log(data);
                }
            });
        }
    </script>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
<body>

<article id="Form" class="container-fluid">

    <div class="page-header">
        <div>
            <%@include file="../header.jsp" %>
        </div>
    </div>

    <div class="col-sm-3 col-md-2 sidebar" style="margin-top: 1%;">
        <ul id="menu" class="nav nav-sidebar">
            <li><p id="headerMenu">메뉴</p></li>
            <li class="active"><a href="/member/mypage">내정보<span class="sr-only">(current)</span></a></li>
            <li><a href="/member/myPassChange">회원정보 변경</a></li>
            <li><a href="/member/memberClearForm">회원탈퇴</a></li>
        </ul>
    </div>

    <div id="mainForm" class="col-xs-8 col-sm-6">
        <div class="col-md-12">
            <form id="loginForm" class="form-horizontal" role="form" action="/member/updateuser" method="post">
                <!-- form -->

                <div class="form-group" style="margin-top: 2%;">
                    <label for="id" id="id" name="id">ID:${id}</label>
                    <div id="idcheck"></div>
                </div>

                <div class="form-group">

                    <table>
                        <tr>
                            <label for="email">Email:
                                <td>
                                    <div>
                                        <input id="email" name="email" type="text" class="form-control"
                                               placeholder="Email" style="width: 200px" value="${user.email}"
                                               disabled="true"></div>
                                </td>
                            </label>
                        </tr>
                    </table>

                    <tr>
                        <label>Address:
                            <div>
                                <input type="text" id="address" name="address" placeholder="주소" value="${user.address}"
                                       disabled="disabled"> - <input type="text" id="detailaddress" name="detailaddress"
                                                                     placeholder="상세주소" value="${user.detailAddress}"
                                                                     disabled="disabled">
                            </div>
                        </label>
                    </tr>
                </div>


                <div>
                    <img id="myimage" src="${imageUrl}" alt="..." class="img-thumbnail">
                </div>
                <div class="btn-group" style="">
                    <!-- 				<button id="spreadBtn" type="button"> -->
                    <%-- 					<img id="myimage" src="${imageUrl}"> <span class="caret"></span> --%>
                    <!-- 				</button> -->
                    <ul id="hiddenList" style="display: none;">
                        <c:forEach begin="1" end="13" varStatus="status">
                            <li id="profileLine"><img id="img${status.count}" class="img"
                                                      src="/resources/images/profile/img${status.count}.png"
                                                      onclick="setMyimage(this)"></li>
                        </c:forEach>
                    </ul>
                </div>
            </form>
        </div>
        <!-- bookmark content -->
        <br>
        <h3 class="text-center">북마크 LIST</h3>
        <div class="row">
            <c:forEach var="bookmark" items="${list}">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <a href="/play/detail?mt20id=${bookmark.mt20id}">
                            <img src="${bookmark.imageUrl}" alt="...">
                        </a>
                        <div class="caption">
                            <h3>${bookmark.prfnm}</h3>
                            <p>${bookmark.prfpdfrom}</p>
                            <p>${bookmark.prfpdto}</p>
                            <p>${bookmark.genrenm}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <h3 class="text-center">거주지 주변 공연현황 </h3>
            <div class="content">
                <div class="col-md-4">
                    <div class="well">
                        <div id="resultTitles"></div>
                    </div>
                </div>
                <div id="mapContainer" class="col-md-8">
                    <div id="map" style="width:500px;height:400px;"></div>
                </div>
            </div>
        </div>
    </div>
</article>
<%@include file="../footer.jsp" %>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(${la}, ${lo}), // 지도의 중심좌표
            level: 7, // 지도의 확대 레벨
            scrollwheel: false,
            disableDoubleClick: false,
            disableDoubleClickZoom: false
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    <c:forEach items="${places}" var="info">

    var place = {
        mt10id: "${info.mt10id}",
        fcltynm: "${info.fcltynm}",
        relateurl: "${info.relateurl}",
        telno: "${info.telno}"
    };


    var imageSize = new daum.maps.Size(24, 35);
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35);

    // 마커 이미지를 생성합니다
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new daum.maps.LatLng(${info.la}, ${info.lo}), // 마커를 표시할 위치
        title: "${info.fcltynm}", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image: markerImage // 마커 이미지
    });


    (function (marker, place) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다
        daum.maps.event.addListener(marker, 'click', function () {
            $("#resultTitles").empty();
            getTitles(place);
        });
    })(marker, place);

    </c:forEach>

    function getTitles(place) {
        var str = "<div><h4 class='text-center'><a href='" + place.relateurl + "' target='_blank'>" + place.fcltynm + "</a></h4>";
        $.ajax({
            url: '/place/titles',
            type: 'post',
            data: {
                mt10id: place.mt10id
            },
            success: function (data) {

                $.each(data, function (index, item) {

                    str += "<div class='contentBox'><div class='imgBox'><a href='/play/detail?mt20id=" + item.mt20id + "'>";
                    str += "<img class='img-responsive' src='<c:url value='"+item.imageUrl+"'/>'></a></div>";
                    str += "<div class='titleInf'><p>" + item.prfnm + "</p>";
                    str += "<p>" + item.prfpdfrom + "<span>~</span>" + item.prfpdto + "</p>";
                    str += "<p>" + item.genrenm + "</p>";
                    str += "</div></div>";
                    str += "<div class='clearfix'></div>";
                });
                str += "</div>";
                str += "<a href='tel:" + place.telno + "'><p>문의 전화 : " + place.telno + "</p></a>";
                $("#resultTitles").append(str);
            },
            error: function (e) {
                alert(e.responseText);
            }
        });
    }


    $(document).ready(function () {
        $("#myimage").click(function () {
            if ($("#hiddenList").is(":visible")) {
                $("#hiddenList").slideUp();
            } else {
                $("#hiddenList").slideDown();
            }
        });
    });

</script>
</body>
<script src='<c:url value="/js/bootstrap.min.js"/>'></script>
</html>