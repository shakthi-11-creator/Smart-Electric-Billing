import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import electric_db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBillServlet")
public class UpdateBillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("billId"));
        String name = request.getParameter("customerName");
        int units = Integer.parseInt(request.getParameter("unitsConsumed"));
        double amount = Double.parseDouble(request.getParameter("totalAmount"));
        String billDate = request.getParameter("billDate");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "UPDATE electricity_bills SET customer_name=?, units_consumed=?, total_amount=?, bill_date=? WHERE bill_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, units);
            ps.setDouble(3, amount);
            ps.setString(4, billDate);
            ps.setInt(5, billId);
            ps.executeUpdate();

            response.sendRedirect("viewBills.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
