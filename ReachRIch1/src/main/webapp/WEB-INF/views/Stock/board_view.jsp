<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	System.out.print(request.getRequestURL().substring(request.getRequestURI().length(), request.getRequestURL().length()-4));
	
%>
<%!
String extractFilename(Part part) {
    final String partHeader = part.getHeader("C:/Users/alfmg/Downloads/upload");
    for (String content : part.getHeader("/images/{filename}").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;   
}  
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

#a1 {
	/*
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
*/
	width: 100px;
	height: 100px;
	background-image: url();
	background-repeat: no-repeat;
	background-size: cover;
	image-rendering: optimizeSpeed;
	image-rendering: -moz-crisp-edges;
	image-rendering: -o-crisp-edges;
	image-rendering: -webkit-optimize-contrast;
	image-rendering: pixelated;
	image-rendering: optimize-contrast;
	-ms-interpolation-mode: nearest-neighbor;
	image-rendering: auto;
}

.popup-window {
	position: relative;
	display: none;
	border: 1px solid rgba(0, 0, 0, 0);
}

.popup-window.is-active {
	display: block;
}

.popup-window__close {
	position: absolute;
	right: 1rem;
	top: 1rem;
	width: 1rem;
	height: 1rem;
	line-height: 1rem;
	text-align: center;
	cursor: pointer;
	user-select: none;
	padding: 0.5rem;
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
								글읽기</font><input type="button" value="로그아웃" onclick="logout()"> </td>
								
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
										읽음</font><br>
					<text>첨부파일(클릭시 다운) : </text>
						<a th:if="${board.attachFile}" th:href="|C:/Users/alfmg/git/ReachRich/ReachRIch1/files/attach/${board.stock_idx}|" th:text="${board.attachFile.uploadFilename}" />
						<br/><br/>
					<text>첨부된 이미지 파일들</text>
						<br/>
						<img th:each="imageFile : ${board.imageFiles}" th:src="|images/${imageFile.storeFilename}|" width="100px" height="100px" style="border-color: black; border-style: solid; border-width: thin;"/>
						<br/><br/>									
					<img name="${board.imageName}" alt="${board.imageName}" src="/image/${board.imageName}">
									<p>${board.content}<p>
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
					</font>

				<!-- 댓글쓰는 부분 -->
				<div align="center">
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
				</div>
				<!-- 댓글 리스트 -->
				<c:if test="${!empty list}">
				<form name="com_com" method="post" action="com_comment">
						<!-- 대댓글 등록 -->
							<input type="hidden" name="com_idx" id="com_idx" readonly="readonly" size="3" >
						<div id="re" style="visibility: hidden;">
							<input type="hidden" name="stock_idx" value="${board.stock_idx}">
							<input type="hidden" readonly="readonly" name="user_idx" value="${user_id}" size="3">
							<input type="hidden" id="tes" name="com_com_content">


						</div>
						<input type="hidden" name="user_id" value="${user_id}">
					<c:forEach var="dto" items="${list}">
						<br>${dto.com_idx} | ${dto.user_id} | ${dto.com_content} | ${dto.regdate}
							<!--<input type="button" name="cm" value="${dto.com_idx}" onclick="ch('${dto.com_idx}')">-->
						<input type="button" id="re_c" value="답글" onclick="show('${dto.com_idx}'),ch('${dto.com_idx}')">
						<br>
												<!-- 대댓글 등록 -->
						<div id="${dto.com_idx}" style="visibility: hidden;">
							<input type="text" name="com_idx1" id = "ci${dto.com_idx}" readonly="readonly" size="3" >
							<input type="hidden" name="ci" value="${com_idx}" size="3">
							<input type="hidden" name="stock_idx" value="${board.stock_idx}">
							<input type="text" readonly="readonly" name="user_idx" value="${user_id}" size="3">
							<input type="text" id="text01${dto.com_idx}"  name="text01${dto.com_idx}">
							<!-- 대댓글 등록버튼 -->
							<input type="button" value="등록" onclick="com_comment('${dto.com_idx}','${dto.stock_idx}')"> 
						</div>




						<!-- 대댓글 -->
						<c:if test="${!empty com_comList}">
							<c:forEach var="c_dto" items="${com_comList}">
								<c:if test="${ dto.com_idx eq c_dto.com_idx }">
									<br>ㄴ${c_dto.com_idx} - ${c_dto.com_com_idx} | ${c_dto.user_id} | ${c_dto.com_com_content} | ${c_dto.regdate}<br>
								</c:if>
							</c:forEach>		
						</c:if>		
					</c:forEach>	
												
				</form>
				
				</c:if>

		</tr>
	</table>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	x = document.getElementById("tes");
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
		com_com.com_com_content.focus();
		//alert("대댓글 = " + a);
	}
	function ch(i) {
		alert("IDX : "+i);
		com_com.com_idx.value=i;
		$('#com_idx').val(i);
		$('#ci'+i).val(i);
		document.getElementById("ci"+i).innerHTML = i;
	}
	function com_comment(ci,si) {
		alert("대댓글 등록 시도");
		//alert(tes);
		//var value = $('#text01'+ci).val();
		var value = $('#text01'+ci).val();
		alert(ci);
		//alert("택스트"+document.com_com.text01[ci].value);
		alert("택스트"+value);
		if(frm.user_id.value==""){
			alert("댓글은 로그인이 필요합니다");
			return;
		}
		//alert(com_com.com_com_con.value);
		//alert(ci,si,cmcm);
		//document.forms[i].submit();
		//var ce = ci;
		//var com_list = [];
		//	for{int i=0; i<list.}
	$.ajax({
		url : "com_comment",
		type : "post",
		datatype : 'JSON',
		data: {
			//com_idx: "${com_idx}",
			stock_idx: "${board.stock_idx}",
			user_id: "${user_id}",
	 		com_content: $('#text01'+ci).val()

		},
		success : function(data) {
			alert("성공");
		},
	    error:function(error){
	    	//alert(" error = " + JSON.stringify(error)); // 실패 시 처리
	    }
	});

		com_com.submit();
		}
	function logout(){
		location.href="logout";
	}
</script>
</body>
</html>

