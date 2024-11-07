<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Password</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
            color: #ffffff;
        }

        h1 {
            color: #008b8b;
        }

        form {
            width: 300px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #000000; /* Updated color to black */
            font-weight: bold;
        }

        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: none;
        }

        .error-message {
            color: red;
            margin-top: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #008b8b;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>
    <h1>Update Password</h1>
    <form action="/updatepassword" method="post" onsubmit="return validateForm()">
        <label for="oldPassword" style="color: #000000;">Current Password:</label>
        <input type="password" id="oldPassword" name="oldPassword" required><br>
        <label for="newPassword" style="color: #000000;">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <p id="error-msg" class="error-message"></p>
        <input type="submit" value="Update Password">
    </form>

    <script>
        function validateForm() {
            var oldPassword = document.getElementById('oldPassword').value;
            var newPassword = document.getElementById('newPassword').value;
            var errorMsg = document.getElementById('error-msg');

            if (newPassword.includes(' ')) {
                errorMsg.textContent = "Password should not contain empty spaces.";
                return false;
            } else if (newPassword.length < 8 || newPassword.length > 12) {
                errorMsg.textContent = "Password should be between 8 and 12 characters.";
                return false;
            } else {
                errorMsg.textContent = "";
                return true;
            }
        }
    </script>
</body>
</html>
