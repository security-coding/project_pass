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


</body>
</html>