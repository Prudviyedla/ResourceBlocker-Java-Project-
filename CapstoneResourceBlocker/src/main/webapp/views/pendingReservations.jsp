
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pending Reservations</title>
<style>
    body {
        background-color: #ffffff; /* White color */
        font-family: Arial, sans-serif;
        color: #000000;
    }
    
    h1 {
        color: #006400; /* Dark green color */
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #006400; /* Dark green color */
        color: #ffffff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    form {
        display: inline-block;
    }

    button {
        background-color: #006400; /* Dark green color */
        color: #ffffff;
        border: none;
        padding: 6px 12px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
    }

    button:hover {
        background-color: #004F00; /* Dark green color with lighter shade */
    }

    p {
        margin-top: 20px;
    }
</style>
</head>
<body>
    <h1>Pending Reservations</h1>
    <c:if test="${not empty reservations}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee ID</th>
                    <th>Resource ID</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Resource Name</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${reservations}" var="reservation">
                    <tr>
                        <td>${reservation.id}</td>
                        <td>${reservation.employeeId}</td>
                        <td>${reservation.resourceId}</td>
                        <td>${reservation.startTime}</td>
                        <td>${reservation.endTime}</td>
                        <td>${reservation.resourceName}</td>
                        <td>${reservation.status}</td>
                        <td>
                            <form method="GET" action="approveReservation/${reservation.id}">
                                <button>Approve</button>
                            </form>
                            <form method="GET" action="rejectReservation/${reservation.id}">
                                <button>Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty reservations}">
        <p>No pending reservations.</p>
    </c:if>
</body>
</html>
