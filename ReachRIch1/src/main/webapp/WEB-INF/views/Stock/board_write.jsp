<%@ page contentType="text/html; charset=UTF-8" %>

<html>
   <head><title>게시판 작성</title>
    <link rel="stylesheet" type="text/css" href="/stylesheet.css">
<script>
	function send(){
		alert("등록시도");
		board.submit();
	}
</script>
</head>
 <body topmargin="0" leftmargin="0">
 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 -->

   </td>

   <td width="80%" valign="top">&nbsp;<br>
     <img src="/img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>반갑습니다</b></font>
     <font size="2"> - 글쓰기</font><p>
     <img src="/img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="/img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     <form name="board" method="post" action="board_write" enctype="multipart/form-data">

	  <table border="0">
       <tr>
         <td width="5%" align="right"><img src="/img/bullet-02.gif"></td>
         <td width="15%"><font size="2" face="돋움">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="user_name"></td>
       </tr>
       <tr>
       
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="stock_name" ></td>
       </tr>
	   <tr>
         <td align="right"><img src="/img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">섹터</font></td>
         <td><input type="text" size="60" name="stock_name" ></td>
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
          <td><input type="file" size="10" name="image" ><font size="2" face="돋움"></font></td>
        </tr>
        <tr></tr>
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
  </body>
  </html>
