package servlets;

import dao. AdminDAO;
import model.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("adminId");
        String name = request.getParameter("adminName");
        String email = request.getParameter("adminEmail");
        String password = request.getParameter("adminPassword");

        Admin admin = new Admin(id, name, email, password);

        String path = getServletContext().getRealPath("/") + "admins.txt";
        AdminDAO dao = new AdminDAO(path);
        dao.addAdmin(admin);

        response.sendRedirect("manage_users.jsp");
    }
}

