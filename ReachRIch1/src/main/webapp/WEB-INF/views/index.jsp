<%@page import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="org.springframework.web.servlet.mvc.support.RedirectAttributes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*, java.util.*" %>
<%

	String url = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=101&sid2=259";
	Document doc = Jsoup.connect(url).get();
	Elements e1 = doc.getElementsByAttributeValue("class", "type06_headline");
	
	String url2 = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%82%98%EC%8A%A4%EB%8B%A5%EC%A7%80%EC%88%98&oquery=%EB%82%98%EC%8A%A4%EB%8B%A5&tqi=itaJxsprvmsssFXu6qGssssstwG-410550";
	Document doc2 = Jsoup.connect(url2).get();
	Elements e12 = doc2.getElementsByAttributeValue("class", "_stock_chart");
    Elements e123 = e12.select("img_chart_area");
	
    String url23 = "https://finance.naver.com/item/main.nhn?code=005930";
	Document doc23 = Jsoup.connect(url23).get();
	Elements ri = doc23.getElementsByAttributeValue("class", "rate_info");
    Elements today = ri.select("img_chart_area");
 	//ArrayList<Elements> list = e12.select("img_chart_area");
 	//Elements stock = RequestContextUtils.getInputFlashMap("stock");
 	String cost = request.getParameter("entity");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//location.href="/index.do";
</script>
</head>
<body>
 <h2></h2>
 <h2><%= cost %></h2>
 <h2><%= e12 %></h2>
 <h2><span id="span">asd</span></h2>
 <font id="chk">aa</font>
 <h2><font style="width: 10px; height: 10px;"> <%= ri %> </font></h2>
 <img id="img_chart_area" src="https://ssl.pstatic.net/imgfinance/chart/item/area/day/005930.png?sidcode=1678783237120" width="700" height="289" alt="이미지 차트" onerror="this.src='https://ssl.pstatic.net/imgstock/chart3/world2008/error_700x289.png'">
 <h2><input type="text" id = "stockname"> </h2>
 <p id = "stockCost">a-a</p>
 <a href="Stock/news">바로가기</a>
 <a href="Stock/board_list">리스트가기</a>
 <a href="Stock/login">로그인가기</a>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
setInterval(function() {
	  $.ajax({
	    url: "/Ajax",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#span").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
</script>
</body>
</html>