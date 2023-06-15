<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,org.jsoup.*,org.jsoup.nodes.*,org.jsoup.select.*" %>
<%
	String url2 = "https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=101";
	Document doc2 = Jsoup.connect(url2).get();
	Elements elm = doc2.getElementsByAttributeValue("class", "cluster_item");
	Elements elm0 = elm.eq(0);
	Elements elm1 = elm.eq(1);
	Elements elm2 = elm.eq(2);
	Elements elm3 = elm.eq(3);
	Elements elm4 = elm.eq(4);
	Elements elm5 = elm.eq(5);
	Elements elmHead = doc2.getElementsByAttributeValue("class", "cluster_head_topic");
	String elmHead0 = elmHead.eq(0).text();
	String elmHead1 = elmHead.eq(1).text();
	String elmHead2 = elmHead.eq(2).text();
	String elmHead3 = elmHead.eq(3).text();
	String elmHead4 = elmHead.eq(4).text();
	String elmHead5 = elmHead.eq(5).text();
	//Elements elmHead5 = elmHead.eq(5);
%>

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
					<div class="card-desc-news">
						<%= elmHead0 %>
					</div>
					<figure class="">
						<%= elm0 %>
					</figure>
				</li>
				<li class="card-item">
					<div class="card-desc-news">
						<%= elmHead1 %>
					</div>
					<figure class="">
						<%= elm1 %>
					</figure>
				</li>
				<li class="card-item">
					<div class="card-desc-news">
						<%= elmHead2 %>
					</div>
					<figure class="">
						<%= elm2 %>
					</figure>
				</li>
				<li class="card-item">
					<div class="card-desc-news">
						<%= elmHead3 %>
					</div>
					<figure class="">
						<%= elm3 %>
					</figure>
				</li>
				<li class="card-item">
					<div class="card-desc-news">
						<%= elmHead4 %>
					</div>
					<figure class="">
						<%= elm4 %>
					</figure>
				</li>
				<li class="card-item">
					<div class="card-desc-news">
						<%= elmHead5 %>
					</div>
					<figure class="">
						<%= elm5 %>
					</figure>
				</li>
				
			</ul>
		</section>
<%@ include file="../include/rightbanner.jsp" %>
<%@ include file="../include/leftbanner.jsp" %>
<%@ include file="../include/footer.jsp" %>
</body>
</html>