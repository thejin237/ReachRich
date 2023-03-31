<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<input type="checkbox" id="modal-switch">
	<label for="modal-switch">
		<span>모달 열고 닫기</span>
	</label>
	
	<div class="page">
		<header class="header">
			<h1 class="website-title">Reach @ Rich</h1>
			<form class="search-form">
				<input type="search">
				<input type="submit" value="찾기">
			</form>
		</header>

		<ul class="menu">
			<li class="menu-item">
				<a href="#" class="menu-link">Home</a>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">About</a>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">Product</a>
			</li>
			<li class="menu-item">
				<a href="#" class="menu-link">Contact</a>
			</li>
		</ul>

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
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						메인2가 들어갑니다. 코스피자리
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/japan.gif)">
						<img src="img/japan.gif" alt="일분이">
					</figure>
					<div class="card-desc">
						메인3이 들어갑니다. 뉴스베너
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
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						메인6이 들어갑니다.
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(img/ilbuni.png)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						메인7.여백 여유 페이지 
					</div>
				</li>
			</ul>
		</section>

		<aside class="secondary secondary-a">
			<ul class="info-list">
				<li class="info-list-item">
					광고가 들어갈 자리
				</li>
			</ul>
			<ul class="user-list friend-list">
				<li class="user-item friend-item">
					<figure class="user-photo" style="background-image: url(img/ilbuni.png);"></figure>
					<p class="user-name">
						광고?
					</p>
				</li>
			</ul>
		</aside>

		<aside class="secondary secondary-b">
			<ul class="user-list message-list">
				<li class="user-item message-item">
					<figure class="user-photo" style="background-image: url(img/ilbuni.png);"></figure>
					<p class="message-content">
						이쪽도 광고가 들어가긴 할건데 필요하면 다른 리스트로 사용 가능
					</p>
				</li>
			</ul>
		</aside>
		<!-- </div> -->

		<footer class="footer">
			여기는 footer 입니다.Lorem ipsum dolor sit amet consectetur.
		</footer>

	</div>
	<div class="modal">
		<div class="dialog">
			모달이 띄워집니다 코드 확인하려면 인텍스 161 확인
			<input type="button" value="닫기" onclick="#">
		</div>
	</div>
</body>
</html>