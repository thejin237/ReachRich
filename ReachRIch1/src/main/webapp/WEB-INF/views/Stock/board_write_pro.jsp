<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${row ==1 }">
		<script>
			alert("등록되었습니다");
			location.href="board_list";
		</script>
	</c:if>
	<c:if test="${row !=1 }">
		<script>
			alert("실패");
			history.back();
		</script>
	</c:if>
</body>
</html>