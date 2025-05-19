package servlet;

import storage.FeedbackStorage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteFeedbackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            FeedbackStorage.deleteFeedback(id);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        response.sendRedirect("feedback/list.jsp");
    }
}
