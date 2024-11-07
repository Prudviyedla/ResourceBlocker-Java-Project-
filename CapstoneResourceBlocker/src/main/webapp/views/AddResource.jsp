<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Resource</title>
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
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff; /* White color */
}

.header h1 {
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

.container input[type="text"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.container input[type="submit"] {
    background-color: #006400; /* Dark green color */
    color: #fff; /* White color */
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    transition: all 0.3s ease-in-out;
}

.container input[type="submit"]:hover {
    background-color: #004F00; /* Dark green color with lighter shade */
    color: #fff; /* White color */
    transform: translateY(-3px);
}

.card {
    position: absolute;
    top: 30px;
    right: 30px;
}

.card input[type="submit"] {
    background-color: #006400; /* Dark green color */
    color: #fff; /* White color */
    padding: 12px 24px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
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
        <h1>Add Resource</h1>
        <div class="header-right">
            <form action="/resources">
                <input type="submit" value="Display All Resources">
            </form>
        </div>
    </div>
    <div class="container">
    <form action="/resource" method="post" modelAttribute="resource" autocomplete="off" onsubmit="return validateForm()">
        <input type="text" placeholder="Location" name="location" required><br><br>
        <input type="text" placeholder="Type" name="type" required><br><br>
        <input type="text" placeholder="Resource ID" name="resourceId" required title="Resource ID is required"><br>
        <span class="error-message" id="resourceId-error"></span><br>
        <input type="text" placeholder="Resource Name" name="rName" required><br>
        <span class="error-message" id="rName-error"></span><br>
        <input type="text" placeholder="Capacity" name="capacity" required pattern="[0-9]+" title="Capacity must be a number"><br>
        <span class="error-message" id="capacity-error"></span><br>
        <input type="submit" value="Add Resource">
        <p id="error-msg" class="error-message"></p>
    </form>
</div>

<script>
    function validateForm() {
        var locationInput = document.forms[0].elements["location"];
        var typeInput = document.forms[0].elements["type"];
        var resourceIdInput = document.forms[0].elements["resourceId"];
        var rNameInput = document.forms[0].elements["rName"];
        var capacityInput = document.forms[0].elements["capacity"];
        var errorMsg = document.getElementById('error-msg');
        var resourceIdError = document.getElementById('resourceId-error');
        var rNameError = document.getElementById('rName-error');
        var capacityError = document.getElementById('capacity-error');

        if (locationInput.value === "" || typeInput.value === "" || resourceIdInput.value === "" || rNameInput.value === "" || capacityInput.value === "") {
            errorMsg.textContent = "Please fill in all the fields.";
            return false;
        }

        if (!/^[0-9]+$/.test(capacityInput.value)) {
            capacityError.textContent = "Capacity must be a number.";
            return false;
        }

        errorMsg.textContent = "";
        resourceIdError.textContent = ""; // Clear the previous error message

        return true;
    }
</script>

</body>
</html>
