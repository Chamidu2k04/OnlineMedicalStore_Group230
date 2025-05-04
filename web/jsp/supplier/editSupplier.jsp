<%@ page import="model.Supplier,storage.SupplierStorage" %>
<%
    String id = request.getParameter("id");
    Supplier s = SupplierStorage.getSupplierById(id);
%>
<h2>Edit Supplier</h2>
<form action="../../EditSupplierServlet" method="post">
    ID: <input type="text" name="id" value="<%=s.getId()%>" readonly><br>
    Name: <input type="text" name="name" value="<%=s.getName()%>"><br>
    Contact: <input type="text" name="contact" value="<%=s.getContact()%>"><br>
    Email: <input type="email" name="email" value="<%=s.getEmail()%>"><br>
    <input type="submit" value="Update">
</form>
