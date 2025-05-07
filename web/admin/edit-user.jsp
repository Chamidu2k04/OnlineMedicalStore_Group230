<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.java.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
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
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            border: none;
            cursor: pointer;
        }
        .btn-secondary {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit User</h1>

    <% User user = (User) request.getAttribute("user"); %>

    <form action="${pageContext.request.contextPath}/admin/user" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
        </div>

        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="<%= user.getFullName() %>" required>
        </div>

        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="CUSTOMER" <%= "CUSTOMER".equals(user.getRole()) ? "selected" : "" %>>Customer</option>
                <option value="ADMIN" <%= "ADMIN".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn">Update User</button>
            <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>