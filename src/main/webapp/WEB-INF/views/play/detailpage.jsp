<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${detailInf.prfnm}-상세정보</title>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/bootstrap-theme.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/detailpage.css"/>'>

    <script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
    <script src='<c:url value="/js/bootstrap.min.js"/>'></script>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2805bdc19b8576a7e4c249cfc74a27f2&libraries=services"></script>

    <script>
        let id = '${id}';
        let mt20id = '${detailInf.mt20id}';
        let heart = '${fullHeart}';

        function changeImg(changeStat) {
            if (id == '') {
                alert("좋아요 기능을 이용하기 위해서는 로그인이 필요합니다.");
                return;
            }
            let changeVal = $(changeStat).attr("value");
            console.log(changeVal);
            $.ajax({
                type: "POST",
                async: true,
                dataType: 'json',
                url: "/play/UpdateLikes",
                data: {
                    id: id,
                    mt20id: mt20id,
                    changeVal: changeVal
                },
                success: function (data) {
                    if (data.Stat == 0) {
                        $(inCount).html(data.Count);
                        $(changeStat).attr("src", "/images/likes/full-heart.png");
                        $(changeStat).attr("value", 1);
                    } else if (data.Stat == 1) {
                        $(inCount).html(data.Count);
                        $(changeStat).attr("src", "/images/likes/empty-heart.png");
                        $(changeStat).attr("value", 0);
                    }
                },
                error: function (e) {
                    alert("오류가 발생했습니다.");
                }
            });

        }

        function bookmark(obj) {
            if (id === '') {
                alert("북마크 기능을 이용하기 위해서는 로그인이 필요합니다.");
                return;
            }
            var value = $(obj).attr('value');
            $.ajax({
                url: '/play/bookmark',
                type: 'post',
                data: {
                    id: id,
                    mt20id: mt20id,
                    value: value
                },
                success: function (data) {
                    if (value == 0) {
                        alert("북마크가 설정되었습니다");
                        $(obj).attr("src", "/images/likes/bookmark.png");
                        $(obj).attr("value", 1);
                    } else {
                        $(obj).attr("src", "/images/likes/non_bookmark.png");
                        $(obj).attr("value", 0);
                    }
                }
            });
        }

        $(function () {
            if (id == '') {
                $("#commentContent").attr('readonly',true);
                $("#commentContent").html('로그인 후 댓글을 쓸 수 있습니다.');
            }

            $.ajax({
                type: "POST",
                async: true,
                dataType: 'json',
                url: "/play/nowLikes",
                data: {
                    mt20id: mt20id
                },
                success: function (data) {
                    $(inCount).html(data);
                }
            });
        });

        $(document).ready(function () {
            paging.ajax = ajaxList;
            ajaxList();

            $("#commentWrite").on("click", function () {
                if (id == '') {
                    alert("댓글 기능을 이용하기 위해서는 로그인이 필요합니다.");
                    return;
                }
                $.ajax({
                    url: "/comment/write",
                    data: {
                        commentContent: $("#commentContent").val(),
                        mt20id: "${detailInf.mt20id}"
                    },
                    success: function (data) {
                        //alert("정상적으로 입력되었습니다.");
                        $("#commentContent").val("");
                        ajaxList();
                    }
                });
            });

        });

        function deleteComment(obj) {
            var commentNum = $(obj).parents().prevAll("input[type=hidden]").val();
            console.log(commentNum);

            $.ajax({
                url: "/comment/delete",
                type: "post",
                data: {
                    commentNum: commentNum
                },
                success: function (result) {
                    alert("삭제되었습니다.");
                    ajaxList();
                }
            });
        }

        var ajaxList = function () {
            var submitData = {};
            submitData.index = paging.p.index;
            submitData.pageStartNum = paging.p.pageStartNum;

            $.ajax({
                url: "/comment/read",
                type: "post",
                data: {
                    mt20id: "${detailInf.mt20id}",
                    index: paging.p.index,
                    pageStartNum: paging.p.pageStartNum,
                },
                success: function (obj) {
                    $("#comment-group").empty();
                    var str = '';
                    $.each(obj.list, function (index, comment) {

// 						console.log(comment);
                        str += "<br />";
                        str += "<div class='media mb-4'>";
                        str += "<input type='hidden' value='" + comment.commentNum + "'>";
                        str += "<img class='d-flex mr-3 rounded-circle' src='" + comment.profile + "' alt=''>";
                        str += "<div class='media-body'>";
                        str += "<h5 class='mt-0'>" + "작성자 : " + comment.id + "&nbsp&nbsp&nbsp&nbsp" + "작성일 : " + comment.commentDate;
                        if (comment.id == id) {
                            str += "&nbsp&nbsp&nbsp&nbsp&nbsp" + "<button id='commentDelete' class='btn btn-primary' onclick='deleteComment(this);'>" + "삭제" + "</button>";
                        }
                        str += "</h5>";
                        str += comment.commentContent;
                        str += "</div>";
                        str += "</div>";
                    });
                    $("#comment-group").append(str);
                    $("#totalComment").html(obj.p.total);
                    paging.p = obj.p;
                    paging.create();
                }
            });
        };


    </script>
    <style>
		.table_list {
			width: 100%;	
		}
		
        .table_list tr th {
            vertical-align: top;
            text-align : center;
            background-color: #f7f7f7;
            padding : 0.3rem;
        }

        .table_list tr td {
            text-overflow: clip;
            font-size: 0.85em;
            padding : 0.3rem;
        }
    </style>
