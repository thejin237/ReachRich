<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String newUL = "https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=101";
	Document newsDC = Jsoup.connect(newUL).get();
	Elements news = newsDC.getElementsByAttributeValue("class", "section_list_ranking_press _rankingList");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/deflault.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/modal_card.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
</head>
<body>
	<aside class="secondary secondary-b" style="width: 90%;">
		<ul class="user-list message-list">
			<li class="user-item message-item">
				<figure class="user-photo"
					style="background-image: url(/img/ilbuni.png);"></figure>
				<p class="message-content">이쪽도 광고가 들어가긴 할건데 필요하면 다른 리스트로 사용 가능
				 <h2><%= news %>null</h2>
				</p>
			</li>
		</ul>
	</aside>
</body>
</html>