<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a href="/Reachrich/reachrich_login"><img src="img/login1.gif"></a>
	</label>
	<div class="page">
		<header class="header">
			<h1 class="website-title">ReachRich</h1>
			<form class="search-form"><!-- 서치 지정하는 곳 -->
				<input type="search">
				<input type="submit" value="찾기">
			</form>
		</header>

		<ul class="menu">
			<li class="menu-item">
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
				<a href="Reachrich/reachrich_board" class="menu-link">주식종목게시판</a>
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
				<ul class="submenu">
         			<li><a href="#">submenu01</a></li>
          			<li><a href="#">submenu02</a></li>
          			<li><a href="#">submenu03</a></li>
          			<li><a href="#">submenu04</a></li>
          			<li><a href="#">submenu05</a></li>
        		</ul>
			</li>
		</ul>
		</div>
</body>
</html>