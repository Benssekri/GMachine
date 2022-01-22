<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion Machine</title>
<%@include file="style/css.jsp"%>
</head>
<body>
	<div class="main-panel">

		<%
		String uid = (String) session.getAttribute("user");
		if (uid == null) {
		%>
		<jsp:forward page="Login.jsp" />
		<%
		}
		%>
		<div class="container-scroller">
			<%@include file="template/sidebar.jsp"%>
			<%@include file="template/header.jsp"%>
			<%
			Gson gsonObj = new Gson();
			Map<Object, Object> map = null;
			List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
			String dataPoints = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/jdbc", "root", "");
				Statement statement = connection.createStatement();
				String xVal, yVal;

				ResultSet resultSet = statement.executeQuery(
				"select count(*) as 'Nbr machine', s.code as 'salle' from salle s,machine m where s.id=m.idsalle group by s.code;");

				while (resultSet.next()) {
					xVal = resultSet.getString("salle");
					yVal = resultSet.getString("Nbr machine");
					map = new HashMap<Object, Object>();
					map.put("label", xVal);
					map.put("y", Double.parseDouble(yVal));
					list.add(map);
					dataPoints = gsonObj.toJson(list);
				}
				connection.close();
			} catch (SQLException e) {
				out.println(
				"<div  style='width: 100%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
				dataPoints = null;
			}
			%>
			<div class="content-wrapper">
				<div class="row">
					<div class="col-sm-4 grid-margin">
						<div class="card">
							<div class="card-body">
								<h5>Total machines</h5>
								<div class="row">
									<div class="col-8 col-sm-12 col-xl-8 my-auto">
										<div class="d-flex d-sm-block d-md-flex align-items-center">
											<h2 class="mb-0">13</h2>
											<p class="text-success ml-2 mb-0 font-weight-medium">machines</p>
										</div>
									</div>
									<div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
										<i class="icon-lg mdi mdi-monitor text-success ml-auto"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 grid-margin">
						<div class="card">
							<div class="card-body">
								<h5>Total salles</h5>
								<div class="row">
									<div class="col-8 col-sm-12 col-xl-8 my-auto">
										<div class="d-flex d-sm-block d-md-flex align-items-center">
											<h2 class="mb-0">6</h2>
											<p class="text-success ml-2 mb-0 font-weight-medium">salles</p>
										</div>
									</div>
									<div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
										<i class="icon-lg mdi mdi-view-grid text-danger ml-auto"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-4 grid-margin">
						<div class="card">
							<div class="card-body">
								<h5>Purchase</h5>
								<div class="row">
									<div class="col-8 col-sm-12 col-xl-8 my-auto">
										<div class="d-flex d-sm-block d-md-flex align-items-center">
											<h2 class="mb-0">90069 $</h2>
											<p class="text-danger ml-2 mb-0 font-weight-medium"></p>
										</div>
									</div>
									<div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
										<i class="icon-lg mdi mdi-cash-usd text-success ml-auto"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<h4 class="card-title">Nombre de machines par salle</h4>
							<div id="chartContainer" style="height: 375px; width: 1060px;"></div>
							<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
						</div>
					</div>
				</div>
			</div>


		</div>
		<br>
		<hr style="color: red; style: solid;">
		<div id="chartContainer" style="height: 10px; width: 100%;"></div>

		<script type="text/javascript">
			window.onload = function() {
		<%if (dataPoints != null) {%>
			var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled : true,
					exportEnabled : true,
					title : {
						text : " "
					},
					data : [ {
						type : "column", //change type to bar, line, area, pie, etc
						dataPoints :
		<%out.print(dataPoints);%>
			} ]
				});
				chart.render();
		<%}%>
			}
		</script>

		<!-- main-panel ends -->
	</div>
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
</body>
<!-- content-wrapper ends -->
<!-- partial:partials/_footer.html -->
<footer class="footer">
	<div
		class="d-sm-flex justify-content-center justify-content-sm-between">
		<span
			class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
			© manalMachines.com 2022</span> <span
			class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">

		</span>
	</div>
</footer>
<!-- partial -->
</html>