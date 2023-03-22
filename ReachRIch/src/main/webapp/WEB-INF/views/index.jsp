<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*" %>
<%

	String url = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=101&sid2=259";
	Document doc = Jsoup.connect(url).get();
	Elements e1 = doc.getElementsByAttributeValue("class", "type06_headline");
	Element e2 = e1.get(0);
	Elements e3 = e2.select("span");
	System.out.print(e3.get(0).text());
	
	String url2 = "https://finance.naver.com/item/main.naver?code=005930";
	Document doc2 = Jsoup.connect(url2).get();
	Elements e12 = doc2.getElementsByAttributeValue("class", "chart");
	Element e22 = e12.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2><%= e1 %></h2>
 <h2><%= e12 %></h2>
</body>
</html>