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
	border-radius: 30px;
	border: 1px solid rgb(255, 255, 255);
}

#modal .modal-window {
	background: rgb(246, 243, 246);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(36, 3, 3, 0.418);
	width: 300px;
	height: 500px;
	position: relative;
	top: -50px;
	padding: 15px;
}
#img1{
	border-radius: 30px;
}
#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 2px 2px 2px gray;
	color: black;
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
</style>
</head>
<body>
	<div id="container">
		<div id="lorem-ipsum"></div>
	</div>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>회원수정</h2>
			</div>
			<div class="close-area">X</div>
			<div class="container-scroller">
				<div class="container-fluid page-body-wrapper full-page-wrapper">
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
							<div class="col-lg-4 mx-auto">
								<div class="auth-form-light text-left py-5 px-4 px-sm-5">
									<div class="brand-logo"></div>
									<form class="pt-3">
									<br>
									<img id="img1" src="사용자.JPG">
										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												id="exampleInputUsername1" placeholder="사용자이름">
										</div>
										<div class="form-group">
											<input type="email" class="form-control form-control-lg"
												id="exampleInputEmail1" placeholder="이메일">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-lg"
												id="exampleInputPassword1" placeholder="패스워드">
										</div>
										<div class="form-group">
											<input type="work" class="form-control form-control-lg"
												id="exampleInputPassword1" placeholder="회사명">
										</div>
										<div class="mb-4">
											<div class="form-check">
												<label class="form-check-label text-muted"> <input
													type="checkbox" class="form-check-input"> 정보 수정에
													동의합니다.
												</label>
											</div>
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

</body>
</html>


