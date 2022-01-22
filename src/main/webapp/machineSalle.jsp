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
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<%@include file="template/sidebar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<%@include file="template/header.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="card-body">
						<h4 class="card-title">Machine</h4>
						<p class="card-description">Machine par salle</p>
						<label>Salle :</label> <select class="form-select" id="salle">
						</select>
						<div id="add">
							<button type="button" class="btn btn-primary mr-2"
								onclick="afficher()">Afficher</button>
						</div>
						<br>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Tableau des machines</h4>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id</th>
												<th>Reference</th>
												<th>Marque</th>
												<th>Date Achat</th>
												<th>Prix</th>
											</tr>
										</thead>
										<tbody id="machine">

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<%@include file="template/footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="assets/vendors/chart.js/Chart.min.js"></script>
	<script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="assets/js/off-canvas.js"></script>
	<script src="assets/js/hoverable-collapse.js"></script>
	<script src="assets/js/misc.js"></script>
	<script src="assets/js/settings.js"></script>
	<script src="assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="assets/js/dashboard.js"></script>
	<!-- End custom js for this page -->
	<script>
	
	function afficher(){
		let salle=$("#salle").val();
		alert(salle);
		  $.ajax({
	   		   url:"MachineController",
	   		   type:"POST",
	   		   data:{
	   			   op:"afficher",
	   			   salle:salle
	   		   },
	   		 success:function(data){
	   			 console.log(data);
	   			let ligne = "";
	   	  		for(let i = 0; i < data.length; i++){
	   	  		ligne+=`<tr class="odd">
	 				<td class="sorting_1">`+data[i].id+`</td>
	 				<td>`+data[i].reference+`</td>
	 				<td>`+data[i].marque+`</td>
	 				<td>`+data[i].dateAchat+`</td>
	 				<td>`+data[i].prix+`</td>
	 			</tr>`;
	   	  	} 
		   	  		$("#machine").html(ligne);
		           } 
		   		 
		   		});
		}
		$(document).ready(
				function() {
					$.ajax({
						url : "SalleController",
						type : "POST",
						data : {
							op : "load"
						},
						success : function(data) {
							console.log(data);
							let ligne = "";
							for (let i = 0; i < data.length; i++) {
								ligne += `<option value=`+data[i].id+` >`
										+ data[i].code + `</option>`;
							}
							$("#salle").html(ligne);
						}
					});
					$("#mod").hide();
					$("#add").show();

				});
	
		
	</script>

</body>
</html>