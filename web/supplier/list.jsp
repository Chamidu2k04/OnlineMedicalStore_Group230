<%@ page import="java.util.*, model.Supplier, storage.SupplierStorage" %>
<%
    List<Supplier> list = SupplierStorage.getAllSuppliers();
%>
<h2>Suppliers</h2>
<a href="add.jsp">Add Supplier</a><br><br>
<link rel="stylesheet" href="../styles/suppliers.css">
<table border="1">
    <tr><th>ID</th><th>Name</th><th>Contact</th><th>Actions</th></tr>
    <% for (Supplier s : list) { %>
    <tr>
        <td><%= s.getId() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getContact() %></td>
        <td>
            <a href="edit.jsp?id=<%= s.getId() %>">Edit</a>
            <a href="${pageContext.request.contextPath}/deleteSupplier?id=<%= s.getId() %>">Delete</a>
        </td>
    </tr>
    <% } %>
</table>
