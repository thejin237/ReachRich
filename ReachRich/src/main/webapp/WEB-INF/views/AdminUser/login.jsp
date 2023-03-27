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
	<form method="post" name="log" action="login">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="user_pass"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="로그인" onclick="login()">
				</th>				
			</tr>
		</table>
	</form>
</body>
<c:choose>
	<c:when test="${row == 0}">
		<script>
			alert("아이디가 존재하지 않습니다");
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("비밀번호가 맞지 않습니다");
		</script>
	</c:otherwise>
</c:choose>
<script>
	function login(){
		if(log.user_id.value == ""){
			alert("아이디를 작성해주세요");
			log.user_id.focus();
			return;
		}
		if(log.user_pass.value == ""){
			alert("비밀번호를 작성해주세요");
			log.user_pass.focus();
			return;
		}
		log.submit();
	}
</script>
</html>