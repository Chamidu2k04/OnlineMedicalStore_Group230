package servlet;

import service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String medicineName = request.getParameter("medicineName");

        if (userName != null && medicineName != null) {
            try {
                FeedbackService service = new FeedbackService();
                service.deleteFeedback(userName, medicineName);

                // Redirect back to admin page
                response.sendRedirect("adminFeedback");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException("Error deleting feedback", e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters for deletion");
        }
    }
}