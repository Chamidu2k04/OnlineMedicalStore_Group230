package supplier;

import storage.SupplierStorage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteSupplierServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            SupplierStorage.deleteSupplier(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("supplier/list.jsp");
    }
}
