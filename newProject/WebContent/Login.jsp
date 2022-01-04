<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
 <style>
        :root{
   --body-background-color: #f5f6f7;
   --font-color: #4e4e4e;
   --border-gray-color : #dadada;
   --naver-green-color: #623ad6;
   --naver-green-border-color: #623ad6;
}

@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.content-wrapper{
	overflow: auto;
}

*{
   margin:0;
   padding:0;
}

body{
   background:var(--body-background-color);
}

.main-container{
   width:100%;
   display:flex;
   flex-direction:column;
   align-items:center;
   margin-top: 21px;
}
.main-container .main-wrap{
   padding-top: 100px;
   width:768px;

}
.main-container .main-wrap .sel-lang-wrap .lang-select
{
   width: 96px;
   height: 30px;
   color: var(--font-color);
   border: solid 1px var(--border-gray-color);
   
}



.main-container .main-wrap .logo-wrap{
   padding-top:55px;
   padding-bottom:55px;
}
.main-container .main-wrap .logo-wrap img
{
   width: 231px;
   height: 44px;
}

.main-container .main-wrap header .sel-lang-wrap{
   display:flex;
   justify-content:flex-end;
}

.main-container .main-wrap header .logo-wrap{
   display:flex;   
   flex-direction: column;
   align-items: center;
}
.login-input-section-wrap{
   padding-top: 0px;
   display: flex;
   flex-direction: column;
   align-items: center;
}

.login-input-section-wrap2{
   padding-top: 60px;
   display: flex;
   flex-direction: column;
   align-items: center;
   
}


.login-input-wrap{
   width: 465px;
   height :48px;
   border: solid 1px var(   --border-gray-color );
   background: white;
   margin: 10px;
}

.login-input-wrap#idCheck{
   width: 465px;
   height :48px;
   border: solid 1px var(   --border-gray-color );
   background: white;
}

.password-wrap{
   margin-top: 0px;
}
.login-input-wrap input#idCheck{
   border: none;
   width:399.4px;
   margin-top: 0px;
   font-size: 14px;
   margin-left: 10px;
   height:30px;
   right: 50px;
}
.login-input-wrap input{
   border: none;
   width:430px;
   margin-top: 10px;
   font-size: 14px;
   margin-left: 10px;
   height:30px;
}
.login-button-wrap {
   padding-top: 28px;
}

.login-button-wrap button{
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
   width: 465px;
   height :48px;
   font-size: 18px;
   background: var(--naver-green-color);
   color: white;
   border: solid 1px var(--naver-green-border-color);
   cursor : pointer;
}



.fa-qrcode
{
   color:var(--naver-green-color);
}
.fa-line{
   color:var(--naver-green-color);
}
.fa-facebook-square
{
   color:#4064ac;
}


footer{
   padding-top: 95px;
   padding-bottom: 15px;
   flex-direction:column;
   align-items:center;
   width:768px;
   margin: 0px;	
   position:absolute;
   left:50%;
   margin-left:-384px;
}
.copyright-wrap{
   display: flex;
   flex-direction: column;
   align-items: center;
   height: 15px;
}
footer .copyright-wrap span img{
   width: 59px;
   height: 11px;
}
footer .copyright-wrap span{
   font-size: 13px;
   line-height: 15px;
}
    </style>
</head>
<body>

	<form action="LoginCon.do">
		<div class="main-container">
			<div class="main-wrap">
				<header>
					<div class="logo-wrap">
						<img
							src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg">
					</div>
				</header>
				<section class="login-input-section-wrap">
					<div class="login-input-wrap">
						<input placeholder="Id" type="text" name="id"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input placeholder="Password" type="password" name="pw"></input>
					</div>
					<div class="login-button-wrap">
						<button id="inp" type="submit">로그인</button>
					</div>
				</section>
			</div>
		</div>
	</form>


	<footer>
		<div class="copyright-wrap">
			<span> <img
				src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg">
				Copyright © HAMSTERS Corp. All Rights Reserved.
			</span>
		</div>
	</footer>
</body>
</html>