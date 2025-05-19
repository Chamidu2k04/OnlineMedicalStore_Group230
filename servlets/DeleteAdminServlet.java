package servlets;



import dao.AdminDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] idsToDelete = request.getParameterValues("adminIds");

        if (idsToDelete == null || idsToDelete.length == 0) {
            // No admin was selected
            response.sendRedirect("manage_users.jsp?error=Please+select+at+least+one+admin+to+delete");
            return;
        }

        String path = getServletContext().getRealPath("/") + "admins.txt";
        AdminDAO dao = new AdminDAO(path);
        List<Admin> allAdmins = dao.getAllAdmins();

        List<Admin> updatedList = new ArrayList<>();

        for (Admin a : allAdmins) {
            boolean keep = true;
            for (String id : idsToDelete) {
                if (a.getId().equals(id)) {
                    keep = false;
                    break;
                }
            }
            if (keep) updatedList.add(a);
        }

        // Rewrite the file without the deleted admins
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(path))) {
            for (Admin a : updatedList) {
                bw.write(a.toFileString());
                bw.newLine();
            }
        }

        response.sendRedirect("manage_users.jsp");
    }
}
