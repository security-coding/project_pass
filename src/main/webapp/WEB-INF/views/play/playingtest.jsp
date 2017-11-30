<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>현재상영작</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       
       
           
        
        <link rel="stylesheet" href='<c:url value="/playingsoce/css/normalize.css"/>'>
        <link rel="stylesheet" href='<c:url value="/playingsoce/css/font-awesome.css"/>'>
        <link rel="stylesheet" href='<c:url value="/playingsoce/css/bootstrap.min.css"/>'>
        <link rel="stylesheet" href='<c:url value="/playingsoce/css/templatemo-style.css"/>'>
        <script src='<c:url value="/playingsoce/js/vendor/modernizr-2.6.2.min.js"/>'></script>
       
    </head>
    <body>
           
        <div id="loader-wrapper">
            <div id="loader"></div>
        </div>

        <div class="content-bg"></div>
        <div class="bg-overlay"></div>

        <!-- SITE TOP -->
        <div class="site-top">
            <div class="site-header clearfix">
                <div class="container">
                    <a href="#" class="site-brand pull-left"><strong>Masonry</strong> Free Template</a>
                    <div class="social-icons pull-right">
                        <ul>
                            <li><a href="#" class="fa fa-facebook"></a></li>
                            <li><a href="#" class="fa fa-twitter"></a></li>
                            <li><a href="#" class="fa fa-behance"></a></li>
                            <li><a href="#" class="fa fa-dribbble"></a></li>
                            <li><a href="#" class="fa fa-google-plus"></a></li>
                        </ul>
                    </div>
                </div>
            </div> <!-- .site-header -->
            <div class="site-banner">
                <div class="container">
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8 text-center">
                            <h2>Get free templates from <span class="blue">template</span><span class="green">mo</span></h2>
                            <p>Masonry is free responsive template that can be used for any website. You may download, modify and use this layout for your personal or commercial websites. Please tell your friends about <span class="blue">template</span><span class="green">mo</span>.com website. Thank you.</p>
                        </div>
                    </div>
                    <div class="row">
                        <form action="#" method="post" class="subscribe-form">
                            <fieldset class="col-md-offset-4 col-md-3 col-sm-8">
                                <input type="email" id="subscribe-email" placeholder="Enter your email...">
                            </fieldset>
                            <fieldset class="col-md-5 col-sm-4">
                                <input type="submit" id="subscribe-submit" class="button white" value="Subscribe!">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div> <!-- .site-banner -->
        </div> <!-- .site-top -->
        
        <!-- MAIN POSTS -->
        <div class="main-posts">
            <div class="container">
                <div class="row">
                    <div class="blog-masonry masonry-true">
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb"> 
                                <img src='<c:url value="/playingsoce/images/1.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Title one goes here</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">25 Jan 2084</span>
                                        <h4><a href="#">Title one goes here</a></h4>
                                        <p>Cum sociis natoque penatibus et magnis dis parturient</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/2.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Second Image Title</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">24 Jan 2084</span>
                                        <h4><a href="#">Second Image Title</a></h4>
                                        <p>Donec venenatis libero sapien, eu condimentum lacus</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/3.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Image Number Three</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">23 Jan 2084</span>
                                        <h4><a href="#">Image Number Three</a></h4>
                                        <p>Sed vitae lacus eget ipsum scelerisque condimentum</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/4.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Aliquam sed magna risus</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">22 Jan 2084</span>
                                        <h4><a href="#">Aliquam sed magna risus</a></h4>
                                        <p>Praesent pharetra blandit ex sed imperdiet</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/5.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Lorem ipsum dolor sit</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">21 Jan 2084</span>
                                        <h4><a href="#">Lorem ipsum dolor sit</a></h4>
                                        <p>Vestibulum faucibus lacus ac risus efficitur</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/6.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Praesent eget lectus mauris</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">20 Jan 2084</span>
                                        <h4><a href="#">Praesent eget lectus mauris</a></h4>
                                        <p>Morbi placerat pellentesque tortor, sed auctor dolor</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/7.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Donec nec metus non</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">15 Jan 2084</span>
                                        <h4><a href="#">Donec nec metus non</a></h4>
                                        <p>Phasellus eu sapien sagittis, sodales neque ac</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/8.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Vestibulum faucibus lacus</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">14 Jan 2084</span>
                                        <h4><a href="#">Vestibulum faucibus lacus</a></h4>
                                        <p>In aliquet et tellus in iaculis. Ut fermentum quis tellus</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                        <div class="post-masonry col-md-4 col-sm-6">
                            <div class="post-thumb">
                                <img src='<c:url value="/playingsoce/images/9.jpg"/>' alt="">
                                <div class="title-over">
                                    <h4><a href="#">Pellentesque habitant morbi</a></h4>
                                </div>
                                <div class="post-hover text-center">
                                    <div class="inside">
                                        <i class="fa fa-plus"></i>
                                        <span class="date">13 Jan 2084</span>
                                        <h4><a href="#">Pellentesque habitant morbi</a></h4>
                                        <p>Fusce ullamcorper diam vel arcu scelerisque</p>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- /.post-masonry -->
                    </div>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-behance"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-google-plus"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p class="copyright-text">Copyright &copy; 2084 Company Name
                        | Photos by <a rel="nofollow" href="http://unsplash.com">Unsplash</a></p>
                    </div>
                </div>
            </div>
        </footer>

        <script src='<c:url value="/playingsoce/js/vendor/jquery-1.10.2.min.js"/>'></script>
        <script src='<c:url value="/playingsoce/js/min/plugins.min.js"/>'></script>
        <script src='<c:url value="/playingsoce/js/min/main.min.js"/>'></script>

        <!-- Preloader -->
        <script type="text/javascript">
            //<![CDATA[
            $(window).load(function() { // makes sure the whole site is loaded
                $('#loader').fadeOut(); // will first fade out the loading animation
                    $('#loader-wrapper').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
                $('body').delay(350).css({'overflow-y':'visible'});
            })
            //]]>
        </script>
	<!-- templatemo 434 masonry -->
    </body>
</html>