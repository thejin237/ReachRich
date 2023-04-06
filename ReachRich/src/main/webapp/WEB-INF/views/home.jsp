<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	div {
  background: yellow;
  width: 200px;
  height: 50px;
  margin: 20px;
  padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${user_id}님 환영합니다!</h1>
	<input type="button" id="re_c" value="답글" onclick="show('re')">
	<div><span style="background-color:teal; font-style:italic; width:50px;">DIV SPAN</span></div>
	<div id="re" style="visibility:hidden;"><input type="text" value="답글열림"></div>		
</body>
<script>
	
	function show(a){
		alert("답글 여닫기");
		var aa = document.getElementById(a);
		if(aa.style.visibility == 'visible') {
		  aa.style.visibility = 'hidden';
		} else {
		  aa.style.visibility = 'visible';
		}  
	}
</script>
</html>