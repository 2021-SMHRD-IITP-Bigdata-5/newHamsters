<%@page import="com.DTO.t_team_memberDTO"%>
<%@page import="com.DTO.t_todoDTO"%>
<%@page import="com.DTO.t_workDTO"%>
<%@page import="com.DTO.t_commuDTO"%>
<%@page import="java.util.ArrayList"%>
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
  <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  
  
  <!-- modal style -->
  <style>
  
  
#modal {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal h2 {
  margin:0;   
  font-size: 25px;
  color: black;
   background-color: white;
   font-weight: bold;
}

 #modal button {
  display:inline-block;
  margin-left:calc(100% - 100px - 10px);
} 

#modal .modal_content {
  position: relative;
  top: 15%;
  width:550px;
  height: 400px;
  margin:0px auto;
  padding:40px;
  padding-right:0px;
  background:#fff;
  border-radius: 10px;
  
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #modal_close_btn {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor : pointer;
   right: -10%;
   top: -10%;
} 

button#submit {
   position: absolute;
   width: 200px;
   heigth: 50px;
   font-size: 20px;
    right : 15%;
    top : 80%;
    transform: translate(-50%, -50%);
   border: none;
   border-radius: 5px;
}


input#title{
   position: absolute;
   top : 25%;
   margin: 0px;
   background: transparent;
   width: 400px;
   height: 40px;
   align-content: center;
   border: none;
}
input#title::placeholder{
   font-weight: bold;
   font-size: 20px;
}

input#content {
   display: inline; 
   position: relative;
   top : 40%;
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

div.team_icon{
   width: 40px;
   height: 40px;
   border-radius: 10px;
   border: none;
   background-color: #e2d6ff;
   display:inline-block;
   
}

h3.team_name{
   font-weight: bold;
   display:inline-block;
}

h6.team_attri{
   display:inline-block;
}

ul#menutap{
   display: flex;
   flex-flow: row nowrap;
   align-content: space-between;   
}
ul#menutap>li{
   display: inline-block;
    margin: 0 10px;
    align-content: flex-end;
}

ul#menutap>li>a{
   text-decoration: none;
    color: black;
}

div.row1{
   position: relative;
    background: #fff;
    border-bottom: 1px solid #ddd;
    padding-top: 20px;
    padding-left: 20px;
    padding-right: 20px;
    height: 170px;
}

div.row{
   margin-top: 20px;
}

div.content{
   padding-left: 40px;
   padding-top: 40px;

}

div.newContentsBox{
   background-color: white;
   border-radius: 10px;
   border: 1px solid grey;
   width: 800px;
   padding-left: 20px;
   padding-top: 20px;
   padding-bottom: 20px;
   margin-top: 20px;
   margin-bottom: 20px;
   
}

div.content_box{
   background-color: white;
   border-radius: 10px;
   border: 1px solid grey;
   width: 800px;
   padding: 20px;
   margin-top: 20px;
   margin-bottom: 20px;
   
}
ul.newContentsBox{
   display: flex;
   flex-flow: row nowrap;
   place-content: space-evenly;   
}

li.newContentsBox{
   display: inline-block;
    margin: auto;
    padding: 10px;
    font-weight: bold;
    font-size: 15px;
}

li.newContentsBox>button{
   background-color: white;
   border: none;
}

div.title{
   background-color: #4B49AC;
}


/* 게시글 */
/* 게시글 */
/* 게시글 */

#modal1 {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal1 h2 {
  margin:0;   
  font-size: 25px;
  color: black;
   background-color: white;
   font-weight: bold;
}

 #modal1 button {
  display:inline-block;
  margin-left:calc(100% - 100px - 10px);
} 

#modal1 .modal_content {
  position: relative;
  top: 15%;
  width:550px;
  height: 400px;
  margin:0px auto;
  padding:40px;
  padding-right:0px;
  background:#fff;
  border-radius: 10px;
  
}

#modal1 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #yongdal_close1 {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor : pointer;
   right: -10%;
   top: -10%;
} 

/* 업무 */
/* 업무 */
/* 업무 */

#modal2 {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal2 h2 {
  margin:0;   
  font-size: 25px;
  color: black;
   background-color: white;
   font-weight: bold;
}

 #modal2 button {
  display:inline-block;
  margin-left:calc(100% - 100px - 10px);
} 

#modal2 .modal_content {
  position: relative;
  top: 15%;
  width:550px;
  height: 400px;
  margin:0px auto;
  padding:40px;
  padding-right:0px;
  background:#fff;
  border-radius: 10px;
  
}


