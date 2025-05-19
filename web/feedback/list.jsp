<%@ page import="java.util.List" %>
<%@ page import="model.Feedback" %>
<%@ page import="storage.FeedbackStorage" %>
<%
  List<Feedback> feedbacks = null;
  try {
    feedbacks = FeedbackStorage.getAllFeedbacks();
  } catch (Exception e) {
    out.println("Error loading feedbacks: " + e.getMessage());
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback List</title>
  <style>
    /* General body and heading */
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f9fafb;
      color: #333;
      margin: 30px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      font-weight: 700;
      margin-bottom: 25px;
      font-size: 2rem;
    }

    a[href="submit.jsp"] {
      display: inline-block;
      margin-bottom: 20px;
      text-decoration: none;
      background-color: #2980b9;
      color: #fff;
      padding: 10px 18px;
      border-radius: 6px;
      font-weight: 600;
      box-shadow: 0 3px 8px rgba(41, 128, 185, 0.5);
      transition: background-color 0.3s ease;
    }
    a[href="submit.jsp"]:hover {
      background-color: #1c5980;
    }

    /* Table styling */
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 14px 20px;
      text-align: left;
    }

    th {
      background-color: #2980b9;
      color: white;
      font-weight: 600;
      font-size: 1.1rem;
      user-select: none;
    }

    tr:nth-child(even) {
      background-color: #f4f7fa;
    }

    tr:hover {
      background-color: #dbe9f7;
    }

    /* Buttons common */
    .btn {
      text-decoration: none;
      padding: 8px 14px;
      border-radius: 6px;
      font-weight: 600;
      font-size: 0.9rem;
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
      display: inline-block;
    }

    /* Edit button */
    .btn-edit {
      background-color: #27ae60;
      color: white;
      margin-right: 8px;
      box-shadow: 0 3px 8px rgba(39, 174, 96, 0.5);
    }
    .btn-edit:hover {
      background-color: #1e8449;
      box-shadow: 0 5px 14px rgba(30, 132, 73, 0.7);
    }

    /* Delete button */
    .btn-delete {
      background-color: #c0392b;
      color: white;
      box-shadow: 0 3px 8px rgba(192, 57, 43, 0.5);
    }
    .btn-delete:hover {
      background-color: #922b21;
      box-shadow: 0 5px 14px rgba(146, 43, 33, 0.7);
    }

    /* Responsive */
    @media (max-width: 700px) {
      table, th, td {
        display: block;
      }
      th {
        display: none;
      }
      tr {
        margin-bottom: 20px;
        border-radius: 10px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        background-color: #fff;
        padding: 15px;
      }
      td {
        padding: 10px 12px;
        text-align: right;
        position: relative;
        padding-left: 50%;
        font-size: 0.95rem;
        border-bottom: 1px solid #eee;
      }
      td::before {
        content: attr(data-label);
        position: absolute;
        left: 15px;
        width: 45%;
        padding-left: 15px;
        font-weight: 600;
        text-align: left;
        color: #555;
      }
      .btn {
        margin-top: 8px;
        display: inline-block;
      }
    }
  </style>

</head>
<body>
<h2>Customer Feedback</h2>
<a href="submit.jsp">Submit New Feedback</a><br><br>

<table border="1" cellpadding="8">
  <tr>
    <th>Medicine</th>
    <th>Customer</th>
    <th>Review</th>
    <th>Rating</th>
    <th>Actions</th>
  </tr>
  <%
    if (feedbacks != null) {
      for (Feedback f : feedbacks) {
  %>
  <tr>
    <td data-label="Medicine"><%= f.getMedicine() %></td>
    <td data-label="Customer"><%= f.getUsername() %></td>
    <td data-label="Review"><%= f.getReview() %></td>
    <td data-label="Rating"><%= f.getRating() %>/5</td>
    <td data-label="Actions">
      <a class="btn btn-edit" href="edit.jsp?id=<%= f.getId() %>">Edit</a>
      <a class="btn btn-delete" href="<%= request.getContextPath() %>/deleteFeedback?id=<%= f.getId() %>">Delete</a>
    </td>


  </tr>
  <%
      }
    }
  %>
</table>
</body>
</html>
