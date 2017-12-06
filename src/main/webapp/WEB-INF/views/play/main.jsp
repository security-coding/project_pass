<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PASS MAIN</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/boxoffice.css"/>'>

    <script>
        function blank() {
            if ($('#keyword').val() == "") {
                alert("검색어를 입력해주세요");
                return false;
            } else {
                return true;
            }
        }
    </script>

    <script>
        function CertifyCheck() {
            let Certify = ${dbCertify};
            if (Certify == 0) {
                alert("회원가입 이메일 인증을 안하셨습니다.");
            }
            document.location.href = "./main";
        }
    </script>
    <style>
        #searchHeader {
            font-size: 4.5rem;
        }
    </style>
</head>

<body>
<%@include file="../loginPage/header.jsp"%>

<!-- Header -->
<a id="about"></a>
<div class="intro-header">
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div class="intro-message">
                    <h1 id="searchHeader">검색창에 보고싶은 </h1>
                    <hr class="intro-divider">
                    <ul class="list-inline intro-social-buttons">
                        <li>
                            <div>
                                <!-- Search Widget -->
                                <form action="/play/search" onsubmit="return blank()">
                                    <div class="card my-4">
                                        <div class="card-body">
                                            <div class="input-group col-md-4 col-md-offset-4">
                                                <input id="keyword" name="keyword" type="text"
                                                       class="form-control" placeholder="보고싶은 공연을 검색해 보세요!"> <span
                                                    class="input-group-btn"> <input
                                                    class="btn" type="submit" value="검색"/>
											</span>
                                            </div>
                                        </div>
                                    </div>
                                </form><!--검색부분 -->
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->
</div>
<!-- /.intro-header -->

<!-- Page Content -->
<div>
    <div class="text-center" id="typeNav">
        <h1>BOX OFFICE</h1>
    </div>


<!--     <ul class="typeNav"> -->
<!--         <li><a class="butn" href="#" onclick="change('YK');">연극</a></li> -->
<!--         <li><a class="butn" href="#" onclick="change('MU');">뮤지컬</a></li> -->
<!--         <li><a class="butn" href="#" onclick="change('CCO');">클래식/오페라</a></li> -->
<!--         <li><a class="butn" href="#" onclick="change('MMB');">무용/발래</a></li> -->
<!--         <li><a class="butn" href="#" onclick="change('KKB');">국악/복합</a></li> -->
<!--     </ul> -->
    
    <div class="typeNav" > 
<ul class="nav nav-tabs  nav-justified">
  
  <li  role="presentation"><a href="#" onclick="change('YK');">연극</a></li>
  <li  role="presentation"><a href="#" onclick="change('MU');">뮤지컬</a></li>
  <li  role="presentation"><a href="#" onclick="change('CCO');">클래식/오페라</a></li>
  <li  role="presentation"><a href="#" onclick="change('MMB');">무용/발래</a></li> 
  <li  role="presentation"><a href="#" onclick="change('KKB');">국악/복합</a></li>
  
</ul>
	</div>
<br>	
    
    <div class="container">
        <div class="row text-center">
            <div class="poster">

                <div id="type" class="test row" data-index="전체"></div>
                <c:forEach var="play" items="${boxList}" varStatus="status">
                    <div class="col-lg-15 col-md-4 col-sm-6 col-xs-12 boxContent">
                        <a href="/play/detail?mt20id=${play.mt20id}">


                            <div style="position: absolute; z-index: 2;"><img src="/resources/images/rank/poster_rank_${status.count}.png"/></div>
                            <div style="position: relative; z-index: 1;" class="image-lg image-md image-sm image-xs">

                                <div><img class="img-responsive img-thumbnail image-lg image-md image-sm image-xs"
                                          src="${play.imageurl}" alt=""/></div>


                                <div class="img-responsive img-thumbnail overlay">
                                    <div class="text">
                                        <%-- <p>RANK ${play.rnum}</p><br> --%>
                                        <p>${play.prfnm}</p><br>
                                        <p>${play.prfpd}</p><br>
                                        <p>${play.prfplcnm}</p><br>
                                        <p>${play.cate}</p>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- </div> 고려-->
<!-- /.container -->

<!-- </div> 고려-->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-inline">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#about">About</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#services">Services</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                </ul>
                <p class="copyright text-muted small">Copyright &copy; Your Company 2014. All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src='<c:url value="/js/jquery_1.12.4_jquery.js"/>'></script>
<!-- Bootstrap Core JavaScript -->

<script src='<c:url value="/js/bootstrap.min.js"/>'></script>

</body>


<script>
    $(document).ready(function () {
        var jbOffset = $('.typeNav').offset();

        $(window).scroll(function () {

            if ($(document).scrollTop() > jbOffset.top) {
                $('.typeNav').addClass('jbFixed');
            } else {
                $('.typeNav').removeClass('jbFixed');
            }
        });

        var items = [
            '연극',
            '뮤지컬',
            '오페라',
            '클래식',
            '무용'
        ];
        var app = document.getElementById('searchHeader');
        var count = 0;
        var index = 0;
        var typingEffect = function typingEffect() {
            var text = items[index];
            if (count < text.length) {
                setTimeout(function () {
                    app.innerHTML += text[count];
                    count++;
                    typingEffect();
                }, Math.floor(Math.random(10) * 500));
            } else {
                count = 0;
                index = index + 1 < items.length ? index + 1 : 0;
                setTimeout(function () {
                    app.innerHTML = '검색창에 보고싶은 ';
                    typingEffect();
                }, 4500);  //텍스트 체인지 시간
            }
        };
        typingEffect();
    });

    function change(value) {

        $.ajax({
            type: "POST",
            dataType: "JSON",
            url: "/play/change",
            data: ({"type": value}),
            success: function (data) {
                let str = "";
                let typ = "";
                $(".poster").empty();
                $.each(data, function (index, item) {

                    str = "<div class='col-lg-15 col-md-3 col-xs-3 boxContent' >"
                        + "<a href='/play/detail?mt20id=" + item.mt20id + "'>"
                        + "<div style='position: absolute; z-index: 2;'><img src='/resources/images/rank/poster_rank_" + (index + 1) + ".png'/></div>"
                        + "<div style='position: relative; z-index: 1;' class='imageUrl'>"
                        + "<img class='img-fluid img-thumbnail image-lg image-md image-sm image-xs' src= '" + item.imageurl + "' alt=''/>"
                        + "<div class='img-fluid img-thumbnail overlay'>"
                        + "<div class='text'>" 							                    
                        + "<p>" + item.prfnm + "</p><br>"
                        + "<p>" + item.prfpd + "</p><br>"
                        + "<p>" + item.prfplcnm + "</p><br>"
                        + "<p>" + item.cate + "</p>"
                        + "</div>"
                        + "</div>"
                        + "</div>"
                        + "</a></div>"

                    $(".poster").append(str);
// 					location.href="#typeNav";
                    window.scroll(0, getOffsetTop(document.getElementById("typeNav")));
                });

            }
        })
    }


    function getOffsetTop(el) {
        var top = 0;
        if (el.offsetParent) {
            do {
                top += el.offsetTop;
            }
            while (el = el.offsetParent);
            return [top];
        }
    }

    // 	window.scroll(0, getOffsetTop(document.getElementById("bookmark")));


</script>

</html>