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
						<p class="card-description">Ajout machines</p>
							<div class="form-group">
								<label for="exampleInputUsername1">Reference</label> <input
									type="text" class="form-control" id="ref"
									placeholder="reference">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Marque</label> <input
									type="text" class="form-control" id="marque"
									placeholder="marque">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Date Achat</label>
								<input required type="date" class="form-control form-control-user" name="mdate" id="mdate">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Prix</label> <input type="text"
									class="form-control" id="prix" placeholder="prix">
							</div>
							<label>Salle :</label>
							<select class="form-select" id="salle">
							
							</select>
							<div id="add">
								<button type="button" class="btn btn-primary mr-2" onclick="add()">Ajouter</button>
							</div>
							<div id="mod">
								<button type="button" class="btn btn-primary mr-2 " onclick="modifier()">Modifier</button>
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
												<th>Salle</th>
												<th>Action</th>
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

	 function add(){
		 	let reference = $("#ref").val();
	 	  	let marque = $("#marque").val();
	 	  	let prix = $("#prix").val();
	 	  	let dateAchat = $("#mdate").val();
	 	  	let salle=$("#salle").val();
		  	  $.ajax({
		   		   url:"MachineController",
		   		   type:"POST",
		   		   data:{
		   			   reference:reference,
		   			   marque:marque,
		   			   dateAchat:dateAchat,
		   			   prix:prix,
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
		 				<td>`+data[i].salle.code+`</td>
		 				<td><a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Edit</a> <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Delete
		                   </a></td>
		 			</tr>`;
		   	  		}
		   	  		$("#machine").html(ligne);
		           }
		   		});
	 	  	  $("#ref").val("")
	 	  	  $("#marque").val("")
	 	  	  $("#prix").val("")
		  	 
		    }
	 
    $(document).ready(function() {
		$.ajax({
	  		   url:"MachineController",
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
						<td>`+data[i].reference+`</td>
						<td>`+data[i].marque+`</td>
						<td>`+data[i].dateAchat+`</td>
						<td>`+data[i].prix+`</td>
						<td>`+data[i].salle.code+`</td>
						<td><a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Edit</a> <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
	                     Delete
		                   </a></td>
					</tr>`;
	  	  		}
	  	  		$("#machine").html(ligne);
	          }
	  		});
		
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
	  	  			ligne+=`<option value=`+data[i].id+` >`+data[i].code+`</option>`;
	  	  		}
	  	  		$("#salle").html(ligne);
	          } 
		});
		$("#mod").hide();
  		$("#add").show();
		
	});
    
    function recuperer(x){
  		id = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		
  		let ref = x.parentNode.parentNode.cells[1].innerText;
  		let marque = x.parentNode.parentNode.cells[2].innerText; 
  		let prix = x.parentNode.parentNode.cells[4].innerText;
  		
  		let sdate = x.parentNode.parentNode.cells[3].innerText;
 	    let now = new Date(sdate);
 	   let today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
        if(now.getDate() < 10)
 	   {
 		    today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' +'0'+now.getDate();
 	   } 
        if(now.getMonth() < 10)
 	   {
 		    today = now.getFullYear() + '-' +'0'+ (now.getMonth() + 1) + '-' +now.getDate();
 	   } 
 	   if(now.getMonth() < 10 && now.getDate() < 10)
 	   {
 		    today = now.getFullYear() + '-' +'0'+ (now.getMonth() + 1) + '-' +'0'+now.getDate();
 	   }  

        $("#mdate").val(today);
  		$("#ref").val(ref);
  		$("#marque").val(marque);
  		$("#prix").val(prix);
  		$("#mod").show();
  		$("#add").hide();

  	}
    
    function modifier()
	{
    	let reference = $("#ref").val();
 	  	let marque = $("#marque").val();
 	  	let prix = $("#prix").val();
 	  	let dateAchat = $("#mdate").val();
 	  	let salle=$("#salle").val();

  		if(reference!="" && marque!="" && prix!="")
  		{
  			$.ajax({
   	  		   url:"MachineController",
   	  		   type:"POST",
   	  		   data:{
   	  			   id:id,
   	  			   reference:reference,
	   			   marque:marque,
	   			   dateAchat:dateAchat,
	   			   prix:prix,
	   			   salle:salle
   	  		   },
   	  		success:function(data){
  	  			let ligne = "";
  	 	  		for(let i = 0; i < data.length; i++){
  	 	  	
  	 	  		ligne+=`<tr class="odd">
					<td class="sorting_1">`+data[i].id+`</td>
					<td>`+data[i].reference+`</td>
					<td>`+data[i].marque+`</td>
					<td>`+data[i].dateAchat+`</td>
					<td>`+data[i].prix+`</td>
					<td>`+data[i].salle.code+`</td>
					<td><a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
                    Edit</a> <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
                    Delete
	                   </a></td>
				</tr>`;
  	 	  		}
  	 	  		$("#machine").html(ligne);
  		  	  	
            	}
  	  		});
  			$("#ref").val("")
	 	  	$("#marque").val("")
	 	  	$("#prix").val("")
  		}
  		
  		$("#add").show();
  		$("#mod").hide();
	}
    
    function deleteSalle(x){
  		let ids = parseInt((x.parentNode.parentNode.cells[0].innerText));
  		$.ajax({
	  		   url:"MachineController",
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
							<td>`+data[i].reference+`</td>
							<td>`+data[i].marque+`</td>
							<td>`+data[i].dateAchat+`</td>
							<td>`+data[i].prix+`</td>
							<td>`+data[i].salle.code+`</td>
							<td><a href="javascript:;" onclick="recuperer(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
		                     Edit</a> <a href="javascript:;" onclick="deleteSalle(this)" class="badge badge-sm bg-gradient-success" data-toggle="tooltip" data-original-title="Edit user">
		                     Delete
			                   </a></td>
						</tr>`;
	  	 	  		}
	  	 	  		$("#machine").html(ligne);    
         	}
	  		});
  		$("#add").show();
  		$("#mod").hide();
  	}
    </script>
	
</body>
</html>