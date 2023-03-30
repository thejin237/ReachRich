<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	System.out.print(request.getRequestURL().substring(request.getRequestURI().length(), request.getRequestURL().length()-4));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>게시판 내용 보기</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
td.title {
	padding: 4px;
	background-color: #e3e9ff
}

td.content {
	padding: 10px;
	line-height: 1.6em;
	text-align: justify;
}

a.list {
	text-decoration: none;
	color: black;
	font-size: 10pt;
}
</style>

</head>
<body topmargin="0" leftmargin="0">
	<table border="0" width="800">
		<tr>
			<td width="20%" height="500" bgcolor="#ecf1ef" valign="top">
				<!--  다음에 추가할 부분 -->

			</td>
			<td width="80%" valign="top">&nbsp;<br>
				<table border="0" width="90%" align="center">
					<tr>
						<td colspan="2"><img src="/img/bullet-01.gif"> <font
							color="blue" size="3">자 유 게 시 판</font><font size="2"> -
								글읽기</font></td>
					</tr>
				</table>
				<p>
				<table border="0" width="90%" align="center" cellspacing="0"
					style="border-width: 1px; border-color: #0066cc; border-style: outset;">
					<tr bgcolor="e3e9ff">
						<td class="title"><img src="/img/bullet-04.gif"> <font
							size="2" face="돋움">${board.subject}</font></td>
					</tr>
					<tr>
						<td class="content">
							<p align="right">
								<font size="2" face="돋움"> <a class="list"
									href="mailto:ein1027@nate.com">${board.stock_name}</a> / <font
									size="2" face="돋움">${board.regdate} / ${board.readcnt}번
										읽음</font>
									<p>${board.content}
									<p>
										<!--contents의 내용을 <BR>태그로 처리-->
						</td>
					</tr>
					<form name="sug" method="post" action="Sug">
						<tr>
							<td align="center">
								<input type="hidden" value="${board.stock_idx}" name="stock_idx">
								<input type="button" value="추천(${board.suggestion})" onclick="suggestion()">
							</td>
						</tr>
					</form>
				</table>

				<!-- 댓글쓰는 부분 -->
				<form name="frm" method="post" action="board_view">
					<table>
						<tr>
							<td>
								<input type="hidden" name="stock_idx" value="${board.stock_idx}">
								<input type="hidden" name="user_id" value="${user_id}">
								<input type="hidden" name="com_idx" value="${cnt}">
								<textarea name="com_content" cols="30"></textarea>
								<input type="button" value="등록" onclick="send()">
							</td>
						</tr>
					</table>
				</form> 
				<form name="com_com" method="post" action="com_comment">
				<!-- 댓글 리스트 -->
				<c:if test="${!empty list}">
					<c:forEach var="dto" items="${list}">
						<br>${dto.com_idx} | ${dto.user_id} | ${dto.com_content} | ${dto.regdate}<br>
						<input type="button" id="re_c" value="답글" onclick="show('${dto.com_idx}')">
						<div id="${dto.com_idx}" style="visibility: hidden;">
							<input type="hidden" name="com_idx" value="${dto.com_idx}">
							<input type="hidden" name="stock_idx" value="${board.stock_idx}">
							<input type="text" name="com_com_content">
							<input type="button" value="등록" onclick="com_comment()"> 
						</div>
					</c:forEach>								
				</c:if>
				</form>
				<!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
				<p align="center">
					<font size="2"> <!-- 새글쓰기 --> <a href="board_write"> <img
							src="/img/write.jpg" border="0"></a>&nbsp;&nbsp; <!-- 답글쓰기 -->
						<a href=""> <img src="/img/reply.gif" border="0"></a>&nbsp;&nbsp;
						<!-- 수정하기 --> <a href="board_modify?stock_idx=${board.stock_idx}">
							<img src="/img/edit.gif" border="0">
					</a>&nbsp;&nbsp; <!-- 삭제하기 --> <a
						href="board_delete?stock_idx=${board.stock_idx}"><img
							src="/img/del.gif" border="0"></a>&nbsp;&nbsp; <!-- 목록보기 --> <a
						href="board_list"><img src="/img/list-2.gif" border="0"></a>&nbsp;&nbsp;
					</font></td>
		</tr>
	</table>
<script type="text/javascript">
	function send() {
		if(frm.com_content.value==""){
			alert("내용을 적어주세요");
			frm.com_content.foucs();
			return;
		}
		frm.submit();
	}
	function suggestion(){
		alert(sug.stock_idx.value);
		sug.submit();
	}
	
	function show(a) {
		alert("대댓글 기동");
		var aa = document.getElementById(a);
		if(aa.style.visibility == 'visible') {
			aa.style.visibility = 'hidden';
		}else {
			aa.style.visibility = 'visible';
		}
	}
	function com_comment() {
		alert("대댓글 등록 시도");
		com_com.submit();
	}
</script>
</body>
</html>

