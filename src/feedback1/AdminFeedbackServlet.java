package feedback1;

import model.Feedback;
import service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AdminFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackService service = new FeedbackService();

        try {
            List<Feedback> feedbacks = service.getAllFeedbacks();
            request.setAttribute("reviews", feedbacks);
            request.getRequestDispatcher("adminModeration.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading feedback for admin", e);
        }
    }
} 