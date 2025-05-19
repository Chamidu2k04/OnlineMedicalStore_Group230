<%@ page import="java.util.*, model.Supplier, storage.SupplierStorage" %>
<%
    List<Supplier> list = SupplierStorage.getAllSuppliers();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier List</title>
    <link rel="stylesheet" href="../styles/suppliers.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap">

</head>
<body>

<h2>Suppliers</h2>
<a href="add.jsp" class="add-supplier">Add Supplier</a>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Type</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Supplier s : list) { %>
    <tr>
      <b> <td data-label="ID"><%= s.getId() %></td></b>
        <td data-label="Name"><%= s.getName() %></td>
        <td data-label="Contact"><%= s.getContact() %></td>
        <td data-label="Email"><%= s.getEmail() %></td>
        <td data-label="Type"><%= s.getType() %></td>
        <td data-label="Actions" class="action-buttons">
            <a href="edit.jsp?id=<%= s.getId() %>" class="edit">
                <i class="fas fa-edit"></i> Edit
            </a>
            <a href="${pageContext.request.contextPath}/deleteSupplier?id=<%= s.getId() %>" class="delete">
                <i class="fas fa-trash-alt"></i> Delete
            </a>
        </td>

    </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
