<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.ReachRich.domain.*" %>
<%

%>
<html>
<head><title>게시판 읽기</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>
<script>
	function change_list(){
		alert("리스트 변경");
		user.submit();
	}
	function change_list2(){
		alert("리스트 변경");
		user2.submit();
	}
	function send(u){
		alert("준비");
		if(u == null){
			alert("로그인이 필요합니다.");
			location.href="login";
		}else{
			location.href="board_write";
		}
	}
</script>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table border="0" width="800">
  <tr>
    <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">

	<!-- 다음에 추가할 부분 --></td>

	<td width="80%" valign="top">	
		<br>
    <table border="0" cellspacing="1" width="100%" align="center">
      <tr>
        <td colspan="7" align="center" valign="center" height="20">
        <font size="4" face="돋움" color="blue">
        <img src="/img/bullet-01.gif"> <b>자 유 게 시 판</b></font></td></tr>
	<form method="post" name="user" action="board_list">
		<input type="hidden" name="subkey" value="">
		<select name="key" onchange="change_list()">
			<option value="">전체
			<option value="정보" <c:if test="${key eq '정보'}"> selected </c:if>>정보
			<option value="금융" <c:if test="${key eq '금융'}"> selected </c:if>>금융
			<option value="커뮤" <c:if test="${key eq '커뮤'}"> selected </c:if>>커뮤
			<option value="w" <c:if test="${key eq 'w'}"> selected </c:if>>w
		</select>
	</form>
	<c:if test="${key eq '정보'}">
		<form method="post" name="user2" action="board_list">
			<input type="hidden" name="key" value="${key}">
			<select name="subkey" onchange="change_list2()">
				<option value="">이름
				<option value="삼성" <c:if test="${subkey eq '삼성'}"> selected </c:if>>삼성
				<option value="LG" <c:if test="${subkey eq 'LG'}"> selected </c:if>>LG
				<option value="fd" <c:if test="${subkey eq 'fd'}"> selected </c:if>>fd
				<option value="213" <c:if test="${subkey eq '213'}"> selected </c:if>>213
			</select>
		</form>
	</c:if>
	<c:if test="${key eq '금융'}">
		<form method="post" name="user2" action="board_list">
			<input type="hidden" name="key" value="${key}">
			<select name="subkey" onchange="change_list2()">
				<option value="">서브 이메일
				<option value="하나" <c:if test="${subkey eq '1234'}"> selected </c:if>>1234
				<option value="농협" <c:if test="${subkey eq '45'}"> selected </c:if>>45
				<option value="fd" <c:if test="${subkey eq 'fd'}"> selected </c:if>>fd
				<option value="213" <c:if test="${subkey eq '213'}"> selected </c:if>>213
			</select>
		</form>
	</c:if>
	<c:if test="${key eq '커뮤'}">
		<form method="post" name="user2" action="board_list">
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

        <td colspan="5" align="right" valign="middle" height="20">
		<font size="2" face="고딕">전체 : <b>${totcount}</b>건 - 1/ 2 Pages</font></td></tr>
 	   <tr bgcolor="e3e9ff">
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">번 호</font></td>
 	      <td width="50%" align="center" height="20"><font face="돋움" size="2">제 목</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">글쓴이</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">작성일</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">조회수</font></td>
 	   </tr>
	<c:forEach var="board" items="${list}">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" height="25">
			<font face="돋움" size="2" color="#000000">${board.stock_idx}</font></td>
			<td align="left" height="20">&nbsp;
				<font face="돋움" size="2" color="#000000">
				<a class="list" href="board_hits?stock_idx=${board.stock_idx}">${board.subject}(${board.maxcnt})</a></td>
					<td align="center" height="20"><font face="돋움" size="2">
					<a class="list" href="mailto:ein1027@nate.com">${board.user_name}</a></font></td>
				<td align="center" height="20"><font face="돋움" size="2">${board.regdate}</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${board.readcnt}</font></td>
		</tr>
	</c:forEach>
	<c:if test="${empty list}">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" height="25" colspan="5">
			<font face="돋움" size="2" color="#000000">등록된 글이 없습니다</font></td>
	</c:if>	


	 <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">[1][2][3]</div>
			  </td>
			 </tr>
		</table>

	<table width="600">
		<tr>
			<td width="25%"> &nbsp;</td>
			<td width="50%" align="center">
				<table>
					<form>	
					<!-- 검색어를 이용하여 글제목, 작성자, 글내용 중에 하나를 입력 받아 처리하기 위한 부분 -->
						<tr>
							<td>
								<select name="type">
									<option value="subject" <c:if test="${type.equals('subject')}"> selected </c:if>>글제목</option>
									<option value="name" <c:if test="${type.equals('name')}"> selected </c:if>>작성자</option>
									<option value="contents" <c:if test="${type.equals('contents')}"> selected </c:if>>글내용</option>
								</select>
							</td>
							<td> <input type="text" size=20 name="key" value="${key}"></td>
							<td> <a href="javascript:Find()"><img src="/img/search2.gif" border="0"></a></td>
						</tr>
					</form>
				</table>
			</td>
			<td width="25%" align="right">
			<!-- 글쓰기 -->
			<a href="javascript:send(${user_id})"><img src="/img/write.gif" border="0"></a>
			</td>
		</tr>
	</table>
</body>
</html>