#modal2 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #yongdal_close2 {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor : pointer;
   right: 5%;
   top: -10%;
} 



button#submit2 {
   position: absolute;
   width: 200px;
   heigth: 50px;
   font-size: 20px;
    right : 15%;
    top : 90%;
    transform: translate(-50%, -50%);
   border: none;
   border-radius: 5px;
}

input#title2{
   position: absolute;
   top : 25%;
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
   top : 40%;
   border: none;
   margin-top: 10px;
   margin-left: 0px;
   margin-right: 0px;
   margin-bottom: 10px;
   width: 400px; 
   height: 100px;
}

input#damdangja{
   border: none;
}

/* 일정 */
/* 일정 */
/* 일정 */

#modal3 {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal3 h2 {
  margin:0;   
  font-size: 25px;
  color: black;
   background-color: white;
   font-weight: bold;
}

 #modal3 button {
  display:inline-block;
  margin-left:calc(100% - 100px - 10px);
} 

#modal3 .modal_content {
  position: relative;
  top: 15%;
  width:550px;
  height: 400px;
  margin:0px auto;
  padding:40px;
  padding-right:0px;
  background:#fff;
  border-radius: 10px;
  
}

#modal3 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #yongdal_close3 {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor : pointer;
   right: -10%;
   top: -10%;
} 

/* 할 일 */
/* 할 일 */
/* 할 일 */

#modal4 {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal4 h2 {
  margin:0;   
  font-size: 25px;
  color: black;
   background-color: white;
   font-weight: bold;
}

 #modal4 button {
  display:inline-block;
  margin-left:calc(100% - 100px - 10px);
} 

#modal4 .modal_content {
  position: relative;
  top: 15%;
  width:550px;
  height: 400px;
  margin:0px auto;
  padding:40px;
  padding-right:0px;
  background:#fff;
  border-radius: 10px;
  
}

#modal4 .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #yongdal_close4 {
   position: relative;
   border: none;
   background-color: white;
   width: 25px;
   height: 25px;
   cursor : pointer;
   right: -10%;
   top: -10%;
} 

.content-wrapper{
	overflow: auto;
}

li.menuuu{
	display: inline-block;
    margin: 10px 20px;
}
li.menuuu>a{
	text-decoration: none;
    color: black;
    font-weight: 800;
    font-size: 20px;
}


/* 새프로젝트 버튼 */
/* 새프로젝트 버튼 */
button#modal_open_btn{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #815ee8;
	
}

/* 참여자 */
/* 참여자 */

div.attendee{
	border: none;
	border-radius: 10px;
	background-color: white;
	width: 300px;
	padding: 20px;
	position: fixed;
	right: 400px;
	top: 400px;
}

/* 글 작성 버튼 */
/* 글 작성 버튼 */


.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 5px 15px;
	border-radius: 10px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight:;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 5px 20px;
	border-radius: 10px;
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
	border: 0.5px solid #999999;
	color: #000000;
}

div.content-wrapper {
	min-height: 100%;
	overflow: auto;
	height: auto;
	margin-bottom: 30%;
}

.div2 {
	border: 1px solid #cccccc;
	float: left; & amp; amp; nbsp;
	border-radius: 2em;
	background: #cccccc;
	width: 15%;
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bolder;
	margin: 4px;
}
.div4 {
	border: 1px solid #cccccc;
	float: left; & amp; amp; nbsp;
	border-radius: 2em;
	background: #cccccc;
	width: 15%;
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bolder;
	margin: 4px;
}

.clicked {
	border: 1px solid #cccccc;
	float: left;
	border-radius: 2em;
	background: #bb99da;
	display: flex;
	/*  align-items: center;
        justify-content: center; */
}




html,body{
	width: 100%;
	height: 100%;
}

#modal5 {
	display: none;
	width: 100%;
	height: 100%;
	z-index: 1;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#modal5 h2 {
	margin: 0;
	font-size: 25px;
	color: black;
	background-color: white;
	font-weight: bold;
}

#modal5 button {
	display: block;
	
}

#modal5 .modal_content {
	position: relative;
	top: 15%;
	width: 550px;
	height: 250px;
	margin: 0px auto;
	padding: 50px;
	background: #fff;
	border-radius: 10px;
}


#modal5 .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

#yongdal_close5 {
	position: relative;
	border: none;
	background-color: white;
	width: 25px;
	height: 25px;
	cursor: pointer;
	right: -10%;
	top: -10%;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: radial-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8));
	box-shadow: 0 8px 28px 6 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgb(255, 255, 255);
}

