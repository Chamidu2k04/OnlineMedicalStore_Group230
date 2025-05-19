--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.io.*, dao.AdminDAO, model.Admin" %>
<%
  String path = application.getRealPath("/") + "admins.txt";
  AdminDAO dao = new AdminDAO(path);
  List<Admin> adminList = dao.getAllAdmins();

  String errorMsg = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      padding: 20px;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    th, td {
      border: 1px solid #aaa;
      padding: 10px;
      text-align: left;
    }
    th {
      background-color: #eee;
    }
    .button-group {
      margin-top: 20px;
      display: flex;
      justify-content: space-between;
    }
    .btn {
      padding: 10px 16px;
      border: none;
      border-radius: 4px;
      color: white;
      cursor: pointer;
    }
    .btn-delete {
      background-color: #dc3545;
    }
    .btn-back {
      background-color: #007bff;
    }
    .error {
      color: red;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Admin List</h2>

  <% if (errorMsg != null) { %>
  <p class="error"><%= errorMsg %></p>
  <% } %>

  <form action="DeleteAdminServlet" method="post">
    <table>
      <thead>
      <tr>
        <th>Select</th>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
      </tr>
      </thead>
      <tbody>
      <% for (Admin admin : adminList) { %>
      <tr>
        <td><input type="checkbox" name="adminIds" value="<%= admin.getId() %>"></td>
        <td><%= admin.getId() %></td>
        <td><%= admin.getName() %></td>
        <td><%= admin.getEmail() %></td>
      </tr>
      <% } %>
      </tbody>
    </table>

    <div class="button-group">
      <button type="submit" class="btn btn-delete">Delete Selected</button>
      <a href="dashboard.jsp" class="btn btn-back">Back to Dashboard</a>
    </div>
  </form>
</div>
</body>
</html>

