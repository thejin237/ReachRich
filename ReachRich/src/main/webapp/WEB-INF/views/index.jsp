<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*" %>
<%
   String url = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid1=101&sid2=259";
   Document doc = Jsoup.connect(url).get();
   Elements e1 = doc.getElementsByAttributeValue("class", "type06_headline");
   Element e2 = e1.get(0);
   Elements e3 = e2.select("span");
   //System.out.print(e3.get(0).text());
   
   String url2 = "https://www.google.com/search?q=%EB%82%98%EC%8A%A4%EB%8B%A5&oq=%EB%82%98%EC%8A%A4%EB%8B%A5&aqs=chrome.0.0i131i355i433i512j46i131i199i433i465i512j0i131i433i512l4j0i512j0i131i433i512j0i512l2.1619j0j7&sourceid=chrome&ie=UTF-8";
   Document doc2 = Jsoup.connect(url2).get();
   Elements e12 = doc2.getElementsByAttributeValue("class", "uch-psvg");
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
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						메인1이 들어갑니다. 환율자리
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/item/area/day/005930.png?sidcode=1678783237120)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						삼성전자
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/japan.gif)">
						<img src="img/japan.gif" alt="일분이">
					</figure>
					<div class="card-desc">
						삼성전자
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						메인4가 들어갑니다. 게시판 자리
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
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