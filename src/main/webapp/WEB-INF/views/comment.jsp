<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>상세페이지 게시글 글쓰기 </title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
		console.log($("#commentContent").val());
	}
});

$(document).ready(function(){
	$("#commentWrite").on("click",function(){		
		$.ajax({	
			url:"comment/write",
// 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
			data:{				
				commentContent:$("#commentContent").val(),
// 				mt20id:"${play.mt20id}"    
				mt20id:"PF140536"    
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
		url:"comment/read",	
		data:{
			mt20id:"${play.mt20id}",     
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
	<table border="1" width="500" align="center">  
	     <tr>
		     <td colspan="4">
		   	   <textarea rows="5" cols="70" id="commentContent"></textarea><br><br>
			   <c:if test="${id !=null}">
		    	  <input type="button" value="comment 쓰기" disabled="disabled">    	  
		       </c:if> 
		       <c:if test="${id ==null}">
	    	 	 <input type="button" value="comment 쓰기" id="commentWrite">
	     	   </c:if>	     	  
	     	   <input type="button" value="comment 읽기 [${ commentCount }]" onclick="getComment(1,event)" id="commentRead">	     	       
		   </td> 
		 </tr> 		
	 </table>	

	
	<form>
	<div>
		<div id="showComment" align="center">  
		</div>
		<input type="hidden" id="commPageNum" value="1">
	</div>	
	</form>
	
<table border="1" width="700" cellpadding="2" cellspacing="2" align="center"> 
    <tr height="30" > 
      <td align="center"  width="100"  >작성자 </td> 
      <td align="center"  width="400" >댓글내용 </td> 
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >삭제 </td>          
    </tr>
    
   <c:forEach var="comment" items="${commentList}">  <!--변수와 콜렉션객체  -->
   <tr height="20"> <!-- 테이블 row 높이  -->
    <td align="center"  width="100" > <!-- 테이블 가로 한칸 센터 너비:100 -->
	  <c:out value="${comment.mt20id}"/>	   <!-- 그 안에 데이터출력 아직 설정안한 comment.mt20id -->
	</td>
    <td  width="400" >  <!-- 테이블 가로 한칸 너비 :400 -->
      <c:if test="${comment.depth > 0}"> <!-- 그 안에 if문 comment dto 안에 있는 depth를 꺼내와서 0보다 크다면 -->
	  	<img src="images/image3.png" width="${10 * comment.depth}"  height="16"> <!-- 밑에 요놈을 이미지파일 부르고 너비는 10*depth인걸로 봐서는 대댓글이다. 높이는 16 -->
	    <img src="images/cut.gif"> <!-- 이미지 불러서 위에꺼 옆 붙인다? -->
	  </c:if>
	  <c:if test="${comment.depth == 0}"> <!-- 만약 depth가 0 이면  -->
	    <img src="images/image3.png" width="0"  height="16"> <!-- image3.png부르고 너비는 0이므로 상위 댓글을 추가한다. -->
	  </c:if>         
      <a href="/comment?mt20id=${comment.mt20id}&pageNum=${pageNum}"> <!-- a태그를 추가한다. 여기는 게시판리스트 글 선택할때 이동하는 부분이니까 댓글기능에서는 필요없어보인다.  -->
          ${comment.title}<c:if test="${comment.commentCount != 0}">(${comment.commentCount})</c:if></a> 
 
	</td>
    <td align="center"  width="150">${comment.writeDate}</td>
    <td align="center"  width="50"><a href=""></td>
  </tr>
  </c:forEach>
  <tr>	  
      <td colspan="5" align="center" height="40">	 
	  ${pageCode}
	  </td>
  </tr>
</table>
</body>
</html>