#modal .modal-window {
	background: rgb(246, 243, 246);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(36, 3, 3, 0.418);
	width: 350px;
	height: 150px;
	position: relative;
	top: -50px;
	padding: 15px;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: rgb(244, 237, 245);
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

div#button {
	align-items: center;
	font-size: 15px;
	cursor: pointer;
	display: flex;
	flex-direction: column;
}


.wrap {
	position: absolute;
	top: 50%;
	left: 35%;
	position: relative;
	margin-top: -30px;
	margin-left: -80px;
	text-align: center;

}

button {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 0px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 10px 50px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}




</style>
  
</head>
<body>

<%
memberDTO dto = (memberDTO)session.getAttribute("teamdto");
t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
ArrayList<t_workDTO> workdto = (ArrayList<t_workDTO>)session.getAttribute("teamSeq1");
ArrayList<t_team_memberDTO> memberdto = (ArrayList<t_team_memberDTO>)session.getAttribute("teamSeq3");
%>

<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">알림</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <h6 class="preview-subject font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="./images/faces/댕댕이2.JPG" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                설정
              </a>
              <form action="update.jsp">
              <button class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                내프로필</button>
                </form>
              </a>
              <a class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                로그아웃
              </a>
            </div>
          </li>
          <li class="nav-item nav-settings d-none d-lg-flex">
            <a class="nav-link" href="#">
              <i class="icon-ellipsis"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
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
        <ul class="nav nav-tabs border-top" id="setting-panel" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">MEMBER</a>
          </li>
        </ul>
        <div class="tab-content" id="setting-content">
          <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
            <div class="add-items d-flex px-3 mb-0">
              <form class="form w-100">
                <div class="form-group d-flex">
                  <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                  <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">add</button>
                </div>
              </form>
            </div>
            <div class="list-wrapper px-3">
              <ul class="d-flex flex-column-reverse todo-list">
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      이번주 업무 및 일정 확인하기
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li>
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox">
                      발표 01.03 확인
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      다음주 일정 확인하기
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
                <li class="completed">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input class="checkbox" type="checkbox" checked>
                      업무별 파트 확인하기
                    </label>
                  </div>
                  <i class="remove ti-close"></i>
                </li>
              </ul>
            </div>
          </div>
          <!-- To do section tab ends -->
          <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
            <div class="d-flex align-items-center justify-content-between border-bottom">
              <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
              <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
            </div>
            <ul class="chat-list">
              <li class="list active">
                <div class="profile"><img src="./images/faces/제2의유라언니.jpg"alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>최유라</p>
                  <p>A팀 프로젝트</p>
                </div>
                <small class="text-muted my-auto">19 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="./images/faces/제2의정훈.jpg" alt="image"><span class="offline"></span></div>
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
                <div class="profile"><img src="./images/faces/슬기쿠키.jpg" alt="image"><span class="online"></span></div>
                <div class="info">
                  <p>장슬기</p>
                  <p>A팀 프로젝트</p>
                </div>
                <small class="text-muted my-auto">14 min</small>
              </li>
              <li class="list">
                <div class="profile"><img src="./images/faces/영훈.jpg" alt="image"><span class="offline"></span></div>
                <div class="info">
                  <p>나영훈</p>
                  <p>A팀 프로젝트</p>
                </div>
                <small class="text-muted my-auto">2 min</small>
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
              <i class="icon-grid menu-icon"></i>
              <div id="root">
              <span class="menu-title">새 프로젝트</span>
              </div>
              </button>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="project.html"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">내프로젝트</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">전체업무</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <%out.print("<a class='nav-link' href='getSche.do?connect_team=" + t_DTO.getTeamSeq() + "'</a>"); %>
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">캘린더</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">나를언급</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">내 게시물</span>
              <i class="menu-arrow"></i>
            </a>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper" style="padding: 0px;">
          <div class="row1" style="">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                <div class="team_icon"></div>
                  <!-- <h1><a href="sadf.jsp">이동동</a></h1> -->
                  <%-- <%=memberdto.get(0).getTeamSeq() %> --%>
                  <h3 class="team_name"><%= t_DTO.getTeamName()%></h3> <br>
                  <h6 class="team_attri"><%=t_DTO.getTeamContent() %></h6> <br>
                  
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                  <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                    <button class="btn btn-sm btn-light bg-white dropdown-toggle" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                     <i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
                      <a class="dropdown-item" href="#">January - March</a>
                      <a class="dropdown-item" href="#">March - June</a>
                      <a class="dropdown-item" href="#">June - August</a>
                      <a class="dropdown-item" href="#">August - November</a>
                    </div>
                  </div>
                 </div>
                </div>
                <div>
                	<ul type="none">
                		<li class="menuuu"><a href="projectPage.jsp">글</a></li>
                		<li class="menuuu"><a href="projectPageWork.jsp">업무</a></li>
                		<li class="menuuu"><a href="projectPageTodo.jsp">할 일</a></li>
                		<li class="menuuu"><a href="projectPageCal.jsp">캘린더</a></li>
                	</ul>
                </div>
              </div>
              <form action="update.jsp">
              <!-- <button>  내프로필</button> -->
                </form>
               <div class="content">
								<button type="button" id="yongdal_open1"
									class="w-btn-outline w-btn-skin-outline">글</button>
								<button type="button" id="yongdal_open2"
									class="w-btn-outline w-btn-skin-outline">업무</button>
								<button type="button" id="yongdal_open3"
									class="w-btn-outline w-btn-skin-outline">일정</button>
								<button type="button" id="yongdal_open4"
									class="w-btn-outline w-btn-skin-outline">할 일</button>
							</div>
              <div class="content">
              <!-- <a href="sadf.jsp">이동동</a> -->
                  <% for(int i = 0; i < workdto.size(); i++){ %>
                 <div class="content_box">
                    <!-- 0번째 -->
                    <div>
                    <img src="사용자.JPG" style="width: 50px; height: 50px;" vspace=15 hspace=10">
                       <span><%=workdto.get(i).getMemId() %></span>
                       <span><%=workdto.get(i).getRegDate() %></span>
                       <h2><%=workdto.get(i).getWorkTitle() %></h2>
                       <div class="div1">
                       	<img src="시계.JPG" style="width: 25px; height: 25px; float: left;" vspace=3 hspace=3>
                       		<div id="workChange<%=i+1 %>" class="div2">요청<p style="display:none;">_<%=workdto.get(i).getWorkSeq() %></p></div>
							<div id="workChange<%=i+1 %>" class="div2">진행<p style="display:none;">_<%=workdto.get(i).getWorkSeq() %></p></div>
							<div id="workChange<%=i+1 %>" class="div2">피드백<p style="display:none;">_<%=workdto.get(i).getWorkSeq() %></p></div>
							<div id="workChange<%=i+1 %>" class="div2">완료<p style="display:none;">_<%=workdto.get(i).getWorkSeq() %></p></div>
							<div id="workChange<%=i+1 %>" class="div2">보류<p style="display:none;">_<%=workdto.get(i).getWorkSeq() %></p></div>
                       </div>
                       
          
                       <br>
                       <br>
                       <span id="workseq<%=i+1 %>" ><%=workdto.get(i).getWorkSeq() %></span>
                       <span>시작일 : <%=workdto.get(i).getWorkStartDt() %></span><br>
                       <span>마감일 : <%=workdto.get(i).getWorkEndDt() %></span><br>
                       <hr>
                       <h4><%=workdto.get(i).getWorkContent() %></h4>
                       </div>
                       </div>
            </div>
            <%} %>
                       <!-- 1번째 -->
                     
        
                    <script type="text/javascript">
                    	function a(text){
                    		alert(text);
                    		
                    		
                    	}
                    </script>
                  
                    
                    
                 </div>
                    <%-- <%} %> --%>
            <!-- 진행상태 -->
			<!-- 진행상태 -->

			<script src="./js/jquery-3.6.0.min.js"></script>
			<script>
				var div2 = document.getElementsByClassName("div2");
				let selectItem;
				/* $("#workseq").click(function () {
				    index = $("#workseq").index(this);
				    console.log(index)
				}); 
 */

				function handleClick(event) {
					//클릭한 요소 저장
					selectItem = event.target;
					
					
					
					/* console.log(event.target);
					// console.log(this);
					// 콘솔창을 보면 둘다 동일한 값이 나온다

					console.log(event.target.classList);

					if (event.target.classList[1] === "clicked") {
						event.target.classList.remove("clicked");
					} else {
						for (var i = 0; i < div2.length; i++) {
							div2[i].classList.remove("clicked");
						}

						event.target.classList.add("clicked");
					} */

					$("#modal5").attr("style", "display:block");
					
				}

				function init() {
					for (var i = 0; i < div2.length; i++) {
						div2[i].addEventListener("click", handleClick);
					}
				}

				init();
			</script>

			<!-- 진행상태 -->
			<!-- 진행상태 -->
                    
              <!-- </div>
            </div>
          </div> -->
          
            
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
                <h2>새 프로젝트 </h2>
            </div>
            <button type="button" id="modal_close_btn">X</button>
            <div class="content">
                <input type = "text" id="title" placeholder="제목을 입력하세요">
                <input type = "text" id="content" placeholder="프로젝트에 관한 설명(옵션)">
                <br>
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
                <input type = "text" name ="title" id="title" placeholder="제목을 입력하세요.">
                <input type = "text" name ="content" id="content" placeholder="내용을 입력하세요.">
                <input type = "text" name ="hashtag" id="hashtag" placeholder="해쉬태그">
                <br>
                <br>
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
            <form action="workWrite.do">
            <div class="content2">
                <input type = "text" id="title2" placeholder="제목을 입력하세요."name ="title"> <br> <br> <br>
                <div class="div3">
                    <div class="div4">요청</div>
					<div class="div4">진행</div>
					<div class="div4">피드백</div>
					<div class="div4">완료</div>
					<div class="div4">보류</div>
                </div>
                <input type="text" id="damdangja" placeholder="담당자 배정"name ="ref"><br>
                <input type = "date"name ="startdt"><input type = "date"name ="enddt"><br>
                <input type = "text" id="content2" placeholder="내용을 입력하세요."name ="content">
                <br>
                <br>
                <div id="button">
                    <button id="submit" type="submit">올리기</button>
                </div>
            </div>
            </form>
        </div>
        <div class="modal_layer"></div>
    </div>
  </div>
  
  <!-- 진행상태 -->
			<!-- 진행상태 -->

			<script src="./js/jquery-3.6.0.min.js"></script>
			<script>
				var div3 = document.getElementsByClassName("div4");

				function handleClick(event) {
					console.log(event.target);
					// console.log(this);
					// 콘솔창을 보면 둘다 동일한 값이 나온다

					console.log(event.target.classList);

					if (event.target.classList[1] === "clicked") {
						event.target.classList.remove("clicked");
					} else {
						for (var i = 0; i < div3.length; i++) {
							div3[i].classList.remove("clicked");
						}

						event.target.classList.add("clicked");
					}


				}

				function init() {
					for (var i = 0; i < div3.length; i++) {
						div3[i].addEventListener("click", handleClick);
					}
				}

				init();
			</script>

			<!-- 진행상태 -->
			<!-- 진행상태 -->
  
  
  <!-- 일정 modal 창 -->
  <!-- 일정 modal 창 -->
  <!-- 일정 modal 창 -->
  
  <div style="display: inline">
  <div id="modal3" class="modal_content">
        <div class="modal_content">
            <div class="title">
                <h2>게시물 작성</h2>
            </div>
            <button type="button" id="yongdal_close3"> X</button>
            <form action="schedule.do">
            <div class="content">
                <input type = "text" id="title" placeholder="제목을 입력하세요." name="title">
                <input type = "text" id="content" placeholder="내용을 입력하세요." name="content">
                   시작일 <input type = "date" name="std"> - 마감일 <input type = "date" name="endd"><br>
                <input type = "text" placeholder="참석자" name="attend">
                <br>
                <br>
                <div id="button">
                    <button id="submit" type="submit">올리기</button>
                </div>
            </div>
            </form>
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
                <h2>할일 작성</h2>
            </div>
            <form action="todoWrite.do">
            <button type="button" id="yongdal_close4">X</button>
            <div class="content">
                <input type = "text" id="title" placeholder="제목을 입력하세요.">
                <input type = "text" id="content" placeholder="내용을 입력하세요.">
                <br>
                <br>
                <div id="button">
                    <button id="submit" type="submit">올리기</button>
                </div>
                
            </div>
            </form>
        </div>
        <div class="modal_layer"></div>
    </div>
  </div>
  
  
  <!-- modal scipt -->
  <script src ="js/jquery-3.6.0.min.js"></script>
