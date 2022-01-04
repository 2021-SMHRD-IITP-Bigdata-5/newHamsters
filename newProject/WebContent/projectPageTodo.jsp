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

@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body,button,a{
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
}
  
  
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
	font-size: 35px;
   font-weight: bold;
   display:inline-block;
   position: absolute;
   top: 25px;
   left: 70px;
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

div.row>div{
	width: 850px;
	padding-top:20px;
	padding-left:20px;
}

div.content{
   padding-left: 40px;
   padding-top: 40px;

}

div.newContentsBox{
   background-color: white;
   border-radius: 10px;
   border: 1px solid #dedede;
   width: 800px;
   padding: 20px;
   margin-top: 20px;
   margin-bottom: 20px;
   
}

div.content_box{
   background-color: white;
   border-radius: 10px;
   border: 1px solid #dedede;
   width: 800px;
   padding: 20px;
   margin: 40px;
   
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




h6.team_attri{
	font-size: 18px;
   display:inline-block;
   top: 10px;
}

/* 새프로젝트 버튼 */
/* 새프로젝트 버튼 */
button#modal_open_btn{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #4B49AC;
	
}

button#modal_open_btn:hover{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #9492D1;
	
}

/* 참여자 */
/* 참여자 */

div.attendee{
	border: 1px solid #dedede;
	border-radius: 10px;
	background-color: white;
	width: 300px;
	padding: 20px;
	position: absolute ;
	right: 400px;
	top: 200px;
}

img.img{
	width: 50px; 
	height: 50px;
	float: left;
	margin-right: 10px;
}

/* 글 작성 버튼 */
/* 글 작성 버튼 */

div.content-wrapper {
	min-height: 100%;
	overflow: auto;
	height: auto;
	margin-bottom: 30%;
}

ul.nav {
	width: 200px;
	height: 100
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


div.card-body>a{
	align-text: center;
   display: block;
}
div.card.card-tale{
	text-align: center;
	
}
a:hover{
	text-decoration: none;
}
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


/* 글 작성 버튼 */
/* 글 작성 버튼 */

div#seulgib{
	position: absolute;
	top: 20px;
	right: -100px;

}

button#Seulgi{
	border-radius: 10px;
	background-color: white;
	border: 1px solid #dedede;
	
}


/* 새프로젝트 버튼 */
/* 새프로젝트 버튼 */
button#modal_open_btn{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #4B49AC;
	
}

button#modal_open_btn:hover{
	border: none;
	border-radius: 10px;
	color: white;
	background-color: #9492D1;
	
}

span#content{
	font-size: 25px;
}

 div.content_2{
 	margin:70px;
 }

</style>
  
</head>
<body>

<%
memberDTO dto = (memberDTO)session.getAttribute("teamdto");
t_teamDTO t_DTO = (t_teamDTO)session.getAttribute("teamName");
t_team_memberDTO ttmem = (t_team_memberDTO)session.getAttribute("admin");
ArrayList<t_todoDTO> tododto = (ArrayList<t_todoDTO>)session.getAttribute("teamSeq2");
ArrayList<t_team_memberDTO> memberdto = (ArrayList<t_team_memberDTO>)session.getAttribute("teamSeq3");
%>

<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="main.do"><img src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="main.do"><img src="https://flow.team/flow-renewal/view/homepage/assets/images/common/logo.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="./사용자.JPG" alt="profile"/>
             </a>
             <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <form action="update.jsp">
              <button class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                내프로필</button>
                </form>
              </a>
              <a href = 'LogoutCon.do'>
               <button class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                로그아웃</button>
              </a>
            </div>
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
            <a class="nav-link" href="projectMain.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">내프로젝트</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPage.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">게시글</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPageWork.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">업무</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectPageTodo.jsp"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">할 일</span>
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
            <%out.print("<a class='nav-link' href='GetDate.do?connect_team=" + t_DTO.getTeamSeq() + "'</a>"); %>
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">캘린더</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="sadf.jsp" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">나를언급</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="sadf.jsp" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">내 게시물</span>
              <i class="menu-arrow"></i>
            </a>
            </li> 
         <% if(ttmem.getAdminYN().equals("1")){ %> 
          <li class="nav-item">
            <a class="nav-link" href="projectInvite.jsp" aria-controls="auth"> 
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">팀원초대</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
        <%} %> 
        <%-- <H1>어드민어ㅕ부<%=ttmem.getAdminYN() %></H1> --%>
        
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
                  <div id="seulgib">
                  	<button id="Seulgi" type="button">할 일 등록</button>
                  </div>
                </div>
              </div>
              <form action="update.jsp">
              <!-- <button>  내프로필</button> -->
                </form>
              <div class="content">
              <div class="content_2">
                    <% for(int i = 0; i < tododto.size(); i++){ %>
                 <div class="newContentsBox">
                    <div>
                   <img src="사용자.JPG" style="width: 50px; height: 50px;" vspace=15
									hspace=10>
                       <span><%=tododto.get(i).getMemId() %></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span><%=tododto.get(i).getRegDate() %></span>
                       <h2><%=tododto.get(i).getTodoTitle() %></h2>
                       <hr>
                       <span id="content"><input type="checkbox" id=""><label for="check1"></label>&nbsp;<%=tododto.get(i).getTodoContent() %></span><br>
                       마감일&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span><%=tododto.get(i).getEventDate() %></span><br>
                       담당자&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span><%=tododto.get(i).getTodoAttendance() %></span>
                    </div>
                 </div>
                    <%} %>
              </div>
              </div>
              <div class="attendee">
              	<div class="attendeeTitle">
              		<h4>참여자</h4>
              	</div>
              	<div class="attendeebox">
              		<%for(int i = 0; i < memberdto.size(); i++) { %>
              		<hr>
              		<ul type="none">
              		<img class="img" src="사용자.JPG">
              			<li><b><%=memberdto.get(i).getMemId() %></b></li>
              			<li><%=memberdto.get(i).getTmMemo() %></li>
              		</ul>
              		<% } %>
              	</div>
              	
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
                <input type = "text" id="title" name="title" placeholder="제목을 입력하세요.">
                <input type = "text" id="content" name="content" placeholder="내용을 입력하세요.">
                <input type = "text" name="attend" placeholder="담당자">
                <input type = "date" name="event">
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
 


<!--  할 일 작성 modal  -->
<!--  할 일 작성 modal  -->
<!--  할 일 작성 modal  -->
 
 
<script>
document.getElementById("Seulgi").onclick = function() {
    document.getElementById("modal4").style.display="block";
}

document.getElementById("yongdal_close4").onclick = function() {
    document.getElementById("modal4").style.display="none";
}   
</script>



<script>
$("#Seulgi").click(function(){
    $("#modal4").attr("style", "display:block");
});

 $("#yongdal_close4").click(function(){
    $("#modal4").attr("style", "display:none");
});      

</script>




</body>
</html>