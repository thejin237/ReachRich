<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
td.title {
	padding: 4px;
	background-color: #e3e9ff
}

td.content {
	
	padding: 10px;
	line-height: 1.6em;
	text-align: justify;
}

a.list {
	text-decoration: none;
	color: black;
	font-size: 10pt;
}

#test2 {
	width: 800px;
	height: 800px;
	display: block;
}

canvas {
	background: #fff;
	border: 1px dashed;
}

a {
	display: inline-block;
	background:;
	color: #000;

}

#a1 {
	/*
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
*/
	width: 900px;
	height: 300px;
	background-image: url();
	background-repeat: no-repeat;
	background-size: cover;
	image-rendering: optimizeSpeed;
	image-rendering: -moz-crisp-edges;
	image-rendering: -o-crisp-edges;
	image-rendering: -webkit-optimize-contrast;
	image-rendering: pixelated;
	image-rendering: optimize-contrast;
	-ms-interpolation-mode: nearest-neighbor;
	image-rendering: auto;
}

.popup-window {
	position: relative;
	display: none;
	padding: 1rem;
	border: 1px solid rgba(0, 0, 0, .12);
}

.popup-window.is-active {
	display: block;
}

.popup-window__close {
	position: absolute;
	right: 1rem;
	top: 1rem;
	width: 1rem;
	height: 1rem;
	line-height: 1rem;
	text-align: center;
	cursor: pointer;
	user-select: none;
	padding: 0.5rem;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: (footer높이);
}
</style>
<script src="/exMVC/assets/jquery-3.6.2.min.js"></script>

</head>
<body topmargin="0" leftmargin="0">
	<form action="myp?cmd=droing_pro" name="droing" method="post" id="drawing">
	<div id="wrapper">

			<div class="header">
				<table style="border: 1px;">
					<h1 style="margin: auto; background-color: #e6e6e6; padding: 10px 10px 0 0; height: 10px; padding: 10px;">그림게시판</h1></div>
				</table>	
			
			<div class="contents" style="background-color: #e6e6e6;height: 400px;">
				<div class="main" style="min-height: 340px">
					<table>
						<tbody>
<c:if test="${!empty user}">
							<tr>
								<th style="width: 20%">작가</th>
								<td><input type="text" name="name" readonly="readonly" value="${user.custname}"></td>
							</tr>
</c:if>
<c:if test="${empty user}">
							<tr>
								<th style="width: 20%">작가</th>
								<td><input type="text" name="name"></td>
							</tr>
</c:if>
							<tr>
								<th>제목</th>
								<td><input type="text" name="subject"></td>
							</tr>
<c:if test="${!empty user}">
							<tr>
								<th>이메일</th>
								<td><input type="text" name="email" value="${user.email}"></td>
							</tr>
</c:if>
<c:if test="${empty user}">
							<tr>
								<th>이메일</th>
								<td><input type="text" name="email"></td>
							</tr>
</c:if>
<c:if test="${!empty user}">
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="tel" value="${user.phone}"></td>
							</tr>
</c:if>
<c:if test="${empty user}">
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="tel"></td>
							</tr>
