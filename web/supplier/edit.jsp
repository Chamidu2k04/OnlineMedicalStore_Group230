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
<link rel="stylesheet" href="../styles/suppliers.css">
<% if (s != null) { %>
<div class="form-container">
    <h2>Edit Supplier</h2>
    <link rel="stylesheet" href="../styles/edit.css">

    <form action="${pageContext.request.contextPath}/editSupplier" method="post">
        <input type="hidden" name="id" value="<%= s.getId() %>">

        <label for="name">Name</label>
        <input type="text" name="name" value="<%= s.getName() %>" required><br>

        <label for="email">Email Address</label>
        <input type="email" name="email" value="<%= s.getEmail() %>" required><br>

        <label for="type">Supplier Type</label>
        <select name="type" required>
            <option value="Wholesaler" <%= "Wholesaler".equals(s.getType()) ? "selected" : "" %>>Wholesaler</option>
            <option value="Manufacturer" <%= "Manufacturer".equals(s.getType()) ? "selected" : "" %>>Manufacturer</option>
            <option value="Distributor" <%= "Distributor".equals(s.getType()) ? "selected" : "" %>>Distributor</option>
        </select><br>

        <label for="contact">Contact</label>
        <input type="text" name="contact" value="<%= s.getContact() %>" required><br>


        <input type="submit" value="Update Supplier">
    </form>
</div>
<% } else { %>
<p>Supplier not found.</p>
<% } %>
