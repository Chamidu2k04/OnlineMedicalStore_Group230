package controller.supplier;

import model.Supplier;
import storage.SupplierStorage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewSuppliersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Supplier> suppliers = SupplierStorage.getAllSuppliers();
            request.setAttribute("suppliers", suppliers);
        } catch (Exception e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("supplier/list.jsp");
        dispatcher.forward(request, response);
    }
}
