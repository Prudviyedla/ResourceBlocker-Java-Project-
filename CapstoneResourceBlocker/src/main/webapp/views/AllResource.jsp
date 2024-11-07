<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
	<style>
		body {
			background-color: #F7F7F7;
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}

		h1 {
			background-color: #006400; /* Dark green color */
			color: #FFF; /* White color */
			padding: 30px;
			margin: 0;
		}

		table {
			width: 75%;
			border-collapse: collapse;
			margin: 20px auto;
			border: 1px solid #CCC;
			background-color: #FFF; /* White color */
		}

		th {
			background-color: #006400; /* Dark green color */
			color: #FFF; /* White color */
			font-weight: bold;
			padding: 8px;
			text-align: left;
		}

		td {
			padding: 8px;
			border-bottom: 1px solid #CCC;
		}

		a {
			background-color: #006400; /* Dark green color */
			border: none;
			color: #FFF; /* White color */
			cursor: pointer;
			padding: 8px 16px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			transition-duration: 0.4s;
			border-radius: 8px;
		}

		a:hover {
			background-color: #004F00; /* Dark green color with lighter shade */
		}
	</style>
</head>
<body>
	<h1>All Resources</h1>
	<table>
		<tr>
			<th>RID</th>
			<th>Location</th>
			<th>Type</th>
			<th>Resource ID</th>
 			<th>Resource Name</th>
			<th>Capacity</th>
			<th>DELETE</th>
		</tr>
		<c:forEach var="res" items="${resources}">
			<tr>
				<td>${res.rId}</td>
				<td>${res.location}</td>
				<td>${res.type}</td>
				<td>${res.resourceId}</td>
 				<td>${res.rName}</td>
				<td>${res.capacity}</td>
				<td><a href="/resource/${res.rId}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
