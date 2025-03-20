import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import electric_db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddBillServlet")
public class AddBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int id=Integer.parseInt(request.getParameter("billId"));       
    	String name = request.getParameter("customerName");
        int units = Integer.parseInt(request.getParameter("unitsConsumed"));
        double amount = Double.parseDouble(request.getParameter("totalAmount"));
        String billDate = request.getParameter("billDate");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "INSERT INTO electricity_bills (bill_id, customer_name, units_consumed, total_amount, bill_date) VALUES (?, ?, ?, ?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, units);
            ps.setDouble(4, amount);
            ps.setString(5, billDate);
            ps.executeUpdate();
            
            response.sendRedirect("viewBills.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
