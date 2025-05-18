package feedback1;

import model.Feedback;
import storage.FeedbackStorage;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class FeedbackServlet  extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get values from form
        String medicine = request.getParameter("medicine");
        String username = request.getParameter("username");
        String review = request.getParameter("review");
        String ratingStr = request.getParameter("rating");

        int rating = (ratingStr != null && !ratingStr.isEmpty()) ? Integer.parseInt(ratingStr) : 0;

        //feedback object creating
        Feedback feedback = new Feedback(medicine, username, review, rating);

        try{
            //store in the file
            new FeedbackStorage().addFeedback(feedback);
            //redirect to thank you page
            response.sendRedirect("feedbackSuccess.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error saving feedback" , e);
        }
    }
}

