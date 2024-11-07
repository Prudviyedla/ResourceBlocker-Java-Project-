<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Resource</title>
<style>
body {
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.header {
    background-color: #006400; /* Dark green color */
    padding: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff; /* White color */
}

.header h2 {
    margin: 0;
}

.header-right {
    display: flex;
    gap: 20px;
}

.container {
    width: 400px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #fff; /* White color */
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
}

.container input[type="text"],
.container select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.container input[type="submit"] {
    background-color: #006400; /* Dark green color */
    color: #fff; /* White color */
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.container input[type="submit"]:hover {
    background-color: #004F00; /* Dark green color with lighter shade */
}

.container h2 {
    margin-top: 0;
    color: #333;
}

.table-container {
    width: 100%;
    margin-top: 20px;
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table th, table td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

table th {
    background-color: #006400; /* Dark green color */
    color: #fff; /* White color */
}

.error-message {
    color: red;
    margin-top: 5px;
    font-size: 14px;
}
</style>
</head>

<body>
    <div class="header">
        <h2>Update Resource</h2>
        <div class="header-right">
            <form action="/resources">
                <input type="submit" value="Display All Resources">
            </form>
        </div>
    </div>
    <div class="container">
        <form action="/updateResource" method="post" modelAttribute="resource" autocomplete="off" onsubmit="return validateForm()">
            <input type="text" placeholder="RID" name="rId" required><br><br>
            <input type="text" placeholder="Location" name="location" required><br><br>
            <input type="text" placeholder="Type" name="type" required><br><br>
            <input type="text" placeholder="Resource Name" name="rName" required><br><br>
            <input type="text" placeholder="Capacity" name="capacity" required pattern="[0-9]+" title="Capacity must be a number"><br><br>
            <input type="text" placeholder="Resource ID" name="resourceId" required pattern="[0-9]+" title="Resource ID must be a number"><br><br>
            <input type="submit" value="Update Resource">
            <p id="error-msg" class="error-message"></p>
        </form>
    </div>

    <script>
        function validateForm() {
            var rIdInput = document.forms[0].elements["rId"];
            var locationInput = document.forms[0].elements["location"];
            var typeInput = document.forms[0].elements["type"];
            var rNameInput = document.forms[0].elements["rName"];
            var capacityInput = document.forms[0].elements["capacity"];
            var resourceIdInput = document.forms[0].elements["resourceId"];
            var errorMsg = document.getElementById('error-msg');

            if (rIdInput.value === "" || locationInput.value === "" || typeInput.value === "" || rNameInput.value === "" || capacityInput.value === "" || resourceIdInput.value === "") {
                errorMsg.textContent = "Please fill in all the fields.";
                return false;
            }

            if (!/^[0-9]+$/.test(capacityInput.value)) {
                errorMsg.textContent = "Capacity must be a number.";
                return false;
            }

            if (!/^[0-9]+$/.test(resourceIdInput.value)) {
                errorMsg.textContent = "Resource ID must be a number.";
                return false;
            }

            errorMsg.textContent = "";
            return true;
        }
    </script>
</body>
</html>
