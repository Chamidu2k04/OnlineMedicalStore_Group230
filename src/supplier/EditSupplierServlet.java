package supplier;

import model.Supplier;
import storage.SupplierStorage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditSupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Supplier updated = new Supplier(
                    request.getParameter("id"),
                    request.getParameter("name"),
                    request.getParameter("contact")
            );
            SupplierStorage.updateSupplier(updated);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("supplier/list.jsp");
    }
}
