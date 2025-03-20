<%@ page import="java.sql.*" %>
<%@ page import="electric_db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bills</title>
    <link rel="stylesheet" href="style1.css">
    <script>
        function confirmDelete(billId) {
            if (confirm("Are you sure you want to delete this bill?")) {
                window.location.href = "DeleteBillServlet?billId=" + billId;
            }
        }
    </script>
</head>
<body>
    <h1>Electricity Bills</h1>
    
    <!-- Display success or error messages -->
    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");
        if (message != null) {
    %>
        <p style="color: green; font-weight: bold;"><%= message %></p>
    <%
        }
        if (error != null) {
    %>
        <p style="color: red; font-weight: bold;"><%= error %></p>
    <%
        }
    %>

    <table border="1">
        <tr>
            <th>Bill ID</th>
            <th>Customer Name</th>
            <th>Units Consumed</th>
            <th>Total Amount</th>
            <th>Bill Date</th>
            <th>Actions</th>
        </tr>
        <%
            try (Connection connection = DBConnection.getConnection()) {
                String sql = "SELECT * FROM electricity_bills";
                PreparedStatement ps = connection.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("bill_id") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getInt("units_consumed") %></td>
            <td><%= rs.getDouble("total_amount") %></td>
            <td><%= rs.getDate("bill_date") %></td>
            <td>
                <a href="updateBill.jsp?billId=<%= rs.getInt("bill_id") %>">Update</a>
                <a href="#" onclick="confirmDelete(<%= rs.getInt("bill_id") %>)">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
