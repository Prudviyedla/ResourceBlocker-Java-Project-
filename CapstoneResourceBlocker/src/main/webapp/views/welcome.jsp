<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
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

        .header-left {
            font-weight: bold;
            font-size: 24px;
        }

        .header-right {
            display: flex;
            gap: 20px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
            margin: 20px;
        }

        .card {
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #006400; /* Dark green color */
            text-align: center;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
        }

        .card input[type="submit"] {
            background-color: #fff;
            color: #000;
            padding: 16px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: all 0.3s ease-in-out;
        }

        .card input[type="submit"]:hover {
            background-color: #004F00; /* Dark green color with lighter shade */
            color: #fff;
            transform: translateY(-3px);
        }

        .card-text {
            margin-top: 10px;
            color: #fff;
        }

        .welcome {
            text-align: center;
            margin-top: 20px;
            color: #000; /* Black color */
            font-size: 24px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-left">Resource Blocker</div>
        <div class="header-right">
            <form action="/updatepassword" method="get">
                <input type="submit" value="Update">
            </form>
            <form action="/logout">
                <input type="submit" value="Logout">
            </form>
        </div>
    </div>
    <div class="welcome">Welcome to the Resource Blocker APP!</div>
    <div class="grid-container">
        <div class="card">
            <form action="ResourceOperations" method="post">
                <input type="submit" value="Resource">
            </form>
            <p class="card-text">Manage Resources</p>
        </div>
        <div class="card">
            <form action="/pendingReservations">
                <input type="submit" value="Reservation Requests">
            </form>
            <p class="card-text">Accept or Reject the Pending Reservations</p>
        </div>
        <div class="card">
            <form action="/reservations">
                <input type="submit" value="All Reservations">
            </form>
            <p class="card-text">List of All Approved and Rejected Requests</p>
        </div>
        <div class="card">
            <form action="/exportToExcel">
                <input type="submit" value="Excel">
            </form>
            <p class="card-text">To Download All Reservations Into Excel Sheet</p>
        </div>
    </div>
</body>
</html>
  