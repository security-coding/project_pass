<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>index</title>
<meta charset="UTF-8">
</head>
<body>

	<a
		href="${pageContext.request.contextPath}/resources/upload/poster/PF_PF140315_171109_114524.gif">h</a>
	<img
		src="${pageContext.request.contextPath}/resources/upload/poster/PF_PF140315_171109_114524.gif" />

 <c:forEach var="play" items="${playList}">
   <tr>
    <td>  
         
      <a href="${pageContext.request.contextPath}/resources/upload/poster/${play.poster}">
        <img
		src="${pageContext.request.contextPath}/resources/upload/poster/${play.poster}" />  
      </a> 
         
	</td>
  </tr>
  </c:forEach>



</body>
</html>
