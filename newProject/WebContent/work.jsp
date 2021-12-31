<%@page import="com.DTO.t_teamDTO"%>
<%@page import="com.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- plugins:css -->
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />


<!-- modal style -->
<style>
#modal {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal button {
	display: inline-block;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 400px;
	margin: 0px auto;
	padding: 40px;
	padding-right: 0px;
	background: #fff;
	border-radius: 10px;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#modal_close_btn {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

button#submit {
	position: absolute;
	width: 200px;
	heigth: 50px;
	font-size: 20px;
	right: 15%;
	top: 80%;
	transform: translate(-50%, -50%);
	border: none;
	border-radius: 5px;
}

input#title {
	position: absolute;
	top: 25%;
	margin: 0px;
	background: transparent;
	width: 400px;
	height: 40px;
	align-content: center;
	border: none;
}

input#title::placeholder {
	font-weight: bold;
	font-size: 20px;
}

input#content {
	display: inline;
	position: relative;
	top: 40%;
	border: solid 1px;
	border-color: grey;
	margin-top: 10px;
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 10px;
	width: 400px;
	height: 100px;
	border-radius: 10px;
}

div.team_icon {
	width: 40px;
	height: 40px;
	border-radius: 10px;
	border: none;
	background-color: green;
	display: inline-block;
}

h3.team_name {
	font-weight: bold;
	display: inline-block;
}

h6.team_attri {
	display: inline-block;
}

ul#menutap {
	display: flex;
	flex-flow: row nowrap;
	align-content: space-between;
}

ul#menutap>li {
	display: inline-block;
	margin: 0 10px;
	align-content: flex-end;
}

ul#menutap>li>a {
	text-decoration: none;
	color: black;
}

div.row1 {
	position: relative;
	background: #fff;
	border-bottom: 1px solid #ddd;
	padding-top: 20px;
	padding-left: 20px;
	padding-right: 20px;
	height: 170px;
}

div.row {
	margin-top: 20px;
}

div.content {
	padding-left: 40px;
	padding-top: 0px;
	padding-bottom: 30px;
}

div.newContentsBox {
	background-color: white;
	border-radius: 10px;
	border: 1px solid grey;
	width: 800px;
	height: 200px;
	padding-left: 10px;
}

ul.newContentsBox {
	display: flex;
	flex-flow: row nowrap;
	place-content: space-evenly;
}

li.newContentsBox {
	display: inline-block;
	margin: auto;
	padding: 10px;
	font-weight: bold;
	font-size: 15px;
}

li.newContentsBox>button {
	background-color: white;
	border: none;
}

div.title {
	background-color: #4B49AC;
}

/* 게시글 */
/* 게시글 */
/* 게시글 */
#modal1 {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal1 h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal1 button {
	display: inline-block;
	margin-left: calc(100% - 100px - 10px);
}

#modal1 .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 400px;
	margin: 0px auto;
	padding: 40px;
	padding-right: 0px;
	background: #fff;
	border-radius: 10px;
}

#modal1 .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#yongdal_close1 {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

/* 업무 */
/* 업무 */
/* 업무 */
#modal2 {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal2 h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal2 button {
	display: inline-block;
	margin-left: calc(100% - 100px - 10px);
}

#modal2 .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 400px;
	margin: 0px auto;
	padding: 40px;
	padding-right: 0px;
	background: #fff;
	border-radius: 10px;
}

#modal2 .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#yongdal_close2 {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

div#jinhang {
	display: flex;
	flex-flow: row nowrap;
	align-content: space-between;
	margin-top: -10px;
	margin-bottom: 15px;
	text-align: center;
}

div#jinhang>div {
	display: inline-block;
	margin: 0 10px;
	align-content: flex-end;
	font-weight: bold;
	border-radius: 15px;
	border: none;
	height: 30px;
	width: 80px;
	vertical-align: middle;
	background-color: #EEEEEE;
	color: #777777;
}

div.jinhang1:focus {
	background-color: #00B2FF;
	color: white;
}

div.jinhang2:focus {
	background-color: #00B01C;
	color: white;
}

div.jinhang3:focus {
	background-color: #FD7900;
	color: white;
}

div.jinhang4:focus {
	background-color: #402A9D;
	color: white;
}

div.jinhang5:focus {
	background-color: #777777;
	color: white;
}

button#submit2 {
	position: absolute;
	width: 200px;
	heigth: 50px;
	font-size: 20px;
	right: 15%;
	top: 90%;
	transform: translate(-50%, -50%);
	border: none;
	border-radius: 5px;
}

