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
						<h4 class="card-title">Utilisateurs</h4>
						<p class="card-description">Ajout Utilisateur</p>
						<div class="form-group">
							<label>Nom D'ultilisateur :</label> <input type="text"
								class="form-control" id="username"
								placeholder="Nom d'utilisateur">
						</div>
						<div class="form-group">
							<label>Email :</label> <input type="text" class="form-control"
								id="Email" placeholder="Mail Adresse">
						</div>
						<div class="form-group">
							<label>Mot de Passe :</label> <input required type="password"
								class="form-control form-control-user" id="password"
								placeholder="Mot de Passe">
						</div>
						<div class="form-group">
							<label>Confirmation de Mot de Passe :</label> <input
								type="password" class="form-control" id="passwordc"
								placeholder="Confirmation">
						</div>
						<div id="add">
							<button type="button" class="btn btn-primary mr-2"
								onclick="add()">Ajouter</button>
						</div>
						<div id="mod">
							<button type="button" class="btn btn-primary mr-2 "
								onclick="modifier()">Modifier</button>
						</div>
						<br>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Tableau des Utilisateurs</h4>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id</th>
												<th>Nom d'Utilisateur</th>
												<th>Email</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="user">

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
    $(document).ready(function() {
  	  
		$.ajax({
	  		   url:"UserController",
	  		   type:"POST",
	  		   data:{
	  			   op:"load"
	  		   },
	  		   success:function(data){
	  			 console.log(data);
	  			let ligne = "";
	  	  		for(let i = 0; i < data.length; i++){
	  	  	
	  	  			ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>
                        <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Modifier
	                   </a>
	                     <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Supprimer
	                   </a>
                        </td>
                        </tr>`;
	  	  		}
	  	  		$("#user").html(ligne);
		  	  	
	  		   
	          } 
	  		   
	  		});
		$("#add").show();
  		$("#mod").hide();
	});
    
    let id = -1;
    
    
    function add(){
  	let username = $("#username").val();
  	let mail = $("#Email").val();
  	let password =$("#password").val();
  	let passwordc =$("#passwordc").val();
  	
  	if(username!="" && mail!="" && password!="" && passwordc!=""){
  		if(password==passwordc){
  			$.ajax({
  		  		url:"UserController",
  				   type:"POST",
  				   data:{
  					   username:username,
  					   mail:mail,
  					   password:password
  				   },
  				   success:function(data){
  					 console.log(data);
  		   			let ligne = "";
  		   	  		for(let i = 0; i < data.length; i++){
  		   	  	
  		   	  		ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>
                        <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Modifier
	                   </a>
	                     <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Supprimer
	                   </a>
                        </td>
                        </tr>`;
  		   	  		}
  		   	  		$("#user").html(ligne);
  		  	  	  	
  		   		   
  		           } 
  		   		 
  		   		});
  		}else{
  			alert("Password Faild!!");
  		}
  	}
  	$("#username").val("")
	  $("#Email").val("")
	  $("#password").val("")
	  $("#passwordc").val("")
  	 
    }
    
    function recuperer(x){
  		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		
  		let username = x.parentNode.parentNode.cells[1].innerText;
  		let mail = x.parentNode.parentNode.cells[2].innerText; 
  		$("#username").val(username);
  		$("#Email").val(mail);
  		$("#mod").show();
  		$("#add").hide();

  	}
	
	function modifier()
	{
		let username = $("#username").val();
	  	let mail = $("#Email").val();
	  	let password =$("#password").val();
	  	let passwordc =$("#passwordc").val();

  		if(username!="" && mail!="" && password!="" && passwordc!="")
  		{
  			if(password==passwordc){
  			$.ajax({
   	  		   url:"UserController",
   	  		   type:"POST",
   	  		   data:{
   	  			   op:"update",
   	  			   id:id,
   	  			   username:username,
				   mail:mail,
				   password:password
   	  		   },
   	  		success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  		ligne+=`<tr class="odd">
                    <td class="sorting_1">`+data[i].id+`</td>
                    <td>`+data[i].username+`</td>
                    <td>`+data[i].mail+`</td>
                    <td>
                    <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
                    Modifier
                  </a>
                    <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
                    Supprimer
                  </a>
                    </td>
                    </tr>`;
  	 	  		}
  	 	  		$("#user").html(ligne);
  		  	  	
            	}
  	  		});
  		  $("#username").val("")
  		  $("#Email").val("")
  		  $("#password").val("")
  		  $("#passwordc").val("")
  			}
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
	
	
	function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));

  		$.ajax({
	  		   url:"UserController",
	  		   type:"POST",
	  		   data:{
	  			   op:"delete",
	  			   id:ids
	  		   },
	  		   success:function(data){
	  			 let ligne = "";
	  	 	  		for(let i = 0; i < data.length; i++){
	  	 	  	
	  	 	  		ligne+=`<tr class="odd">
                        <td class="sorting_1">`+data[i].id+`</td>
                        <td>`+data[i].username+`</td>
                        <td>`+data[i].mail+`</td>
                        <td>
                        <a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Modifier
	                   </a>
	                     <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Supprimer
	                   </a>
                        </td>
                        </tr>`;
	  	 	  		}
	  	 	  		$("#user").html(ligne);
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