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
						<h4 class="card-title">Salles</h4>
						<p class="card-description">Ajout salles</p>
						<form class="forms-sample">
							<div class="form-group">
								<label>CODE</label> <input type="text" id="code"
									class="form-control" placeholder="code">
							</div>
						</form>
						<div class="form-group">
							<label>TYPE</label> <input type="text" class="form-control"
								id="type" placeholder="TYPE">
						</div>

						<button type="submit" id="add" onclick="add()"
							class="btn btn-primary mr-2 ">Ajouter</button>
						<button type="submit" id="mod" onclick="modifier()"
							class="btn btn-primary mr-2 ">Modifier</button>
					</div>

					<!--                       <button class="btn btn-dark">Cancel</button> -->

					<!-- TABLEAU MACHINE -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Tableau des salles</h4>
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">ID</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">code</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">type</th>
											<th
												class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Action</th>
										</tr>
									</thead>
									<tbody id="salle">

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
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-dashboard.min.js?v=3.0.0"></script>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
  
  let id = -1;
  
  function add(){
	  let code = $("#code").val();
		let type = $("#type").val();
		alert(code + "  " + type);
		  $.ajax({
	 		   url:"SalleController",
	 		   type:"POST",
	 		   data:{
	 			   code:code,
	 			   type:type
	 		   },
	 		   success:function(data){
	 			 console.log(data);
	 			let ligne = "";
	 	  		for(let i = 0; i < data.length; i++){
	 	  	
	 	  			ligne+=`<tr>
		                   <td>
		                   <div class="d-flex px-2 py-1">
		                     <div>
		                       <i class="fas fa-door-open"></i>
		                     </div>
		                     <div class="d-flex flex-column justify-content-center">
		                    <h6 class="mb-0 text-sm"> `+data[i].id+` </h6>
		                     </div>
		                   </div>
		                 </td>
		                 <td>
		                   <p class="text-xs font-weight-bold mb-0">`+data[i].code+`</p>
		                 </td>
		                 <td class="align-middle text-center text-sm">
		                   <p class="text-xs font-weight-bold mb-0">`+data[i].type+`</p>

		                 </td>
		                 <td class="align-middle text-center text-sm">
		                   <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
		                     Edit
		                   </a>
		                   <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
		                     Delete
		                   </a>
		                 </td>
		               </tr>`;
	 	  		}
	 	  		$("#salle").html(ligne);
		  	  	
	 		   
	         } 
	 		 
	 		});
		  $("#code").val("")
		  $("#type").val("")
	  }
	  $(document).ready(function() {
			
			$.ajax({	
		  		   url:"SalleController",
		  		   type:"POST",
		  		   data:{
		  			   op:"load"
		  		   },
		  		   success:function(data){
		  			 console.log(data);
		  			let ligne = "";
		  	  		for(let i = 0; i < data.length; i++){
		  	  	
		  	  			ligne+=`<tr>
	                        <td>
	                        <div class="d-flex px-2 py-1">
	                          <div>
	                            <i class="fas fa-door-open"></i>
	                          </div>
	                          <div class="d-flex flex-column justify-content-center">
	                         <h6 class="mb-0 text-sm"> `+data[i].id+` </h6>
	                          </div>
	                        </div>
	                      </td>
	                      <td>
	                        <p class="text-xs font-weight-bold mb-0">`+data[i].code+`</p>
	                      </td>
	                      <td class="align-middle text-center text-sm">
	                        <p class="text-xs font-weight-bold mb-0">`+data[i].type+`</p>

	                      </td>
	                      <td class="align-middle text-center text-sm">
	                        <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                          Edit
	                        </a>
	                      </td>

	                      <td class="align-middle text-center text-sm">
	                        <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                          Delete
	                        </a>
	                      </td>
	                    </tr>`;
		  	  		}
		  	  		$("#salle").html(ligne);
			  	  	
		  		   
		          } 
		  		   
		  		});
		});
	  
	function recuperer(x){
		
		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		let code = x.parentNode.parentNode.cells[1].innerText;
  		let type = x.parentNode.parentNode.cells[2].innerText; 
  		$("#code").val(code);
  		$("#type").val(type); 
  		$("#mod").show();
  		$("#add").hide();
  		
  	}
	
	function modifier()
	{
  		let code = $("#code").val();
  		let type = $("#type").val();
		alert(code+" "+type);

  		if(code!=""&& type!="")
  		{
  			$.ajax({
    	  		   url:"SalleController",
    	  		   type:"POST",
    	  		   data:{
    	  			   op:"update",
    	  			   id:id,
    	  			   code:code,
    	  			   type:type
    	  		   },
  	  		   success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  			ligne+=`<tr>
  	                   <td>
  	                   <div class="d-flex px-2 py-1">
  	                     <div>
  	                       <i class="fas fa-door-open"></i>
  	                     </div>
  	                     <div class="d-flex flex-column justify-content-center">
  	                    <h6 class="mb-0 text-sm"> `+data[i].id+` </h6>
  	                     </div>
  	                   </div>
  	                 </td>
  	                 <td>
  	                   <p class="text-xs font-weight-bold mb-0">`+data[i].code+`</p>
  	                 </td>
  	                 <td class="align-middle text-center text-sm">
  	                   <p class="text-xs font-weight-bold mb-0">`+data[i].type+`</p>

  	                 </td>
  	                 <td class="align-middle text-center text-sm">
  	                   <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
  	                     Edit
  	                   </a>
  	                 </td>

  	                 <td class="align-middle text-center text-sm">
  	                   <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
  	                     Delete
  	                   </a>
  	                 </td>
  	               </tr>`;
  	 	  		}
  	 	  		$("#salle").html(ligne);
  		  	  	
            	}
  	  		   
  	  		   
  	  		});
  		  $("#code").val("")
  		  $("#type").val("")
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
	
	
	function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));

  		$.ajax({
	  		   url:"SalleController",
	  		   type:"POST",
	  		   data:{
	  			   op:"delete",
	  			   id:ids
	  		   },
	  		   success:function(data){
	  			 let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr>
	  	                   <td>
	  	                   <div class="d-flex px-2 py-1">
	  	                     <div>
	  	                       <i class="fas fa-door-open"></i>
	  	                     </div>
	  	                     <div class="d-flex flex-column justify-content-center">
	  	                    <h6 class="mb-0 text-sm"> `+data[i].id+` </h6>
	  	                     </div>
	  	                   </div>
	  	                 </td>
	  	                 <td>
	  	                   <p class="text-xs font-weight-bold mb-0">`+data[i].code+`</p>
	  	                 </td>
	  	                 <td class="align-middle text-center text-sm">
	  	                   <p class="text-xs font-weight-bold mb-0">`+data[i].type+`</p>

	  	                 </td>
	  	                 <td class="align-middle text-center text-sm">
	  	                   <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	  	                     Edit
	  	                   </a>
	  	                 </td>

	  	                 <td class="align-middle text-center text-sm">
	  	                   <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	  	                     Delete
	  	                   </a>
	  	                 </td>
	  	               </tr>`;
	  	 	  		}
	  	 	  		$("#salle").html(ligne);         
         	}
	  		   
	  		   
	  		});
   		$("#add").show();
   		$("#mod").hide();
  	}
	
 	$("#add").show();
 	$("#mod").hide();
  </script>
</body>
</html>