<script>
document.getElementById("modal_open_btn").onclick = function() {
       document.getElementById("modal").style.display="block";
   }
   
   document.getElementById("modal_close_btn").onclick = function() {
       document.getElementById("modal").style.display="none";
}   
</script>



<script>
$("#modal_open_btn").click(function(){
    $("#modal").attr("style", "display:block");
});

 $("#modal_close_btn").click(function(){
    $("#modal").attr("style", "display:none");
});      
 </script>
 
 
 
<!--  글 작성 modal  -->
<!--  글 작성 modal  -->
<!--  글 작성 modal  -->
 
 
<script>
document.getElementById("yongdal_open1").onclick = function() {
    document.getElementById("modal1").style.display="block";
}

document.getElementById("yongdal_close1").onclick = function() {
    document.getElementById("modal1").style.display="none";
}   
document.getElementById("modal5_close_btn").onclick = function() {
	document.getElementById("modal5").style.display = "none";
}
</script>



<script>
$("#yongdal_open1").click(function(){
    $("#modal1").attr("style", "display:block");
});

 $("#yongdal_close1").click(function(){
    $("#modal1").attr("style", "display:none");
});      

</script>

<!--  업무 작성 modal  -->
<!--  업무 작성 modal  -->
<!--  업무 작성 modal  -->
 
 
<script>
document.getElementById("yongdal_open2").onclick = function() {
    document.getElementById("modal2").style.display="block";
}

