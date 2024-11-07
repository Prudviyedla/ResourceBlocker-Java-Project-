<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resource Management</title>
<style>
body {
    background-color: #fff; /* White color */
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.header {
    background-color: #006400; /* Dark green color */
    padding: 30px;
    text-align: center;
}

.header h1 {
    color: #fff; /* White color */
    margin: 0;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px;
}

.card {
    width: 250px;
    height: 100px;
    margin: 20px;
    background-color: #006400; /* Dark green color */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    display: flex;
    align-items: center;
    justify-content: center;
}

.card:hover {
    background-color: #004F00; /* Dark green color with lighter shade */
}

.card input[type="submit"] {
    background-color: #fff; /* White color */
    color: #006400; /* Dark green color */
    padding: 16px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
}

.card input[type="submit"]:hover {
    background-color: #006400; /* Dark green color */
    color: #fff; /* White color */
}
</style>
</head>
<body>
	<div class="header">
		<h1>Resource Management</h1>
	</div>
	<div class="container">
		<div class="card">
			<form action="/addResource">
				<input type="submit" value="Add Resource">
			</form>
		</div>
		<div class="card">
			<form action="/updateResource">
				<input type="submit" value="Update Resource">
			</form>
		</div>
		<div class="card">
			<form action="/resources">
				<input type="submit" value="Display All Resources">
			</form>
		</div>
	</div>
</body>
</html>
