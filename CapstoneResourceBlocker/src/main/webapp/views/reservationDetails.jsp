
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Details</title>
    <style>
        body {
            background-color: #f0f8ff;
            font-family: Arial, sans-serif;
            color: #000000;
        }

        .container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        h1 {
            color: #008b8b;
            text-align: center;
        }

        p {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Reservation Details</h1>
    <c:if test="${not empty reservation}">
        <div class="container">
            <p>ID: ${reservation.id}</p>
            <p>Employee ID: ${reservation.employeeId}</p>
            <p>Resource ID: ${reservation.resourceId}</p>
            <p>Start Time: ${reservation.startTime}</p>
            <p>End Time: ${reservation.endTime}</p>
            <p>Resource Name: ${reservation.resourceName}</p>
            <p>Status: ${reservation.status}</p>
            <c:if test="${reservation.status == 'PENDING'}">
                <%-- <form method="GET" action="approveReservation/${reservation.id}">
                    <button>Approve</button>
                </form>
                <form method="GET" action="rejectReservation/${reservation.id}">
                    <button>Reject</button>
                </form> --%>
            </c:if>
        </div>
    <%-- </c:if>
    <c:if test="${empty reservation}">
        <div class="container">
            <p>Reservation not found.</p>
        </div>
    </c:if> --%>
</body>
</html>

