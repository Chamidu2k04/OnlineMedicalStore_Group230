package servlet;

import model.Feedback;
import storage.FeedbackStorage;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String medicine = request.getParameter("medicine");
        String username = request.getParameter("username");
        String review = request.getParameter("review");
        int rating = Integer.parseInt(request.getParameter("rating"));

        Feedback f = new Feedback(id, medicine, username, review, rating);
        try {
            FeedbackStorage.updateFeedback(f);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        response.sendRedirect("feedback/list.jsp");
    }
}
