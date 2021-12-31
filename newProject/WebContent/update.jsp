<%@page import="com.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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






</style>




</head>
<body>
<%memberDTO dto = (memberDTO)session.getAttribute("dto");%>
<div>
	<div>
		<h3>정보</h3>
	</div>
	<ul type="none">
		<li>
			<span>이름</span>
			<span><%=dto.getMemId() %></span>
		</li>
		<li>
			<span>전화번호</span>
			<span><%=dto.getMemPhone() %></span>
		</li>
		<li>
			<span>이메일</span>
			<span><%=dto.getMemEmail() %></span>
		</li>
	</ul>
	<div>
		<button id="modal_open_btn">정보 수정</button>
		
	</div>
</div>
<form action="UpdateCon.do">
          <li><input type ="text" name ="id" placeholder="id"></li>
            <li><input type ="text" name ="pw" placeholder="pw"></li>
            <li><input type ="text" name ="email" placeholder="em"></li>
             <li><input type ="submit" value="글작성" class="button fit"></li>
             
   </form>


<script src ="js/jquery-3.6.0.min.js"></script>






	<div style="display: inline">
		<div id="modal" class="modal_content">
			<div class="modal_content">
				<form action="UpdateCon.do">
					<div>
						<button type="button" id="modal_close_btn">X</button> <br>
						비밀번호 : <input type="text" class="pw" name="pw" placeholder="<%=dto.getMemPw()%>"> <br>
						전화번호 : <input type="text" class="phone" name="tel" placeholder="<%=dto.getMemPhone()%>"> <br>
						이메일 : <input type="text" class="email" name="email" placeholder="<%=dto.getMemEmail()%>"> <br>
						<button type="submit">수정 완료</button>
					</div>
				</form>
			</div>
			<div class="modal_layer"></div>
		</div>
	</div>


















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




<script type="text/javascript">

$(document).ready(function() {
        $('.pw').val('<%=dto.getMemPw() %>');
        $('.phone').val('<%=dto.getMemPhone() %>');
        $('.email').val('<%=dto.getMemEmail() %>');
    });

</script>






</body>
</html>