<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Electricity Bill</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Add Electricity Bill</h1>
        <form action="AddBillServlet" method="post" class="p-4 bg-white rounded shadow-sm">
            <div class="mb-3">
                <label for="billId" class="form-label">Bill ID:</label>
                <input type="number" id="billId" name="billId" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="customerName" class="form-label">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="unitsConsumed" class="form-label">Units Consumed:</label>
                <input type="number" id="unitsConsumed" name="unitsConsumed" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="totalAmount" class="form-label">Total Amount:</label>
                <input type="text" id="totalAmount" name="totalAmount" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="billDate" class="form-label">Bill Date:</label>
                <input type="date" id="billDate" name="billDate" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Add Bill</button>
            <div class="text-center mt-3">
                <a href="viewBills.jsp" class="text-decoration-none">View All Bills</a>
            </div>
        </form>
    </div>
</body>
</html>
