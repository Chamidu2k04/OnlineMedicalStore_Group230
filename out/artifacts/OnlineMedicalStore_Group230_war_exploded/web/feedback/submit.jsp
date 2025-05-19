<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Feedback</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f2f5, #d9e4f5);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #444;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/addFeedback" method="post">
    <h2>Submit Your Feedback</h2>

    <label for="medicine">Medicine Name:</label>
    <input type="text" id="medicine" name="medicine" required>

    <label for="username">Your Name:</label>
    <input type="text" id="username" name="username" required>

    <label for="review">Your Feedback:</label>
    <textarea id="review" name="review" rows="4" required></textarea>

    <label for="rating">Rating:</label>
    <select id="rating" name="rating" required>
        <option value="5">5 - Excellent</option>
        <option value="4">4 - Very good</option>
        <option value="3">3 - Good</option>
        <option value="2">2 - Fair</option>
        <option value="1">1 - Poor</option>
    </select>

    <button type="submit">Submit Feedback</button>
</form>
</body>
</html>
