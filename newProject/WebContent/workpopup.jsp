<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flow</title>
<style>
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

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
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
	<div id="container">
		<div id="lorem-ipsum2"></div>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="container-scroller">
				<div class="container-fluid page-body-wrapper full-page-wrapper">
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
							<div class="col-lg-4 mx-auto">
								<div class="auth-form-light text-left py-5 px-4 px-sm-5">
									<div class="brand-logo"></div>
									<form class="pt-3">
										<br>
										<h5 style="text-align: center">상태를 변경하시겠습니까?</h5>
										<br>
										<div class="wrap">
											<a href="#" class="button" style="float:left;">취소</a>
											<a href="#" class="button2" style="float:left;">확인</a>
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
		<script>
        const loremIpsum = document.getElementById("lorem-ipsum")
            .then(response => response.text())
            .then(result => loremIpsum.innerHTML = result)
    </script>
</body>
</html>


