package supplier;

import model.Supplier;
import storage.SupplierStorage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddSupplierServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String type = request.getParameter("type");

        Supplier supplier = new Supplier(id, name, contact, email, type);


        try {
            SupplierStorage.addSupplier(supplier);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while adding supplier.");
            return;
        }

        response.sendRedirect("supplier/list.jsp");
    }
}
