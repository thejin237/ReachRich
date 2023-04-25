<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*, org.jsoup.*, org.jsoup.nodes.*, org.jsoup.select.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.ReachRich.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Index</title>
<link rel="stylesheet" type="text/css" href="/css/deflault.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<link rel="stylesheet" type="text/css" href="/css/modal_card.css">
<link rel="stylesheet" type="text/css" href="/css/search.css">
<link rel="stylesheet" type="text/css" href="/css/board.css">
</head>
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
		if(u == ""){
			alert("로그인이 필요합니다.");
			location.href="reachrich_login";
		}else{
			location.href="reachrich_board_write";
		}
	}
	function Find(){
		alert("검색시도");
		if(search.key.value == ""){
			alert("검색할 내용을 작성해주세요");
			search.key.focus();
			return;
		}
		search.submit();
	}
</script>
<body>
<%@ include file="../include/topmenu.jsp" %>
		<!-- <div class="content-container"> -->
		<section class="primary">
			<form method="post" name="user" action="reachrich_board_list">
		<input type="hidden" name="subkey" value="">
		<select name="key" onchange="change_list()" style="width: 100px; height: 30px;">
			<option value="">전체
			<option value="정보" <c:if test="${key eq '정보'}"> selected </c:if>>정보
			<option value="금융" <c:if test="${key eq '금융'}"> selected </c:if>>금융
			<option value="커뮤" <c:if test="${key eq '커뮤'}"> selected </c:if>>커뮤
			<option value="w" <c:if test="${key eq 'w'}"> selected </c:if>>w
		</select>
	</form>
	<c:if test="${key eq '정보'}">
		<form method="post" name="user2" action="reachrich_board_list">
			<input type="hidden" name="key" value="${key}">
			<select name="subkey" onchange="change_list2()" style="width: 100px; height: 30px;">
				<option value="">이름
				<option value="삼성" <c:if test="${subkey eq '삼성'}"> selected </c:if>>삼성
				<option value="LG" <c:if test="${subkey eq 'LG'}"> selected </c:if>>LG
				<option value="fd" <c:if test="${subkey eq 'fd'}"> selected </c:if>>fd
				<option value="213" <c:if test="${subkey eq '213'}"> selected </c:if>>213
			</select>
		</form>
	</c:if>
	<c:if test="${key eq '금융'}">
		<form method="post" name="user2" action="reachrich_board_list">
			<input type="hidden" name="key" value="${key}">
			<select name="subkey" onchange="change_list2()" style="width: 100px; height: 30px;">
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
			<select name="subkey" onchange="change_list2()" style="width: 100px; height: 30px;">
				<option value="">서브 이메일
				<option value="1234" <c:if test="${subkey eq '1234'}"> selected </c:if>>1234
				<option value="45" <c:if test="${subkey eq '45'}"> selected </c:if>>45
				<option value="fd" <c:if test="${subkey eq 'fd'}"> selected </c:if>>fd
				<option value="213" <c:if test="${subkey eq '213'}"> selected </c:if>>213
			</select>
		</form>
	</c:if>

		<h2>자 유 게 시 판</h2>
      <table  style="border: 1px solid black;" align="center" width="100%">
        <thead>
        <font size="2" face="고딕">전체 : <b>${totcount}</b>건</font>
     
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>조회수</th>
          </tr>
       
        </thead>
      <tbody>
       <c:set var="Bcnt" value="${totcount}"></c:set>
	<c:forEach var="board" items="${list}">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" >
			<font color="#000000">${Bcnt}</font></td>
			<td align="left">&nbsp;
				<a class="list" href="reachrich_board_hits?stock_idx=${board.stock_idx}">${board.subject}
				<c:if test="${board.maxcnt!=0}">(${board.maxcnt})</c:if></a></td>
					<td align="center"><font face="돋움" size="2">
					<a class="list" href="mailto:ein1027@nate.com">${board.user_name}</a></font></td>
				<td align="center" ><font face="돋움" size="2">${board.regdate}</font></td>
				<td align="center" ><font face="돋움" size="2">${board.readcnt}</font></td>
		</tr>
	<c:set var="Bcnt" value="${Bcnt-1}"></c:set>
	</c:forEach>
	<c:if test="${empty list}">
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" colspan="5">
			<font face="돋움" size="2" color="#000000">등록된 글이 없습니다</font></td>
	</c:if>
        <table align="center">
         <tr>
             <td colspan="5">        
                <div align="center"><font face="돋움" size="3">[1][2][3]</font></div>
			  </td>
			 </tr>
		</table>
        </tbody>
        <tfoot>
        <table>
		<tr>
			<td width="25%"> &nbsp;</td>
			<td width="50%" align="center">
				<table>
					<form name="search" method="post" action="reachrich_board_list">	
						<tr>
							<td>
								<select name="type">
									<option value="subject" <c:if test="${type.equals('subject')}"> selected </c:if>>글제목</option>
									<option value="user_name" <c:if test="${type.equals('user_name')}"> selected </c:if>>작성자</option>
									<option value="content" <c:if test="${type.equals('content')}"> selected </c:if>>글내용</option>
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
			<a href="javascript:send('${user}')"><img src="/img/write.gif" border="0"></a>
			</td>
		</tr>
	</table>
        </tfoot>
      </table>
</section>
<%@ include file="../include/rightbanner.jsp" %>
<%@ include file="../include/leftbanner.jsp" %>
<%@ include file="../include/footer.jsp" %>
</body>
</html>