package servlet;

import model.Feedback;
import storage.FeedbackStorage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ListFeedbackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Feedback> feedbacks = FeedbackStorage.getAllFeedbacks();
            request.setAttribute("feedbacks", feedbacks);
            RequestDispatcher dispatcher = request.getRequestDispatcher("feedback/list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
