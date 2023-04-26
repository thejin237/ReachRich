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
					<figure class="card-image" style="background-image: url()">
						<span id="jpy">null</span><br>
						<span id="usd">null</span><br>
						<span id="cny">null</span><br>
						<span id="gbp">null</span><br>
						<span id="eur">null</span><br>
						<span id="chf">null</span><br>
						<span id="hkd">null</span><br>
					</figure>
					<div class="card-desc">
						메인1이 들어갑니다. 환율자리
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url()" >
						<span id="aud">null</span><br>
						<span id="sgd">null</span><br>
						<span id="thb">null</span><br>
						<span id="inr">null</span><br>
						<span id="rub">null</span><br>
						<span id="cad">null</span><br>
						
					</figure>
					<div class="card-desc">
						<div id="news">null</div><br>
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/mobile/day/KOSPI_end.png?1682398860000)">
						<img src="img/japan.gif" alt="일분이">
					</figure>
					<div class="card-desc">
						코스피 <span id="kosp">null</span>
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/mobile/day/KOSDAQ_end.png?1682402820000)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						코스닥 <span id="kosdack">null</span>
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/mobile/world/day/.IXIC_end.png?1682324159000)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						나스닥 <span id="nasdack">null</span>
					</div>
				</li>
				<li class="card-item">
					<figure class="card-image" style="background-image: url(https://ssl.pstatic.net/imgfinance/chart/mobile/world/day/.N225_end.png?1682401623000)">
						<img src="img/ilbuni.png" alt="일분이">
					</figure>
					<div class="card-desc">
						니케이 <span id="nk">null</span>
					</div>
				</li>
			</ul>
		</section>
<%@ include file="include/rightbanner.jsp" %>
<%@ include file="include/leftbanner.jsp" %>
<%@ include file="include/footer.jsp" %>
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
setInterval(function() {
	  $.ajax({
	    url: "/Ajax1",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#kosp").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
setInterval(function() {
	  $.ajax({
	    url: "/kosDack",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#kosdack").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
setInterval(function() {
	  $.ajax({
	    url: "/NK",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#nk").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
setInterval(function() {
	  $.ajax({
	    url: "/NasDack",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#nasdack").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)

	setInterval(function() {
	  $.ajax({
	    url: "/JPY",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#jpy").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/USD",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#usd").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/CNY",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#cny").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/AUD",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#aud").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/SGD",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#sgd").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/GBP",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#gbp").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/EUR",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#eur").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/CHF",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#chf").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	setInterval(function() {
	  $.ajax({
	    url: "/HKD",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#hkd").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/THB",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#thb").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/INR",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#inr").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/RUB",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#rub").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)
	
	setInterval(function() {
	  $.ajax({
	    url: "/CAD",
	    type: "get",
	    contentType:"JSON",
	    dataType: "text",
	    success: function(data) {
	    	//alert("성공?" + data);
	      $("#cad").html(data);
	    },
	    error: function(error) {   
	      alert("실패: " + JSON.stringify(error));
	    }
	  });
	}, 5000); // 5초마다 호출 (1000ms = 1초)

	setInterval(function(){
	  $.ajax({
		    url: "/News",
		    type: "get",
		    contentType:"JSON",
		    dataType: "text",
		    success: function(data) {
		    	//alert("성공?" + data);
		      $("#news").html(data);
		    },
		    error: function(error) {   
		      alert("실패: " + JSON.stringify(error));
		    }
		  });
		}		
	}, 5000);
	
function refreshImageChart() {
	  var imgChartArea = document.getElementById("img_chart_area"); // img 요소를 가져옴
	  imgChartArea.src = "https://ssl.pstatic.net/imgfinance/chart/item/area/day/005930.png?sidcode=" + new Date().getTime(); // src 속성을 새로운 URL로 업데이트
	}

// 5초마다 refreshImageChart 함수를 호출
setInterval(refreshImageChart, 5000);
</script>
</body>
</html>