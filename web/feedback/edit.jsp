<%@ page import="model.Feedback" %>
<%@ page import="storage.FeedbackStorage" %>
<%
    String id = request.getParameter("id");
    Feedback f = null;
    try {
        f = FeedbackStorage.getFeedbackById(id);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Feedback</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: #333;
            margin: 40px auto;
            max-width: 600px;
            padding: 0 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 30px;
            font-size: 2rem;
        }

        form {
            background-color: #fff;
            padding: 30px 35px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #34495e;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1.8px solid #ccc;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
            font-family: inherit;
            resize: vertical;
        }

        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: #2980b9;
            outline: none;
            box-shadow: 0 0 8px rgba(41, 128, 185, 0.3);
        }

        textarea {
            min-height: 100px;
        }

        input[type="submit"] {
            background-color: #2980b9;
            color: white;
            font-weight: 700;
            font-size: 1.1rem;
            border: none;
            padding: 14px;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }

        input[type="submit"]:hover {
            background-color: #1c5980;
            box-shadow: 0 5px 15px rgba(28, 89, 128, 0.6);
        }

        p {
            text-align: center;
            color: #e74c3c;
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 40px;
        }
    </style>


</head>
<body>
<h2>Edit Feedback</h2>

<% if (f != null) { %>
<form action="${pageContext.request.contextPath}/editFeedback" method="post">
    <input type="hidden" name="id" value="<%= f.getId() %>">

    <label for="medicine">Medicine Name:</label>
    <input type="text" id="medicine" name="medicine" value="<%= f.getMedicine() %>" required><br><br>

    <label for="username">Your Name:</label>
    <input type="text" id="username" name="username" value="<%= f.getUsername() %>" required><br><br>

    <label for="review">Your Feedback:</label><br>
    <textarea id="review" name="review" rows="4" cols="50" required><%= f.getReview() %></textarea><br><br>

    <label for="rating">Rating:</label>
    <select id="rating" name="rating" required>
        <option value="5" <%= f.getRating() == 5 ? "selected" : "" %>>5 - Excellent</option>
        <option value="4" <%= f.getRating() == 4 ? "selected" : "" %>>4 - Very Good</option>
        <option value="3" <%= f.getRating() == 3 ? "selected" : "" %>>3 - Good</option>
        <option value="2" <%= f.getRating() == 2 ? "selected" : "" %>>2 - Fair</option>
        <option value="1" <%= f.getRating() == 1 ? "selected" : "" %>>1 - Poor</option>
    </select><br><br>

    <input type="submit" value="Update Feedback">
</form>
<% } else { %>
<p>Feedback not found for ID: <%= id %></p>
<% } %>
</body>
</html>
