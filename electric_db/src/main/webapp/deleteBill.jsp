<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="electric_db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Electricity Bill</title>
    <link rel="stylesheet" href="style3.css"> <!-- Add your CSS for styling -->
</head>
<body>
    <%
        int billId = 0;
        String customerName = "";
        int unitsConsumed = 0;
        double totalAmount = 0.0;
        Date billDate = null;

        try {
            // Get the Bill ID from the request
            billId = Integer.parseInt(request.getParameter("billId"));

            // Retrieve the bill details from the database
            try (Connection connection = DBConnection.getConnection()) {
                String sql = "SELECT * FROM electricity_bills WHERE bill_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, billId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    customerName = rs.getString("customer_name");
                    unitsConsumed = rs.getInt("units_consumed");
                    totalAmount = rs.getDouble("total_amount");
                    billDate = rs.getDate("bill_date");
                } else {
                    out.println("<p>Bill not found. <a href='viewBills.jsp'>Go back</a></p>");
                    return;
                }
            }
        } catch (NumberFormatException e) {
            out.println("<p>Invalid Bill ID. <a href='viewBills.jsp'>Go back</a></p>");
            return;
        } catch (Exception e) {
            out.println("<p>Error occurred: " + e.getMessage() + ". <a href='viewBills.jsp'>Go back</a></p>");
            return;
        }
    %>

    <h1>Delete Electricity Bill</h1>
    <p>Are you sure you want to delete the following bill?</p>

    <!-- Display the bill details -->
    <p><strong>Bill ID:</strong> <%= billId %></p>
    <p><strong>Customer Name:</strong> <%= customerName %></p>
    <p><strong>Units Consumed:</strong> <%= unitsConsumed %></p>
    <p><strong>Total Amount:</strong> <%= totalAmount %></p>
    <p><strong>Bill Date:</strong> <%= billDate %></p>

    <!-- Form to confirm deletion -->
    <form action="DeleteBillServlet" method="get">
        <input type="hidden" name="billId" value="<%= billId %>">
        <input type="submit" value="Delete">
    </form>
    <br>
    <a href="viewBills.jsp">Cancel</a>
</body>
</html>
