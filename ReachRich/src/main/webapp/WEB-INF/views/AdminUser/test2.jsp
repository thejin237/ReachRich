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
</head>
<body>
	<table onchange="aaa()">
		<tr>
			<th>체크박스 AJAX?</th>
			<td>
				<input type="checkbox" name="confirm" value="1">1 
				<input type="checkbox" name="confirm" value="a">a
				<input type="checkbox" name="confirm" value="f">f
				<input type="checkbox" name="confirm" value="w">w
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${list.size() != 0}">
			<form name="test" action="" method="post">
			<table>
				<tr>
					<th>리스트길이</th>
					<td>${list.size()}</td>
				</tr>
				<c:forEach var="x" items="${list}">
				<tr>
					<th>아이디</th>
					<td>${x.user_id}</td>
				</tr>
				</c:forEach>
				<tr>
					<th><input type="text" name="tes1"></th>
					<th><input type="button" id="btn1" value="테스트" onclick="recm()"></th>				
				</tr>
			</table>
			</form>
		</c:when>
		<c:otherwise>
			<h1>리스트가 비어있습니다</h1>
		</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function aaa(){
		$(function(){
			var idArray = [];
			$("input:checkbox[name='confirm']:checked").each(function(){
				idArray.push(this.value);
			});
			
			$.ajax({
				url:'test2', //서블릿(컨트롤러) 이름
				type:'post',
				data:{'idArray'=idArray},
				success:function(result){//성공시
					alert("리스트 변경" + JSON.stringify(result));
				},
				error:function(error){//실패시
					alert("error : " + error);
				}
			});	 	
		});
	}
</script>
<script>
	function recm(){
		alert("리스트" + test.tes1.value);
	}

</script>
</html>