input#title2 {
	position: absolute;
	top: 25%;
	margin: 0px;
	margin-bottom: 25px;
	background: transparent;
	width: 400px;
	height: 40px;
	align-content: center;
	border: none;
}

input#content2 {
	display: inline;
	position: relative;
	top: 40%;
	border: none;
	margin-top: 10px;
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 10px;
	width: 400px;
	height: 100px;
}

input#damdangja {
	border: none;
}

/* 일정 */
/* 일정 */
/* 일정 */
#modal3 {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal3 h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal3 button {
	display: inline-block;
	margin-left: calc(100% - 100px - 10px);
}

#modal3 .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 400px;
	margin: 0px auto;
	padding: 40px;
	padding-right: 0px;
	background: #fff;
	border-radius: 10px;
}

#modal3 .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#yongdal_close3 {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

/* 할 일 */
/* 할 일 */
/* 할 일 */
#modal4 {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal4 h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal4 button {
	display: inline-block;
	margin-left: calc(100% - 100px - 10px);
}

#modal4 .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 400px;
	margin: 0px auto;
	padding: 40px;
	padding-right: 0px;
	background: #fff;
	border-radius: 10px;
}

#modal4 .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#yongdal_close4 {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

button {
	margin: 15px;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 5px 15px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight:;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 5px 20px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 20px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: aliceblue;
	color: #1e6b7b;
}

.w-btn-skin-outline {
	border: 3px solid #999999;
	color: #000000;
}

div.content-wrapper {
	min-height: 100%;
	overflow: auto;
	height:auto;
	margin-bottom: 30%;
}

</style>

