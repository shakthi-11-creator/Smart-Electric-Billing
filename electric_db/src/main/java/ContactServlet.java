import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/electricity"; // Replace with your DB URL
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "Shri@2000"; // Replace with your DB password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Validate inputs
        if (name == null || email == null || message == null || name.isEmpty() || email.isEmpty() || message.isEmpty()) {
            out.println("<h3 style='color:red;'>All fields are required!</h3>");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Insert query to store contact details
            String query = "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);

            // Set parameters
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, message);

            // Execute the query
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h3 style='color:green;'>Your message has been submitted successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>An error occurred. Please try again later.</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>An error occurred while processing your request. Please try again later.</h3>");
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
