import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import electric_db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBillServlet")
public class DeleteBillServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billIdParam = request.getParameter("billId");

        try {
            int billId = Integer.parseInt(billIdParam);

            try (Connection connection = DBConnection.getConnection()) {
                String sql = "DELETE FROM electricity_bills WHERE bill_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, billId);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    // Redirect with a success message
                    response.sendRedirect("viewBills.jsp?message=Bill+ID+" + billId + "+deleted+successfully");
                } else {
                    // Redirect with an error message
                    response.sendRedirect("viewBills.jsp?error=Bill+ID+" + billId + "+not+found");
                }
            }
        } catch (NumberFormatException e) {
            // Redirect with an error message for invalid input
            response.sendRedirect("viewBills.jsp?error=Invalid+Bill+ID");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect with a general error message
            response.sendRedirect("viewBills.jsp?error=An+error+occurred");
        }
    }
}
