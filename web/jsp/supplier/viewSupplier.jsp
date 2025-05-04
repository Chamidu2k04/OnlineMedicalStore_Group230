<%@ page import="java.util.*,model.Supplier,storage.SupplierStorage" %>
<%
    List<Supplier> list = SupplierStorage.getAllSuppliers();
%>
<h2>All Suppliers</h2>
<a href="addSupplier.jsp">Add New Supplier</a><br><br>
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Contact</th><th>Email</th><th>Actions</th></tr>
    <% for (Supplier s : list) { %>
    <tr>
        <td><%=s.getId()%></td>
        <td><%=s.getName()%></td>
        <td><%=s.getContact()%></td>
        <td><%=s.getEmail()%></td>
        <td>
            <a href="editSupplier.jsp?id=<%=s.getId()%>">Edit</a> |
            <a href="../../DeleteSupplierServlet?id=<%=s.getId()%>">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
