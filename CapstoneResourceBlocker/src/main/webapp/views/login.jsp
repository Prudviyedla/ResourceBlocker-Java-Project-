<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f8ff;
        }

        .container {
            width: 300px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .container h1 {
            text-align: center;
            color: #008b8b;
            margin-bottom: 20px;
        }

        .container label {
            display: block;
            margin-bottom: 5px;
            color: #000000;
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .container .error {
            color: red;
            margin-top: 5px;
            font-size: 14px;
        }

        .container button[type="submit"] {
            background-color: #008b8b;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .container button[type="submit"]:hover {
            background-color: #006666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Page</h1>
        <form action="/login" method="post" onsubmit="return validateForm()">
            <p>
                <label for="username">Username:</label>
                <input type="text" name="username" id="username">
            </p>
            <p>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password">
            </p>
            <button type="submit">Login</button>
            <p id="error-msg" class="error"></p>
        </form>
    </div>

   <script>
    function validateForm() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var errorMsg = document.getElementById('error-msg');
        var emailPattern = /@gmail\.com$|@wipro\.com$/;

        if (username.trim() === '' || password.trim() === '') {
            errorMsg.textContent = "Please enter both username and password.";
            return false;
        } else if (!emailPattern.test(username)) {
            errorMsg.textContent = "Username should end with @gmail.com or @wipro.com.";
            return false;
        } else if (password.includes(' ')) {
            errorMsg.textContent = "Password should not contain empty spaces.";
            return false;
        } else {
            errorMsg.textContent = "";
            return true;
        }
    }
</script>

</body>
</html>