document.getElementById("yongdal_close2").onclick = function() {
    document.getElementById("modal2").style.display="none";
}   
</script>



<script>
$("#yongdal_open2").click(function(){
    $("#modal2").attr("style", "display:block");
});

 $("#yongdal_close2").click(function(){
    $("#modal2").attr("style", "display:none");
});      

</script>


<!--  일정 작성 modal  -->
<!--  일정 작성 modal  -->
<!--  일정 작성 modal  -->
 
 
<script>
document.getElementById("yongdal_open3").onclick = function() {
    document.getElementById("modal3").style.display="block";
}

document.getElementById("yongdal_close3").onclick = function() {
    document.getElementById("modal3").style.display="none";
}   
</script>



<script>
$("#yongdal_open3").click(function(){
    $("#modal3").attr("style", "display:block");
});

 $("#yongdal_close3").click(function(){
    $("#modal3").attr("style", "display:none");
});      

</script>


<!--  할 일 작성 modal  -->
<!--  할 일 작성 modal  -->
<!--  할 일 작성 modal  -->
 
 
<script>
document.getElementById("yongdal_open4").onclick = function() {
    document.getElementById("modal4").style.display="block";
}

document.getElementById("yongdal_close4").onclick = function() {
    document.getElementById("modal4").style.display="none";
}   
</script>



