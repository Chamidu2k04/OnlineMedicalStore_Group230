<%@ page import="model.Supplier" %>
<%@ page import="storage.SupplierStorage" %>
<%
    String id = request.getParameter("id");
    Supplier s = null;
    try {
        s = SupplierStorage.getSupplierById(id);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<% if (s != null) { %>
<form action="${pageContext.request.contextPath}/editSupplier" method="post">
    <input type="hidden" name="id" value="<%= s.getId() %>"><br>
    Name: <input type="text" name="name" value="<%= s.getName() %>"><br>
    Contact: <input type="text" name="contact" value="<%= s.getContact() %>"><br>
    <input type="submit" value="Update Supplier">
</form>
<% } else { %>
<p>Supplier not found.</p>
<% } %>