</head>
<body>


	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index.html"><img
					src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg"
					class="mr-2" alt="logo" /></a> <a class="navbar-brand brand-logo-mini"
					href="index.html"><img
					src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg"
					alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="icon-bell mx-0"></i> <span class="count"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">알림</p>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">New user
										registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img src="./images/faces/댕댕이2.JPG"
							alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
								설정
							</a> <a class="dropdown-item"> <i
								class="ti-settings text-primary"></i> 내프로필
							</a> <a class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> 로그아웃
							</a>
						</div></li>
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					</div>
				</div>
			</div>
			<div id="right-sidebar" class="settings-panel">
				<i class="settings-close ti-close"></i>
				<ul class="nav nav-tabs border-top" id="setting-panel"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="todo-tab"
						data-toggle="tab" href="#todo-section" role="tab"
						aria-controls="todo-section" aria-expanded="true">TO DO LIST</a></li>
					<li class="nav-item"><a class="nav-link" id="chats-tab"
						data-toggle="tab" href="#chats-section" role="tab"
						aria-controls="chats-section">MEMBER</a></li>
				</ul>
				<div class="tab-content" id="setting-content">
					<div class="tab-pane fade show active scroll-wrapper"
						id="todo-section" role="tabpanel" aria-labelledby="todo-section">
						<div class="add-items d-flex px-3 mb-0">
							<form class="form w-100">
								<div class="form-group d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add To-do">
									<button type="submit"
										class="add btn btn-primary todo-list-add-btn" id="add-task">add</button>
								</div>
							</form>
						</div>
						<div class="list-wrapper px-3">
							<ul class="d-flex flex-column-reverse todo-list">
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> 이번주 업무 및 일정 확인하기
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> 발표 01.03 확인
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> 다음주 일정 확인하기
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> 업무별 파트 확인하기
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
							</ul>
						</div>
					</div>
					<!-- To do section tab ends -->
					<div class="tab-pane fade" id="chats-section" role="tabpanel"
						aria-labelledby="chats-section">
						<div
							class="d-flex align-items-center justify-content-between border-bottom">
							<p
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="./images/faces/제2의유라언니.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>최유라</p>
									<p>A팀 프로젝트</p>
								</div> <small class="text-muted my-auto">19 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="./images/faces/제2의정훈.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<div class="wrapper d-flex">
										<p>배정훈</p>
									</div>
									<p>A팀 프로젝트 팀장</p>
								</div>
								<div class="badge badge-success badge-pill my-auto mx-2">4</div>
								<small class="text-muted my-auto">23 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="./images/faces/슬기쿠키.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>장슬기</p>
									<p>A팀 프로젝트</p>
								</div> <small class="text-muted my-auto">14 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="./images/faces/영훈.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<p>나영훈</p>
									<p>A팀 프로젝트</p>
								</div> <small class="text-muted my-auto">2 min</small>
							</li>
						</ul>
					</div>
					<!-- chat tab ends -->
				</div>
			</div>
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">

				<ul class="nav">
					<li class="nav-item">
						<button type="button" id="modal_open_btn">
							<a class="nav-link"> <i class="icon-grid menu-icon"></i>
								<div id="root">
									<span class="menu-title">새프로젝트</span>
								</div>
							</a>
						</button>
					</li>
					<li class="nav-item"><a class="nav-link" href="project.html">
							<i class="icon-layout menu-icon"></i> <span class="menu-title">내프로젝트</span>
							<i class="menu-arrow"></i>
					</a> </a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#form-elements" aria-expanded="false"
						aria-controls="form-elements"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">전체업무</span>
							<i class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">캘린더</span> <i class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#icons" aria-expanded="false"
						aria-controls="icons"> <i class="icon-contract menu-icon"></i>
							<span class="menu-title">나를언급</span> <i class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#auth" aria-expanded="false"
						aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
							class="menu-title">내 게시물</span> <i class="menu-arrow"></i>
					</a>
				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper" style="padding: 0px;" >
					<div class="row1" style="">
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<div class="team_icon"></div>
									<h1>
								</div>
								<div class="col-12 col-xl-4">
									<div class="justify-content-end d-flex">
										<div class="dropdown flex-md-grow-1 flex-xl-grow-0">
											<button class="btn btn-sm btn-light bg-white dropdown-toggle"
												type="button" id="dropdownMenuDate2" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true">
												<i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
											</button>
											<div class="dropdown-menu dropdown-menu-right"
												aria-labelledby="dropdownMenuDate2">
												<a class="dropdown-item" href="#">January - March</a> <a
													class="dropdown-item" href="#">March - June</a> <a
													class="dropdown-item" href="#">June - August</a> <a
													class="dropdown-item" href="#">August - November</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="content">
								<button type="button" id="yongdal_open1"
									class="w-btn-outline w-btn-skin-outline">글</button>
								</li>
								<button type="button" id="yongdal_open2"
									class="w-btn-outline w-btn-skin-outline">업무</button>
								</li>
								<button type="button" id="yongdal_open3"
									class="w-btn-outline w-btn-skin-outline">일정</button>
								</li>
								<button type="button" id="yongdal_open4"
									class="w-btn-outline w-btn-skin-outline">할 일</button>
								</li>
							</div>

							<div class="content">
								<div class="newContentsBox">
									 <img src="사용자.JPG" style="width:50px; height:50px;" vspace=15 hspace=10>
									 <font size="3" color="000000"><b>최유라</b>&nbsp; 2021-12-29 15:57</font>

									<p style="font-size: 10px float:left"></p>
									<br>

									<p style="font-size: 15px">
										<b>제목</b>
									</p>
									<hr>
									<p style="font-size: 12px">내용</p>
								</div>
							</div>


							<div class="content">
								<div class="newContentsBox">
									 <img src="사용자.JPG" style="width:50px; height:50px;" vspace=15 hspace=10>
									 <font size="3" color="000000"><b>최유라</b>&nbsp; 2021-12-29 15:57</font>

									<p style="font-size: 15px">
										<b>제목</b>
									</p>
									<hr>
									<img src="시계.JPG" style="width:25px; height:25px; float: left;" vspace=3 hspace=3>
									<div align="center"
										style="width: 15%; height: 25px; border: 1px solid #cccccc; border-radius: 2em; float: left; &amp; amp; nbsp; background: #cccccc;">
										&nbsp;<b>요청</b>
									</div>
									<div align="center"
										style="width: 15%; height: 25px; border: 1px solid #cccccc; border-radius: 2em; float: left; &amp; amp; nbsp; background: #cccccc;">
										<b>진행</b>
									</div>
									<div align="center"
										style="width: 15%; height: 25px; border: 1px solid #cccccc; border-radius: 2em; float: left; &amp; amp; nbsp; background: #cccccc;">
										<b>피드백</b>
									</div>
									<div align="center"
										style="width: 15%; height: 25px; border: 1px solid #cccccc; border-radius: 2em; float: left; &amp; amp; nbsp; background: #cccccc;">
										<b>완료</b>
									</div>
									<div align="center"
										style="width: 15%; height: 25px; border: 1px solid #cccccc; border-radius: 2em; float: left; &amp; amp; nbsp; background: #cccccc;">
										<b>보류</b>
									</div>
									<button>담당자</button>


								</div>
							</div>

							<div class="content">
								<div class="newContentsBox">
									<img src="사용자.JPG" style="width:50px; height:50px;" vspace=15 hspace=10>
									 <font size="3" color="000000"><b>최유라</b>&nbsp; 2021-12-29 15:57</font>
									<p style="font-size: 15px">
										<b>제목</b>
									</p>
									<hr>
									<h4>To do list</h4>
									<table>
									<tr>
									<td onmouseover="this.style.background='#ccccFF'" onmouseout="this.style.background='#FFFFFF'">
									<input type="checkbox" name="xxx" value="yyy" checked>
									 <b>일정관리</b>
									</td>
									</tr>
									</table>
									
									
									


						</div>
					</div>
				</div>


				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->

		<!-- plugins:js -->
		<script src="vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<script src="vendors/chart.js/Chart.min.js"></script>
		<script src="vendors/datatables.net/jquery.dataTables.js"></script>
		<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
		<script src="js/dataTables.select.min.js"></script>

		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="js/off-canvas.js"></script>
		<script src="js/hoverable-collapse.js"></script>
		<script src="js/template.js"></script>
		<script src="js/settings.js"></script>
		<script src="js/todolist.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page-->
		<script src="js/dashboard.js"></script>
		<script src="js/Chart.roundedBarCharts.js"></script>
		<!-- End custom js for this page-->


		<!-- MODAL -->
		<div style="display: inline">
			<div id="modal" class="modal_content">
				<div class="modal_content">
					<div class="title">
						<h2>새 프로젝트</h2>
					</div>
					<button type="button" id="modal_close_btn">X</button>
					<div class="content">
						<input type="text" id="title" placeholder="제목을 입력하세요"> <input
							type="text" id="content" placeholder="프로젝트에 관한 설명(옵션)"> <br>
						<br>
						<div id="button">
							<button id="submit" type="submit">만들기</button>
						</div>

					</div>
				</div>
				<div class="modal_layer"></div>
			</div>
		</div>


		<!-- 글 modal 창 -->
		<!--  글 modal 창 -->
		<!--  글 modal 창 -->

		<div style="display: inline">
			<div id="modal1" class="modal_content">
				<div class="modal_content">
					<div class="title">

						<h2>글 : 게시물 작성</h2>
					</div>
					<button type="button" id="yongdal_close1">X</button>
					<form action="comWrite.do">
						<div class="content">
							<input type="text" name="title" id="title"
								placeholder="제목을 입력하세요."> <input type="text"
								name="content" id="content" placeholder="내용을 입력하세요."> <input
								type="text" name="hashtag" id="hashtag" placeholder="해쉬태그">
							<br> <br>
							<div id="button">
								<button id="submit" type="submit">올리기</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal_layer"></div>
			</div>
		</div>



		<!-- 업무 modal 창 -->
		<!-- 업무 modal 창 -->
		<!-- 업무 modal 창 -->

		<div style="display: inline">
			<div id="modal2" class="modal_content">
				<div class="modal_content">
					<div class="title2">

						<h2>업무 : 게시물 작성</h2>
					</div>
					<button type="button" id="yongdal_close2">X</button>
					<div class="content2">
						<input type="text" id="title2" placeholder="제목을 입력하세요."> <br>
						<br> <br>
						<div id="jinhang">
							<div class="jinhang1">
								<botton>요청</botton>
							</div>
							<div class="jinhang2">
								<botton>진행</botton>
							</div>
							<div class="jinhang3">
								<botton>피드백</botton>
							</div>
							<div class="jinhang4">
								<botton>완료</botton>
							</div>
							<div class="jinhang5">
								<botton>보류</botton>
							</div>
						</div>
						<input type="text" id="damdangja" placeholder="담당자 배정"><br>
						<input type="date"><input type="date"><br> <input
							type="text" id="content2" placeholder="내용을 입력하세요."> <br>
						<br>
						<div id="button">
							<button id="submit2" type="submit">올리기</button>
						</div>

					</div>
				</div>
				<div class="modal_layer"></div>
			</div>
		</div>


		<!-- 일정 modal 창 -->
		<!-- 일정 modal 창 -->
		<!-- 일정 modal 창 -->

		<div style="display: inline">
			<div id="modal3" class="modal_content">
				<div class="modal_content">
					<div class="title">
						<h2>게시물 작성</h2>
					</div>
					<button type="button" id="yongdal_close3">X</button>
					<div class="content">
						<input type="text" id="title" placeholder="제목을 입력하세요."> <input
							type="date"><input type="date"><br> <input
							type="text" placeholder="담당자 배정"> <input type="text"
							id="content" placeholder="내용을 입력하세요."> <br> <br>
						<div id="button">
							<button id="submit" type="submit">올리기</button>
						</div>
					</div>
				</div>
				<div class="modal_layer"></div>
			</div>
		</div>


		<!-- 할 일 modal 창 -->
		<!-- 할 일 modal 창 -->
		<!-- 할 일 modal 창 -->

		<div style="display: inline">
			<div id="modal4" class="modal_content">
				<div class="modal_content">
					<div class="title">
						<h2>게시물 작성</h2>
					</div>
					<button type="button" id="yongdal_close4">X</button>
					<div class="content">
						<input type="text" id="title" placeholder="제목을 입력하세요."> <input
							type="text" id="content" placeholder="내용을 입력하세요."> <br>
						<br>
						<div id="button">
							<button id="submit" type="submit">올리기</button>
						</div>

					</div>
				</div>
				<div class="modal_layer"></div>
			</div>
		</div>


		<!-- modal scipt -->
		<script src="js/jquery-3.6.0.min.js"></script>
		<script>
			document.getElementById("modal_open_btn").onclick = function() {
				document.getElementById("modal").style.display = "block";
			}

			document.getElementById("modal_close_btn").onclick = function() {
				document.getElementById("modal").style.display = "none";
			}
		</script>



		<script>
			$("#modal_open_btn").click(function() {
				$("#modal").attr("style", "display:block");
			});

			$("#modal_close_btn").click(function() {
				$("#modal").attr("style", "display:none");
			});
		</script>



		<!--  글 작성 modal  -->
		<!--  글 작성 modal  -->
		<!--  글 작성 modal  -->


		<script>
			document.getElementById("yongdal_open1").onclick = function() {
				document.getElementById("modal1").style.display = "block";
			}

			document.getElementById("yongdal_close1").onclick = function() {
				document.getElementById("modal1").style.display = "none";
			}
		</script>



		<script>
			$("#yongdal_open1").click(function() {
				$("#modal1").attr("style", "display:block");
			});

			$("#yongdal_close1").click(function() {
				$("#modal1").attr("style", "display:none");
			});
		</script>

		<!--  업무 작성 modal  -->
		<!--  업무 작성 modal  -->
		<!--  업무 작성 modal  -->


		<script>
			document.getElementById("yongdal_open2").onclick = function() {
				document.getElementById("modal2").style.display = "block";
			}

			document.getElementById("yongdal_close2").onclick = function() {
				document.getElementById("modal2").style.display = "none";
			}
		</script>



		<script>
			$("#yongdal_open2").click(function() {
				$("#modal2").attr("style", "display:block");
			});

			$("#yongdal_close2").click(function() {
				$("#modal2").attr("style", "display:none");
			});
		</script>


		<!--  일정 작성 modal  -->
		<!--  일정 작성 modal  -->
		<!--  일정 작성 modal  -->


		<script>
			document.getElementById("yongdal_open3").onclick = function() {
				document.getElementById("modal3").style.display = "block";
			}

			document.getElementById("yongdal_close3").onclick = function() {
				document.getElementById("modal3").style.display = "none";
			}
		</script>



		<script>
			$("#yongdal_open3").click(function() {
				$("#modal3").attr("style", "display:block");
			});

			$("#yongdal_close3").click(function() {
				$("#modal3").attr("style", "display:none");
			});
		</script>


		<!--  할 일 작성 modal  -->
		<!--  할 일 작성 modal  -->
		<!--  할 일 작성 modal  -->


		<script>
			document.getElementById("yongdal_open4").onclick = function() {
				document.getElementById("modal4").style.display = "block";
			}

			document.getElementById("yongdal_close4").onclick = function() {
				document.getElementById("modal4").style.display = "none";
			}
		</script>



		<script>
			$("#yongdal_open4").click(function() {
				$("#modal4").attr("style", "display:block");
			});

			$("#yongdal_close4").click(function() {
				$("#modal4").attr("style", "display:none");
			});
		</script>


		<!-- 색깔을 변경하는 함수 -->
		<!-- 색깔을 변경하는 함수 -->
		<!-- 색깔을 변경하는 함수 -->
		<!-- 색깔을 변경하는 함수 -->
		<!-- <script>
$('div>div>button').click(function(){
     $('div>div>button').removeClass("active");
     $(this).addClass("active");
   });

</script> -->
</body>
</html>