</head>

<body>
<%@include file="../header.jsp"%>
<div class="container" style="margin-top: 100px">
    <div class="row">
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-12">
                    <img src="${detailImages[0]}" style="width: 100%; height: auto;">
                </div>
                <div class="col-lg-7 col-md-7 col-sm-12">
                    <div class="row">
                        <div class="col-lg-12">
                        		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        		<span>좋아요</span>
                            <c:choose>
                                <c:when test="${fullHeart eq 0}">
                                    <img id="empty-heart" src="/images/likes/empty-heart.png" value=0
                                         style="width:20px;, height:20px;" onclick="changeImg(this)">
                                    <span id=inCount></span>
                                </c:when>
                                <c:when test="${fullHeart eq 1}">
                                    <img id="full-heart" src="/images/likes/full-heart.png" value=1
                                         style="width:20px;, height:20px;" onclick="changeImg(this)">
                                    <span id=inCount></span>
                                </c:when>
                            </c:choose>
                            </div>
							<span>북마크</span>
                            <c:choose>
                                <c:when test="${bookmark eq 0}">
                                    <img id="bookmark" src="/images/likes/non_bookmark.png" value=0
                                         style="width:20px; height:20px" onclick="bookmark(this);">
                                </c:when>
                                <c:when test="${bookmark eq 1}">
                                    <img id="bookmark" src="/images/likes/bookmark.png" value=1
                                         style="width:20px; height:20px" onclick="bookmark(this);">
                                </c:when>
                            </c:choose>
                        </div>

                        <div class="col-lg-12">
                            <h2>${detailInf.prfnm}</h2>
                            <h4>${detailInf.genrenm} . ${detailInf.prfpdfrom} ~ ${detailInf.prfpdto}</h4>
                            <table class="table_list table-bordered">
                                <colgroup>
                                    <col width="30%">
                                    <col width="*">
                                </colgroup>
                                <tr>
                                    <th scope="row">공연 일정</th>
                                    <c:set var="dtguidance" value="${detailInf.dtguidance}"/>
                                    <td>${fn:replace(dtguidance, '),' , ')<br/>')}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 시설명</th>
                                    <td>${detailInf.fcltynm}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 출연진</th>
                                    <td>${detailInf.prfcast}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 제작진</th>
                                    <td>${detailInf.prfcrew}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 런타임</th>
                                    <td>${detailInf.prfruntime}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 관람 연령</th>
                                    <td>${detailInf.prfage}</td>
                                </tr>
                                <tr>
                                    <th scope="row">공연 제작사</th>
                                    <td>${detailInf.entrpsnm}</td>
                                </tr>
                                <tr>
                                    <th scope="row">티켓 가격</th>
                                    <c:set var="pcseguidance" value="${detailInf.pcseguidance}"/>
                                    <td>${fn:replace(pcseguidance, '원,' , '원<br/>')}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            		<div class="text-center">
                		<h3>공연 정보</h3>
                </div>
                <div class="col-md-12">
                    <c:forEach var="detailImage" items="${detailImages}" begin="1">
                        <img class="img-fluid img-thumbnail" src="${detailImage}"/>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <h3>공연 지도 위치</h3>

            <div id="map" style="width: 100%; height: 350px;"></div>

            <hr/>

            <!-- Comments Form -->
            <div class="card my-4">
                <p/>
                <h3 class="card-header">댓글 남기기</h3>
                <div class="card-body">
                    <div class="form-group">
                        <textarea id="commentContent" class="form-control" rows="3"></textarea>
                    </div>
                    <div align="right">
                        <button id="commentWrite" class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 댓글 남기기</button>
                        <div>
                        </div>
                    </div>
                    <h5>총 댓글 수 : <span id="totalComment"></span></h5>
                    <div id="comment-group"></div>
                    <div class="text-center">
                    		<%@include file="../paging.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <%@include file="../footer.jsp" %>
</div>


<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo}), // 지도의 중심좌표
            level: 5, // 지도의 확대 레벨
            scrollwheel: false,
            disableDoubleClick: false,
            disableDoubleClickZoom: false
        };

    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

    // 마커가 표시될 위치입니다 
    var markerPosition = new daum.maps.LatLng(${detailInf.la}, ${detailInf.lo});


    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        position: markerPosition
    });


    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);


    let geocoder = new daum.maps.services.Geocoder();

    let callback = function (result, status) {
        if (status === daum.maps.services.Status.OK) {
            console.log(result);
            console.log(status);
            console.log(result.x);
        }
    };

    //geocoder.addressSearch('부산광역시 남구 용당동 331', callback);
</script>
</body>
</html>