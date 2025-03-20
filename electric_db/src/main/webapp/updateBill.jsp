<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="electric_db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Electricity Bill</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
    <%
        int billId = Integer.parseInt(request.getParameter("billId"));
        String customerName = "";
        int unitsConsumed = 0;
        double totalAmount = 0.0;
        Date billDate = null;

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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <h1>Update Electricity Bill</h1>
    <form action="UpdateBillServlet" method="post">
        <input type="hidden" name="billId" value="<%= billId %>">
        
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="<%= customerName %>" required><br><br>
        
        <label for="unitsConsumed">Units Consumed:</label>
        <input type="number" id="unitsConsumed" name="unitsConsumed" value="<%= unitsConsumed %>" required><br><br>
        
        <label for="totalAmount">Total Amount:</label>
        <input type="text" id="totalAmount" name="totalAmount" value="<%= totalAmount %>" required><br><br>
        
        <label for="billDate">Bill Date:</label>
        <input type="date" id="billDate" name="billDate" value="<%= billDate %>" required><br><br>
        
        <input type="submit" value="Update Bill">
    </form>
    <br>
    <a href="viewBills.jsp">Cancel</a>
</body>
</html>
