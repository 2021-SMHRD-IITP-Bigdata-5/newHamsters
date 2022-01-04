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
  margin:100px auto;
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
    top : 75%;
    transform: translate(-50%, -50%);
   border: none;
   border-radius: 5px;
}


input#title{
   margin: 10px;
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
   border: solid 1px;
   border-color: grey;
   margin-left: 10px;
   margin-right: 10px;
   margin-bottom: 10px;
   width: 400px;
   height: 100px;
   border-radius: 10px;
}



/* 업데이트 */
/* 업데이트 */
  
#modal_update_content {
  display: none;
  width:100%;
  height:100%;
  z-index:1;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

#modal_update_content h3 {
  margin:0;   
  font-size: 25px;
}


#modal_update_content .update_content {
  position: relative;
  top: 15%;
  width:400px;
  height: 700px;
  margin:50px auto;
  padding:20px;
  background:#fff;
  border-radius: 10px;
  
}

#modal_update_content .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.8);
  z-index:-1;
}   

 #modal_update_close {
 	float:left;
 	position: relative;
    width: 150px;
   heigth: 50px;
   font-size: 20px;
    bottom : 10%;
   border: none;
   border-radius: 5px;
   margin: 10px;
} 

button#updatebutton {
	float:left;
	position: relative;
   width: 150px;
   heigth: 50px;
   font-size: 20px;
    bottom : 10%;
   border: none;
   border-radius: 5px;
   margin: 10px;
}


input#title{
   margin: 10px;
   background: transparent;
   width: 400px;
   height: 40px;
   align-content: center;
   border: none;
}
input.update::placeholder{
   font-weight: bold;
   font-size: 20px;
}

input.update {
   border: solid 1px;
   border-color: grey;
   margin-left: 10px;
   margin-right: 10px;
   margin-bottom: 10px;
   width: 200px;
   border-radius: 10px;
}
/* 프로젝트 */
/* 프로젝트 */

div.card.card-tale{
	background-color: #CCC7FA;
}
div.card.card-tale:hover{
	background-color: #B3ABF8;
}

div.card.card-tale>a {
	font-size: 25px;
	font-weight: bold;
	color: white;
	text-decoration: none;
}	

div.card.card-tale>a:visited {
	color: white;
	text-decoration: none;
}

div.card.card-tale>a:hover {
	text-decoration: none;

}




/* 새 프로젝트 */
/* 새 프로젝트 */

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

span.newp{
	color: white;
	font-size: 20px;
	font-weight: bold;
}

div#update_content{
	border-radius: 10px;
	border: none;
	background-color: white;
}


/* 나의 정보 */

div#myinfo{
	margin: 15px;
}

.infoimg{
	display: inline;
	width: 370px;
	height: 370px;
	align: center; 
	padding: 20px;
}

span.info{
	display: inline;
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

span.info {
	position:relative;
	left:20px; 
	bottom:15px;
	font-weigth: bolder;
}

div#infobutton{
	position:relative;
	display:inline;
	left: 15px;
	bottom:20px;
}

</style>
  
</head>
<body>
<%	memberDTO dto = (memberDTO)session.getAttribute("dto"); 
	ArrayList<t_teamDTO> team_dto = (ArrayList<t_teamDTO>)session.getAttribute("teamSeq"); 
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
              <button class="dropdown-item" id="modal_update">
                <i class="ti-settings text-primary"></i>
                	내프로필</button>
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
      <div class="theme-setting-wrapper">
        <div onclick="play()"id="settings-trigger"><i class="ti-settings"><audio id='audio_play' src='맷돌.mp3'></audio> </i></div>
        <script type="text/javascript"> 
function play() { 
    var audio = document.getElementById('audio_play'); 
    if (audio.paused) { 
        audio.play(); 
    }else{ 
        audio.pause(); 
        audio.currentTime = 0 
    } 
} 
</script>
        
        
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
              
              <!-- <button><a href="projectCalPage.jsp">이동</a></button> -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="projectMain.html"> 
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">내프로젝트</span>
              <i class="menu-arrow"></i>
            </a>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">전체업무</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">캘린더</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">나를언급</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">내 게시물</span>
              <i class="menu-arrow"></i>
            </a>
        </ul>
      </nav>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper" style="">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold">내 프로젝트</h3>
                  <h6 class="font-weight-normal mb-0"> 참여중 프로젝트 </h6>
                </div>
                
              </div>
            </div>
          </div>
          
            <div class="col-md-6 grid-margin transparent">
              <div class="row">
               <%
               System.out.println("프로젝트메인페이지");
                 for(int i = 0; i < team_dto.size(); i++){
                    out.print("<div class='col-md-6 mb-4 stretch-card transparent'>");
                    out.print("<div class='card card-tale'>");
                    out.print("<a class='fs-30 mb-2' href='connectPage.do?connect_team=" + team_dto.get(i).getTeamSeq() + "'><br><br>"+ team_dto.get(i).getTeamName());
                    out.print("<div class='card-body'>");
                    out.print("</div>");
                    out.print("</a>");
                    out.print("</div>");
                    out.print("</div>");
                 }
              %>
                
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


  <!-- modal -->
  <div style="display: inline">
  <form action="createTeam.do">
  <div id="modal" class="modal_content">
        <div class="modal_content">
            <div class="title">
                <h2>새 프로젝트 </h2>
            </div>
            <button type="button" id="modal_close_btn">X</button>
            <div class="content">
                <input type = "text" id="title" name ="title" placeholder="제목을 입력하세요">
                <input type = "text" id="content" name ="content" placeholder="프로젝트에 관한 설명(옵션)">
                <br>
                <br>
                <div id="button">
                    <button id="submit" type="submit">만들기</button>
                </div>

                
                
            </div>
        </div>
        <div class="modal_layer"></div>
    </div>
    </form>
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
			




<!-- 업데이트 -->
<!-- 업데이트 -->
<div style="display: inline">
				<div id="modal_update_content" class="modal_content">
					<div class="update_content">
					<form action="UpdateCon.do">
						<div id="myinfo">
							<h3 style="font-weight: bold;">내 정보</h3>
						</div> 	
						<div id="info">
							<img class="infoimg" src="사용자.JPG" align="center">
							<span class="info"><h3><%=dto.getMemName() %></h3></span><br>
							<span class="info" style="margin-bottom: 20px;"><h4><%=dto.getMemCompany() %></h4></span>
						</div>
						<div>
							<ul type="none">
								<li>비밀번호&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<input name="pw" class="update" type="text" placeholder="<%=dto.getMemPw()%>"></li>
								<li>전화번호&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<input name="tel" class="update" type="text" placeholder="<%=dto.getMemPhone() %>"></li>
								<li>&nbsp;&nbsp;&nbsp;이메일&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<input name="email" class="update" type="email" placeholder="<%=dto.getMemEmail() %>"></li>
							</ul>
						</div>
						<div id="infobutton">
							<div><button id="updatebutton">수정</button></div>
							<div><button id="modal_update_close">취소</button></div>
						</div>
						</form>
						</div>
					<div class="modal_layer"></div>
						</div>
					</div>
				</div>
			</div>
  
  
  <script>
document.getElementById("modal_update").onclick = function() {
    document.getElementById("modal_update_content").style.display="block";
}

document.getElementById("modal_update_close").onclick = function() {
    document.getElementById("modal_update_content").style.display="none";
}   
</script>



<script>
$("#modal_update").click(function(){
    $("#modal_update_content").attr("style", "display:block");
});

 $("#modal_update_close").click(function(){
    $("#modal_update_content").attr("style", "display:none");
});      

</script>
</body>
</html>