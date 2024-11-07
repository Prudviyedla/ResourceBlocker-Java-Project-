<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<style>
		.header-bar {
			background-color: #006400; /* Dark green color */
			padding: 10px;
		}

		.header-text {
			color: white;
			font-size: 18px;
			font-weight: bold;
			margin: 0;
		}

		table {
			border-collapse: collapse;
			width: 75%;
			margin: 20px auto;
			font-size: 1em;
			font-family: sans-serif;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}

		th {
			background-color: #006400; /* Dark green color */
			color: #fff;
			font-weight: bold;
			padding: 12px 15px;
			text-align: center;
		}

		td {
			border-bottom: 1px solid #ddd;
			padding: 12px 15px;
			text-align: center;
		}

		tr:hover {
			background-color: #f5f5f5;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="header-bar">
		<h2 class="header-text">All The Reservations</h2>
	</div>
	<table>
		<tr>
			<th>RID</th>
			<th>Employee ID</th>
			<th>Resource ID</th>
			<th>Start Time</th>
			<th>End Time</th>
			<th>Status</th>
			<th>Resource Name</th>
		</tr>
		<c:forEach var="res" items="${reservations}">
			<tr>
				<td>${res.id}</td>
				<td>${res.employeeId}</td>
				<td>${res.resourceId}</td>
				<td>${res.startTime}</td>
				<td>${res.endTime}</td>
				<td>${res.status}</td>
				<td>${res.resourceName}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
