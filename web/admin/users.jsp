<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.java.model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .btn {
            display: inline-block;
            padding: 8px 12px;
            margin: 5px;
            text-decoration: none;
            border-radius: 4px;
            color: white;
            font-size: 14px;
        }
        .btn-add {
            background-color: #28a745;
        }
        .btn-view {
            background-color: #17a2b8;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #212529;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .search-box {
            margin: 20px 0;
            padding: 10px;
            background: #f9f9f9;
            border-radius: 5px;
            display: flex;
        }
        .search-box input[type="text"] {
            flex-grow: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
        }
        .search-box button {
            padding: 8px 15px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        .actions {
            display: flex;
            gap: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>User Management</h1>

    <!-- Message display -->
    <% if(request.getAttribute("message") != null) { %>
    <div class="message success">
        <%= request.getAttribute("message") %>
    </div>
    <% } %>

    <% if(request.getAttribute("error") != null) { %>
    <div class="message error">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <!-- Search Box -->
    <div class="search-box">
        <form action="${pageContext.request.contextPath}/admin/user" method="get">
            <input type="hidden" name="action" value="search">
            <input type="text" name="searchTerm" placeholder="Search users..."
                   value="<%= request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm") : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Add User Button -->
    <div>
        <a href="${pageContext.request.contextPath}/admin/user?action=add" class="btn btn-add">Add New User</a>
    </div>

    <!-- Users Table -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if(users != null && !users.isEmpty()) {
                for(User user : users) {
        %>
        <tr>
            <td><%= user.getUserId() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getFullName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
            <td class="actions">
                <a href="${pageContext.request.contextPath}/admin/user?action=view&id=<%= user.getUserId() %>" class="btn btn-view">View</a>
                <a href="${pageContext.request.contextPath}/admin/user?action=edit&id=<%= user.getUserId() %>" class="btn btn-edit">Edit</a>
                <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=<%= user.getUserId() %>"
                   class="btn btn-delete"
                   onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No users found</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div style="margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
    </div>
</div>
</body>
</html>