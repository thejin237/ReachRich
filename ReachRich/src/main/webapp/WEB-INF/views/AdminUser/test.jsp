<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table{border:1px solid black;}
	th,td{border:1px solid black;"}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function change_list(){
		alert("리스트 변경");
		user.submit();
	}
	function change_list2(){
		alert("리스트 변경");
		user2.submit();
	}
</script>
</head>
<body>
	<form method="post" name="user" action="test">
		<input type="hidden" name="subkey" value="">
		<select name="key" onchange="change_list()">
			<option value="">기본 키
			<option value="1" <c:if test="${key eq '1'}"> selected </c:if>>1
			<option value="a" <c:if test="${key eq 'a'}"> selected </c:if>>a
			<option value="f" <c:if test="${key eq 'f'}"> selected </c:if>>f
			<option value="w" <c:if test="${key eq 'w'}"> selected </c:if>>w
		</select>
	</form>
	<c:if test="${key ne null}">
		<form method="post" name="user2" action="test">
			<input type="hidden" name="key" value="${key}">
			<select name="subkey" onchange="change_list2()">
				<option value="">서브 이메일
				<option value="1234" <c:if test="${subkey eq '1234'}"> selected </c:if>>1234
				<option value="45" <c:if test="${subkey eq '45'}"> selected </c:if>>45
				<option value="fd" <c:if test="${subkey eq 'fd'}"> selected </c:if>>fd
				<option value="213" <c:if test="${subkey eq '213'}"> selected </c:if>>213
			</select>
		</form>
	</c:if>
	<c:choose>
		<c:when test="${list.size() != 0}">
			<table>
				<c:forEach var="x" items="${list}">
				<tr>
					<th>아이디</th>
					<td>${x.user_id}</td>
				</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h1>리스트가 비어있습니다</h1>
		</c:otherwise>
	</c:choose>
</body>
</html>