<%
    String errorMsg = request.getParameter("error");
    if (errorMsg != null) {
%>
<p style="color:red;"><%= errorMsg %></p>
<%
    }
%>


<%@ page import="java.util.*, java.io.*, dao.AdminDAO, model.Admin" %>
<%
    String path = application.getRealPath("/") + "admins.txt";
    AdminDAO dao = new AdminDAO(path);
    String nextId = dao.getNextId();  // ✨ Get the auto-increment ID
    List<Admin> adminList = dao.getAllAdmins();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 30px;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-green {
            margin-top: 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-green:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
        }

        .button-group {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn-red {
            background-color: #dc3545;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-red:hover {
            background-color: #c82333;
        }

        .btn-blue {
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-blue:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Manage Admin Dashboard</h2>
    <form action="AddAdminServlet" method="post">
        <label>ID:</label>
        <input type="text" name="adminId" value="<%= nextId %>" readonly>


        <label>Name:</label>
        <input type="text" name="adminName" value="Edison">

        <label>Email:</label>
        <input type="email" name="adminEmail" value="edison@example.com">

        <label>Password:</label>
        <input type="password" name="adminPassword" value="********">

        <button type="submit" class="btn-green">Add Admin</button>
    </form>


        <div style="text-align: right;">
            <a href="admin_list.jsp" class="btn-blue" style="padding: 10px 16px; background-color: #007bff; color: white; text-decoration: none; border-radius: 4px;">
                View Admin List
            </a>
        </div>





    <div class="button-group">

        <form action="admin_manage.jsp" method="get" style="display: inline;">
            <button type="submit" class="btn-blue">Back to Dashboard</button>
        </form>
    </div>
</div>
</body>
</html>


