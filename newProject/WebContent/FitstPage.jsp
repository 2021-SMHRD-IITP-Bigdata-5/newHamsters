<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<link href="/static/package/view.min.css?1630042307762" rel="stylesheet" type="text/css"><script async="" src="//www.google-analytics.com/analytics.js"></script>
	<script src="/static/package/view-resource.min.js?1630042307762"></script>
	<script>screenWidth = 1200; projectId = "kvDHg6vdscwzCEQ1tOzIE5O6hodFNSUW"; sequenceId = "dTQsd";</script>
	<style>
body {
	margin: 0;
	padding: 0;
}

#webView {
	overflow: hidden;
	position: relative;
	background:;
	width: 1200px;
	height: 1002px;
	margin: 0 auto;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0)
}

#webView[data-show-memo='true'] {
	overflow: visible
}

div.title {
	position: absolute;
	top: 300px;
	left: 93px;
}

@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}

@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 700;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff');
}

.godo * {
 font-family: 'Godo', sans-serif;
}

@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

h1 {
	font-size: 55px;
	font-family: 'Godo';
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}

div.count {
font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
	position: absolute;
	left: 410px;
	top: 500px;
}

div.countbox {
	float: left;
	margin: 30px;
}

p.countlist {
	font-size: 20px;
}

div.biglogo {
	position: absolute;
	top: 200px;
	right: 360px;
}

img.logo {
	width: 500px;
	height: 300px;
}

div.buttonbox {
	position: absolute;
	right: 450px;
	bottom: 300px;
	
}

button {
	width: 300px;
	height: 60px;
	font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
	font-size: 20px;
	font-weight: bold;
	color: rgb(255, 255, 255);
	text-align: center;
	border-radius: 10px;
	background-color: rgb(94, 28, 232);
	text-shadow: none;
	box-shadow: rgba(0, 0, 0, 0.5) 3px 3px 5px 0px;
	border: none;
	margin: 10px;
}

button.loginbutton {
	background-color: rgb(94, 28, 232);
	padding: 10px;
}

button.joinbutton {
	background-color: rgb(190, 190, 190);
	padding: 10px;
}
</style>
</head>

<body>
	<div style="background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);">
	 
	<div id="webView">
		
		<div class="title">
			<h1 class="">목표달성을 위한</h1>
			<h1>No.1 업무관리 협업툴</h1>
				
			</div>
		</div>
		
		<div style="position: absolute; top: 376px; left: 93px; width: 200px; height: 43px;">
			
		</div>
		
		<div class="count">
		
			<div class="countbox">
				<p class="countlist">개설 프로젝트</p>
				<h3 style="font-weight:bold;font-size:24px" class="">1,004,109</h3>
			</div>
			<div class="countbox">
				<p class="countlist">공유된 업무</p>
				<h3 style="font-weight:bold;font-size:24px" class="">11,573,345</h3>
			</div>
			<div class="countbox">
				<p class="countlist">사용중인 팀</p>
				<h3 style="font-weight:bold;font-size:24px" class="">351,941</h3>
			</div>
		</div>

		<div class="biglogo">
			<div ><img class="logo" src ="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg" ></div>
		</div>
	
		<div class="buttonbox">
			<div >		
				<button class="loginbutton" onclick="location.href='Login.jsp'">로그인</button>
			</div>
			<div >
				<button class="joinbutton" onclick="location.href='Join.jsp'">회원가입</button>
			</div>
		</div>
		

	</div>
</div>

</body>
</html>