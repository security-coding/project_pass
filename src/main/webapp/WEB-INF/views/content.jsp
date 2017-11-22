<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>글읽기</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
	}
});

$(document).ready(function(){
	$("#commentWrite").on("click",function(){		
		$.ajax({	
			url:"commentWrite.comment",
// 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
			data:{				
				commentContent:$("#commentContent").val(),
				articleNum:"${article.articleNum}"
			},
			success:function(data){
				if(data.result==1){
					alert("comment가 정성적으로 입력되었습니다");
					$("#commentContent").val("");
					showHtml(data.commentList,1);
				}
			}					
		}); 
	});	
});

function getComment(commPageNum, event){
// 	event.preventDefault();
	$.ajax({			
		url:"commentRead.comment",	
		data:{
			articleNum:"${article.articleNum}",
// 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
			commentRow:commPageNum*10
		},
		success:function(data){
			showHtml(data,commPageNum,event);
		}				
	}); 	
}

function showHtml(data,commPageNum){	
	var html="<table border='1' width='500' align='center'>";
	$.each(data, function(index,item){
		html +="<tr>";
		html +="<td>"+(index+1)+"</td>";
		html +="<td>"+item.id+"</td>";
		html +="<td>"+item.commentContent+"</td>";
		html +="<td>"+item.commentDate+"</td>";					
		html +="<td>"+item.articleNum+"</td>";					
		html +="</tr>";					
	});		
	html +="</table>";
	commPageNum=parseInt(commPageNum);
	if("${article.commentCount}">commPageNum*10){			
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
   <form action="replyForm.bbs" method="post">      
    <input type="hidden" name="pageNum" value="${pageNum}">                 
    <input type="hidden" name="depth" value="${article.depth}">    
<!--     계층형 쿼리 사용을 위해서 부모글의 글 번호가 답글의 groupId가 되어야 함 -->
    <input type="hidden" name="groupId" value="${article.articleNum}">
	<table border="1" width="500" align="center">       
	
	     <tr>
		     <td colspan="4">
		   	   <textarea rows="5" cols="70" id="commentContent"></textarea><br><br>
			   <c:if test="${id ==null}">
		    	  <input type="button" value="comment 쓰기" disabled="disabled">    	  
		       </c:if> 
		       <c:if test="${id !=null}">
	    	 	 <input type="button" value="comment 쓰기" id="commentWrite">
	     	   </c:if>	     	  
	     	   <input type="button" value="comment 읽기(${article.commentCount })" onclick="getComment(1,event)" id="commentRead">	     	       
		   </td> 
		 </tr> 	
		 	
		 </table>	
	</form>
	
	<form>
	<div>
		<div id="showComment" align="center">
		</div>
		<input type="hidden" id="commPageNum" value="1">
	</div>	
	</form>
</body>
</html>