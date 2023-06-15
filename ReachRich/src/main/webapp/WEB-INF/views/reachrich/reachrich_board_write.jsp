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
</head>
<script>
	function send(){
		alert("등록시도");
		
		board.submit();
	}
</script>
<body>
<%@ include file="../include/topmenu.jsp" %>
<section class="primary">
<table border="0" width="800" >
 <tr>
   <td bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 -->

   </td>

   <td width="80%" valign="top">&nbsp;<br>
     <img src="/img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>반갑습니다</b></font>
     <font size="2"> - 글쓰기</font><p>
     <img src="/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     <form name="board" method="post" action="reachrich_board_write" enctype="multipart/form-data">

	  <table border="0">
       <tr>
         <td width="5%" align="right"><img src="/img/bullet-02.gif"></td>
         <td width="15%"><font size="2" face="돋움">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="user_name" readonly="readonly" value="<%= user.getUser_name() %>"></td>
       </tr>
       <tr>
       
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="subject" ></td>
       </tr>
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">섹터</font></td>
         <td>
         	<select name="stock_sector">
 				<option value="">주식의 종류를 말합니다
 				<option value="정보기술">정보기술        
 				<option value="헬스케어">헬스케어        
 				<option value="임의소비재">임의소비재        
 				<option value="금융">금융        
 				<option value="커뮤니케이션서비스">커뮤니케이션서비스        
 				<option value="산업재">산업재        
 				<option value="필수소비재">필수소비재        
 				<option value="에너지">에너지        
 				<option value="소재">소재        
 				<option value="유틸리티">유틸리티       
 				<option value="부동산">부동산        
         	</select>
         </td>
       </tr>
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">종목명</font></td>
         <td><input type="text" size="60" name="stock_name" ></td>
       </tr>
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">종목번호</font></td>
         <td><input type="text" size="60" name="stock_number" ></td>
       </tr>
       <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="content" cols="60"></textarea></td>
       </tr>
	   <tr>
         <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">이미지/사진</font></td>
         <td><font size="2" face="돋움">


				<input type="file" multiple="multiple" id="imageFiles" name="imageFiles" multiple="multiple"/>

				<!-- <input type="file" multiple="multiple" id="attachFile" name="attachFile" multiple="multiple"/> -->

				
         	 </font>
         </td>
        </tr>

		<tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td>
             <a href="javascript:send()"><img src="/img/save.gif" border=0></a>&nbsp;&nbsp;&nbsp;
             <a href="javascript:history.back()"><img src="/img/cancle.gif" border=0></a>
          </td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
  </table>
 </section>
<%@ include file="../include/rightbanner.jsp" %>
<%@ include file="../include/leftbanner.jsp" %>
<%@ include file="../include/footer.jsp" %>
</body>
</html>