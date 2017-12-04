<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>상세페이지 게시글 글쓰기</title>
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel= "stylesheet" type="text/css" href="resources/css/comment.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	$.ajaxSetup({
		type : "POST",
		async : true,
		dataType : "json",
		error : function(xhr) {
			alert("error html = " + xhr.statusText);
			console.log($("#commentContent").val());
		}
	});

	$(document).ready(function() {
		$("#commentWrite").on("click", function() {
			$.ajax({
				url : "/comment/write",
				data : {
					commentContent : $("#commentContent").val(),
					//mt20id:"${play.mt20id}"    
					mt20id : "PF140536"
				},
				success : function(data) {
					if (data.result == 1) {
						alert("comment가 정성적으로 입력되었습니다");
						$("#commentContent").val("");
						showHtml(data.commentList, 1);
					}
				}
			});
		});
	});
	
// 	function getComment(commPageNum, event){
// //	 	event.preventDefault();
// 		$.ajax({			
// 			url:"/comment/read",	
// 			data:{
// 				mt20id:"${comment.mt20id}",     
// //	 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
// 				commentRow:commPageNum * 10
// 			},
// 			success:function(data){
// 				showHtml(data,commPageNum,event);
// 			}				
// 		}); 	
// 	}
	
	function getComment(){
//	 	event.preventDefault();
		$.ajax({			
			url:"/comment/read",	
			data:{
				mt20id:"PF140536",     
//	 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
			},
			success:function(data){
				console.log(data);
				console.log(data.commentContent);
				showHtml(data,commPageNum,event);
			}				
		}); 	
	}
	
	function showHtml(data,commPageNum){	
		var html="<table border='1' width='500' align='center'>";
		$.each(data, function(index,item){
			html +="<tr>";	
// 			html +="<td>"+item.id+"</td>";
			html +="<td>"+item.commentNum+"</td>";
			html +="<td>"+item.mt20id+"</td>";
			html +="<td>"+item.commentContent+"</td>";
			html +="<td>"+item.commentDate+"</td>";		
			html +="</tr>";					
		});		
		html +="</table>";
		commPageNum=parseInt(commPageNum);
		if("${play.commentCount}">commPageNum*10){			
			nextPageNum=commPageNum+1;				
			html +="<br /><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'><br>";
		}
		$("#showComment").html(html);	
		$("#commentContent").val("");
		$("#commentContent").focus();
	}
</script>
</head>
<body>

	<div class="container" align="center">
		<div style="border: 1px solid; width: 600px; padding: 5px" >
			<form name="form1">
				<input type="hidden" name="mt20id" value="<c:out value="${comment.mt20id}"/>"> 
				<input type="hidden" name="commentNum"> 
					작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br />
				<textarea name="rememo" rows="3" cols="60" maxlength="500"
					placeholder="댓글을 달아주세요." id="commentContent"></textarea>
				<c:if test="${id ==null}">
					<input type="button" value="comment 쓰기" id="commentWrite">
				</c:if>
		
			</form>
			<input type="button" value="comment 읽기" onclick="getComment()" id="commentRead">
		</div>
		
	</div>

	<form>
		<div>
			<div id="showComment" align="center">
			</div>
			<input type="hidden" id="commPageNum" value="1">
		</div>
	</form> 

	<div class="container">
	  <div class="row">
	    <div class="col-md-8">
	      <h2 class="page-header">Comments</h2>
	        <section class="comment-list">
	          <!-- First Comment -->
	          <article class="row">
	            <div class="col-md-2 col-sm-2 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	            <div class="col-md-10 col-sm-10">
	              <div class="panel panel-default arrow left">
	                <div class="panel-body">
	                  <header class="text-left">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	          </article>
	          <!-- Second Comment Reply -->
	          <article class="row">
	            <div class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-0 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	            <div class="col-md-9 col-sm-9">
	              <div class="panel panel-default arrow left">
	                <div class="panel-heading right">Reply</div>
	                <div class="panel-body">
	                  <header class="text-left">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	          </article>
	          <!-- Third Comment -->
	          <article class="row">
	            <div class="col-md-10 col-sm-10">
	              <div class="panel panel-default arrow right">
	                <div class="panel-body">
	                  <header class="text-right">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-2 col-sm-2 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	          </article>
	          <!-- Fourth Comment -->
	          <article class="row">
	            <div class="col-md-2 col-sm-2 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	            <div class="col-md-10 col-sm-10 col-xs-12">
	              <div class="panel panel-default arrow left">
	                <div class="panel-body">
	                  <header class="text-left">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	          </article>
	          <!-- Fifth Comment -->
	          <article class="row">
	            <div class="col-md-10 col-sm-10">
	              <div class="panel panel-default arrow right">
	                <div class="panel-body">
	                  <header class="text-right">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-2 col-sm-2 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	          </article>
	          <!-- Sixth Comment Reply -->
	          <article class="row">
	            <div class="col-md-9 col-sm-9 col-md-offset-1 col-md-pull-1 col-sm-offset-0">
	              <div class="panel panel-default arrow right">
	                <div class="panel-heading">Reply</div>
	                <div class="panel-body">
	                  <header class="text-right">
	                    <div class="comment-user"><i class="fa fa-user"></i> That Guy</div>
	                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> Dec 16, 2014</time>
	                  </header>
	                  <div class="comment-post">
	                    <p>
	                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	                    </p>
	                  </div>
	                  <p class="text-right"><a href="#" class="btn btn-default btn-sm"><i class="fa fa-reply"></i> reply</a></p>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-2 col-sm-2 col-md-pull-1 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
	                <figcaption class="text-center">username</figcaption>
	              </figure>
	            </div>
	          </article>
	        </section>
	    </div>
	  </div>
	</div>


</body>
</html>