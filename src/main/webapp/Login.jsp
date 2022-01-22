<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manal project</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.png" />
</head>
<body>
	<%
	String uid = (String) session.getAttribute("user");
	if (uid != null) {
	%>
	<jsp:forward page="index.jsp" />
	<%
	}
	%>
	<div class="row w-100 m-0">
		<div
			class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
			<div class="card col-lg-4 mx-auto">
				<div class="card-body px-5 py-5">
					<h3 class="card-title text-left mb-3">Login</h3>
					<form action="Validate.jsp" method="post">
						<div class="form-group">
							<label>Email </label> <input type="text"
								class="form-control p_input" name="mail" required>
						</div>

						<div class="form-group">
							<label>Password </label> <input type="password" name="password"
								class="form-control p_input" required>
						</div>
						<div
							class="form-group d-flex align-items-center justify-content-between">
							<div class="form-check">
								<label class="form-check-label"> <input type="checkbox"
									class="form-check-input"> Remember me <i
									class="input-helper"></i></label>
							</div>
							<a href="#" class="forgot-pass">Forgot password</a>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary btn-block enter-btn">Login</button>
						</div>
						<div class="d-flex">
							<button class="btn btn-facebook mr-2 col">
								<i class="mdi mdi-facebook"></i> Facebook
							</button>
							<button class="btn btn-google col">
								<i class="mdi mdi-google-plus"></i> Google plus
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->
	</div>


</body>
</html>