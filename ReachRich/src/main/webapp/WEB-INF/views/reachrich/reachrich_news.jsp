<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*" %>

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
<body>
<%@ include file="../include/topmenu.jsp" %>
		<!-- <div class="content-container"> -->
		<section class="primary">
			<ul class="card-list">
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						뉴스페이지
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/item/area/day/005930.png?sidcode=1678783237120)" >
						
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
<%@ include file="../include/rightbanner.jsp" %>
<%@ include file="../include/leftbanner.jsp" %>
<%@ include file="../include/footer.jsp" %>
</body>
</html>