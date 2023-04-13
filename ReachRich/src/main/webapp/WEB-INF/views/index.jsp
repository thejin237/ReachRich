<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*" %>

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
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Index</title>
<link rel="stylesheet" type="text/css" href="css/deflault.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/modal_card.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
</head>
<body>
<%@ include file="include/topmenu.jsp" %>
		<!-- <div class="content-container"> -->
		<section class="primary">
			<ul class="card-list">
				<li class="card-item">
					<figure class="card-image">
						<img src="https://ssl.pstatic.net/imgfinance/chart/main/KOSPI.png?sidcode=1680766740572" alt="코스피지수 상세보기">
					<div class="card-desc">
						코스피 지수
					</div>
					</figure>
				</li>
				<li class="card-item">
					<figure class="card-image">
						<img src="https://ssl.pstatic.net/imgfinance/chart/main/KOSDAQ.png?sidcode=1680766740574" alt="코스닥지수 상세보기">
					<div class="card-desc">
						코스닥 지수
					</div>
					</figure>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/japan.gif)">
					</figure>
					<div class="card-desc">
						삼성전자
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
					</figure>
					<div class="card-desc">
						메인4가 들어갑니다. 게시판 자리
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
					</figure>
					<div class="card-desc">
						메인5가 들어갑니다. 추천종목/핫 종목
					</div>
				</li>
			</ul>
		</section>
<%@ include file="include/rightbanner.jsp" %>
<%@ include file="include/leftbanner.jsp" %>
<%@ include file="include/footer.jsp" %>
</body>
</html>