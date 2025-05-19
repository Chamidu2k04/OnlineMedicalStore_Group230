package servlets;

import dao.AdminDAO;
import model.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String path = getServletContext().getRealPath("/") + "admins.txt";
        AdminDAO dao = new AdminDAO(path);
        Admin admin = dao.validateLogin(username, password);

        if (admin != null) {
            // Valid admin: start session
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("dashboard.jsp");
        } else {
            // Invalid: show error
            request.setAttribute("error", "Invalid username or password!");
            RequestDispatcher rd = request.getRequestDispatcher("admin_login.jsp");
            rd.forward(request, response);
        }
    }
}
