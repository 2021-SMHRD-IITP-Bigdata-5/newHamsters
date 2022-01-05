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
  
#modal22.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: radial-gradient(rgb(246, 243, 246));
	box-shadow: 0 8px 28px 6 rgba(216, 216, 216, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 30px;
	border: 1px solid rgb(255, 255, 255);
}

#modal22 .modal-window {
	background: rgb(246, 243, 246);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 30px;
	border: 1px solid rgba(36, 3, 3, 0.418);
	width: 245px;
	height: 500px;
	position: relative;
	top: -50px;
	padding: 15px;
}
#img1{
	border-radius: 30px;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
#modal22 .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 2px 2px 2px gray;
	color: black;
}

#modal22 .title h2 {
	display: inline;
}

#modal22 .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: rgb(244, 237, 245);
}

#modal22 .content {
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
#exampleInputpw{
	position: fixed;
	left: 0;
	top: 60%;
	height: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color :rgb(246, 243, 246);
}
#exampleInputcom{
	position: fixed;
	left: 0;
	top: 66%;
	height: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color :rgb(246, 243, 246);
}
#exampleInputtel{
	position: fixed;
	left: 0;
	top: 72%;
	height: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color :rgb(246, 243, 246);
}
#exampleInputintro{
	position: fixed;
	left: 0;
	top: 78%;
	height: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color :rgb(246, 243, 246);
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
            <a class="nav-link" href="main.do"> 
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
<!-- <div style="display: inline">
				<div  class="modal22"id="container">
		<div id="lorem-ipsum"></div>
	</div>
	<div id="modal22" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>회원수정</h2>
			</div>
			<div id="modal_update_content" class="close-area">X</div>
			<div class="container-scroller">
				<div class="container-fluid page-body-wrapper full-page-wrapper">
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
							<div class="col-lg-4 mx-auto">
								<div class="auth-form-light text-left py-5 px-4 px-sm-5">
									<div class="brand-logo"></div>
									<form class="pt-3" action="UpdateCon.do">
									<br>
									<img id="img1" src="사용자.JPG">
										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												id="exampleInputpw" placeholder="비밀번호" style="border:0 solid black" >
										</div>
										<div class="form-group" >
											<input type="email" class="form-control form-control-lg"
												id="exampleInputcom" placeholder="회사명" style="border:0 solid black">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-lg"
												id="exampleInputtel" placeholder="전화번호" style="border:0 solid black">
										</div>
										<div class="form-group">
											<input type="work" class="form-control form-control-lg"
												id="exampleInputintro" placeholder="소개글" style="border:0 solid black">
										</div>
										<div class="text-center mt-4 font-weight-light">
											<a href="" class="text-primary">확인</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					</div>
				</div>
			</div>
  
  
  <script>
document.getElementById("modal_update").onclick = function() {
    document.getElementById("modal22").style.display="block";
}

document.getElementById("modal_update_close").onclick = function() {
    document.getElementById("modal22").style.display="none";
}   
</script>



<script>
$("#modal_update").click(function(){
    $("#modal22").attr("style", "display:block");
});

 $("#modal_update_close").click(function(){
    $("#modal22").attr("style", "display:none");
});      

</script> -->
</body>
</html>