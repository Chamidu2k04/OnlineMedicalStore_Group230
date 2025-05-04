package controller.supplier;

import model.Supplier;
import storage.SupplierStorage;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AddSupplierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");

            Supplier s = new Supplier(id, name, contact, email);
            SupplierStorage.addSupplier(s);
            response.sendRedirect("jsp/supplier/viewSuppliers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