</c:if>
							<tr>
								<th style="background-color:">작품 설명</th>
								<td><textarea wrap="physical" rows="10" name="contents"
										cols="40"></textarea></td>
							</tr>
							<tr>
								<th colspan="2" style="background-color:">
									<input type="range" ID="jsRange" min="0.1" max="10.0" value="2.5" step="0.1"/><br>
										
									<a href="javascript:reset()"> <input type="button" value="리셋"
										onclick="">
									</a>
									<button onclick="$('.popup-window').toggleClass('is-active'); return false">Click
										this to toggle</button>
									
									<input type="submit" id="saveBtn" value="저장하기">
								</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="controls">	
						<div class="controls_colors" id="palette" >
							<div class="controls_color jspColor" style="background-color: black;"></div>
							<div class="controls_color jspColor" style="background-color: green;"></div>
							<div class="controls_color jspColor" style="background-color: red;"></div>
							<div class="controls_color jspColor" style="background-color: Blue;"></div>
							<div class="controls_color jspColor" style="background-color: white;"></div>
							<div class="controls_color jspColor" style="background-color: orange;"></div>
							<div class="controls_color jspColor" style="background-color: yellow;"></div>
							<div class="controls_color jspColor" style="background-color: purple;"></div>
						</div>
				</div>
				
				<div class="canvas-wrapper">
					<div class="popup-window">
						<div class="popup-window__close" onclick="$('.popup-window').toggleClass('is-active')">X</div>
						<canvas id="a1" width="900px" height="300px"></canvas>
					</div>
				</div>
			</div>
			<input type="hidden" id="demo" name="demo" value="${demo}">	

	</div>
	</form>

	
	<script>
		var canvas = document.getElementById("a1");
		var context = canvas.getContext("2d");
		
		//처음 마우스 X좌표
		var stX = 0;
		//처음 마우스 Y좌표
		var stY = 0;
		//마우스를 캔버스에서 움직였을 때 그림 그리기 여부
		var drag = false;
		
		// 브러시 사이즈
		var brushSize = 10;

		function mDown(me) {
			stX = me.offsetX; //눌렀을 때 현재 마우스 X좌표를 stX에 담음
			stY = me.offsetY; //눌렀을 때 현재 마우스 Y좌표를 stY에 담음
			drag = true; //그림 그리기는 그리는 상태로 변경
		}

		function mMove(me) {
			//drag가 false 일때는 return(return 아래는 실행 안함)
			if (!drag) {
				return;
			}

			//마우스를 움직일 때마다 X좌표를 nowX에 담음
			var nowX = me.offsetX;
			//마우스를 움직일 때마다 Y좌표를 nowY에 담음
			var nowY = me.offsetY;
			//실질적으로 캔버스에 그림을 그리는 부분
			canvasDraw(nowX, nowY);
			//마우스가 움직일때마다 X좌표를 stX에 담음
			stX = nowX;
			//마우스가 움직일때마다 Y좌표를 stY에 담음
			stY = nowY;
			
			
			
			console.log(nowX, nowY)
		}

		function canvasDraw(currentX, currentY) {
			context.beginPath();
			//마우스를 누르고 움직일 때마다 시작점을 재지정
			context.moveTo(stX, stY);
			context.lineWidth = brushSize;
			context.lineCap = 'round';
			//마우스 시작점부터 현재 점까지 라인 그리기
			context.lineTo(currentX, currentY);
			context.stroke();
			
			//context.arc(currentX, currentY, brushSize, 0, Math.PI*2);
			//context.lineWidth = 0;
			//context.fill();
			//context.closePath();
		}

		function mUp(me) {
			drag = false; //마우스를 떼었을 때 그리기 중지
		}

		function mOut(me) {
			drag = false; //마우스가 캔버스 밖으로 벗어났을 때 그리기 중지
		}

		function reset() {
			var canvas = document.getElementById("a1");
			canvas.getContext("2d")
					.clearRect(0, 0, canvas.width, canvas.height);
		}

		//저장?
		//	var URL = document.querySelector('#saveBtn').addEventListener('click', function(e) {
		//	 	console.log(canvas.toDataURL());
		//	});

		document.querySelector('#drawing').addEventListener(
			'submit',
			function(e) {
				var url = canvas.toDataURL().toString();
				document.getElementById("demo").value = url;
			}
		);
		
		//canvas에 mousedown 이벤트 추가 : 이벤트 발생시 mDown 호출
		canvas.addEventListener("mousedown", mDown, false);
		//canvas에 mousemove 이벤트 추가 : 이벤트 발생시 mMove 호출
		canvas.addEventListener("mousemove", mMove, false);
		//canvas에 mouseup 이벤트 추가 : 이벤트 발생시 : mUp 호출
		canvas.addEventListener("mouseup", mUp, false);
		//canvas에 mouseout 이벤트 추가 : 이벤트 발생시 mOut 호출
		canvas.addEventListener("mouseout", mOut, false);
			
		//브러시 색변경
		$(".jspColor").click(function() {
			const color = $(this).css('background-color');
			context.strokeStyle = color;
		});
		
		//const colors = document.getElementsByClassName("jspColor");
		//function handleColorClick(event){
		//	const color = event.target.style.backgroundColor;
		//	alert(event.target.style.backgroundColor);
		//	context.strokeStyle = color;
		//}
		//Array.from(colors).forEach(function(color){
		//	color.addEventListener("click", handleColorClick)});
		
		//브러시 크기 변경
		const range = document.getElementById("jsRange");
		function handleRangeChange(event){
			const size = event.target.value;
			brushSize = size;
			//context.lineWidth = size;
		}
		if(range){
			range.addEventListener("input", handleRangeChange);
		}
		
	</script>
</body>
</html>