<script>
$("#yongdal_open4").click(function(){
    $("#modal4").attr("style", "display:block");
});

 $("#yongdal_close4").click(function(){
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


<!-- 진행상태 모달 -->
<!-- 진행상태 모달 -->

<div style="display: inline">
				<div id="modal5" class="modal_content">
					<div class="modal_content">
						<!-- <form class="content" action=""> -->
							<br>
							<br>
							<h5 style="text-align:center">상태를 변경하시겠습니까?</h5>
							<br>
							<div class="modal5" style="padding-left: 90px;">
								<button id="modal5_close_btn" class="button" style="float:left;">취소</button>
								<button onclick="workChange()" class="button2" style="float:left;">확인</button>
							</div>
						<!-- </form> -->
					</div>
					<div class="modal_layer"></div>
				</div>
			</div>

<!-- 진행상태 모달 -->
<!-- 진행상태 모달 -->


<div id="list">
</div>

<script>
	var phm_workchange = '';
	$(".div2").on("click", function(){
    	phm_workchange = $(this).text();
    	console.log($(this).text());
    	phm_workchange = $(this).text().split('_')[0];
    	phm_workseq = $(this).text().split('_')[1];
	})
	
	let cancelBtn = document.getElementById('modal5_close_btn');
	
	cancelBtn.addEventListener('click',function(){
		document.getElementById('modal5').style.display = 'none';
	});

	function workChange() {
		
		console.log(selectItem.innerHTML);
		
		let work = selectItem.innerHTML;
		
		$.ajax({
			url:'WorkChange.do',
			data : {
				"workChange" : phm_workchange,
				"workseq1" : phm_workseq
			},
			success:function(res){
				console.log(res)
				//전체 상태 색깔 초기화
				for (var i = 0; i < div2.length; i++) {
					div2[i].classList.remove("clicked");
				}
				
				//통신성공 시 선택한 상태 색깔적용
				selectItem.classList.add("clicked");
				
				//완료 시 모달창 닫기
				document.getElementById('modal5').style.display = 'none';
			}
		});
		
	}
	
</script>
<script>
	
	
	
</script>



			
</body>
</html>