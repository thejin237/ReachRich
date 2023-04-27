<%@page import="com.ReachRich.domain.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO user = (UserDTO)session.getAttribute("user");
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
	<input type="checkbox" id="modal-switch">
	<label for="modal-switch">
		<span>모달 열고 닫기</span>
			<%if(user==null){ %>
			<a href="/reachrich/reachrich_login"><img src="/img/login1.gif"></a>
			<%}else{ %>
<<<<<<< HEAD
			<a href="/reachrich/reachrich_logout">로그아웃</a>
=======
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
			<a href="/reachrich/reachrich_profile">회원정보</a>
			<%} %>
	</label>
	<div class="page">
		<header class="header">
<<<<<<< HEAD
			<h1 class="website-title">ReachRich</h1>
=======
			<a href="/index" style="color: black;"><h1 class="website-title">ReachRich</h1></a>
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
			<form class="search-form"><!-- 서치 지정하는 곳 -->
				<input type="search">
				<input type="submit" value="찾기">
			</form>
		</header>

		<ul class="menu">
			<li class="menu-item">
<<<<<<< HEAD
				<a href="/index" class="menu-link">Home</a>
				<ul class="submenu">
         			<li><a href="#">submenu01</a></li>
          			<li><a href="#">submenu02</a></li>
          			<li><a href="#">submenu03</a></li>
          			<li><a href="#">submenu04</a></li>
          			<li><a href="#">submenu05</a></li>
        		</ul>
			</li>
			<li class="menu-item">
				<a href="/reachrich/reachrich_board_list" class="menu-link">주식종목게시판</a>
				<ul class="submenu">
         			<li><a href="#">submenu01</a></li>
          			<li><a href="#">submenu02</a></li>
          			<li><a href="#">submenu03</a></li>
          			<li><a href="#">submenu04</a></li>
          			<li><a href="#">submenu05</a></li>
        		</ul>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">Product</a>
				<ul class="submenu">
         			<li><a href="#">submenu01</a></li>
          			<li><a href="#">submenu02</a></li>
          			<li><a href="#">submenu03</a></li>
          			<li><a href="#">submenu04</a></li>
          			<li><a href="#">submenu05</a></li>
        		</ul>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">Contants</a>
=======
				<%if(user==null){ %>
				<a href="/reachrich/reachrich_login" class="menu-link">Login</a>
				<%}else{ %>
				<a href="/reachrich/reachrich_logout" class="menu-link">Logout</a>
				<%} %>
			</li>
			<li class="menu-item">
				<a href="/reachrich/reachrich_board_list" class="menu-link">주식종목게시판</a>
			</li>
			<li class="menu-item">
				<a href="/reachrich/reachrich_news" class="menu-link">News</a>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">Contants</a>
				<!--  
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
				<ul class="submenu">
         			<li><a href="#">submenu01</a></li>
          			<li><a href="#">submenu02</a></li>
          			<li><a href="#">submenu03</a></li>
          			<li><a href="#">submenu04</a></li>
          			<li><a href="#">submenu05</a></li>
<<<<<<< HEAD
        		</ul>
=======
        		</ul>-->
>>>>>>> 7aa8e1e77a8fd0a175f2d20331be999a84bc503b
			</li>
		</ul>
	
</body>
</html>