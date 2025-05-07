<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="main.java.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - View User</title>
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
        .user-info {
            margin-top: 20px;
        }
        .info-item {
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .label {
            font-weight: bold;
            display: inline-block;
            width: 100px;
        }
        .actions {
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            border-radius: 4px;
            margin-right: 10px;
        }
        .btn-edit {
            background-color: #ffc107;
            color: #212529;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-back {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>User Details</h1>

        <%
        User user = (User) request.getAttribute("user");
        if(user != null) {
        %>

    <div class="user-info">
        <div class="info-item">
            <span class="label">User ID:</span>
            <span><%= user.getUserId() %></span>
        </div>
        <div class="info-item">
            <span class="label">Username:</span>
            <span><%= user.getUsername() %></span>
        </div>
        <div class="info-item">
            <span class="label">Full Name:</span>
            <span><%= user.getFullName() %></span>
        </div>
        <div class="info-item">
            <span class="label">Email:</span>
            <span><%= user.getEmail() %></span>
        </div>
        <div class="info-item">
            <span class="label">Role:</span>
            <span><%= user.getRole() %></span>
        </div>
    </div>

    <div class="actions">
        <a href="${pageContext.request.contextPath}/admin/user?action=edit&id=<%= user.getUserId() %>" class="btn btn-edit">Edit</a>
        <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=<%= user.getUserId() %>"
           class="btn