<html>
	<body>
		<% session.invalidate();
		   response.sendRedirect("Login.jsp");
		%>
	</body>
</html>