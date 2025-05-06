<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Medical Store - Feedback System</title>
    <link rel="stylesheet" href="feedback/styles.css">
    <style>
        .welcome-container {
            text-align: center;
            padding: 40px;
        }

        .options {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }

        .option-card {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            width: 250px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .option-card:hover {
            transform: translateY(-5px);
        }

        .option-card i {
            font-size: 40px;
            color: #4CAF50;
            margin-bottom: 15px;
        }

        .option-card h3 {
            color: #333;
            margin-bottom: 10px;
        }

        .option-card a {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .admin-link {
            margin-top: 40px;
            text-align: right;
        }

        .admin-link a {
            color: #555;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="feedback-container">
    <div class="welcome-container">
        <h1>Welcome to Online Medical Store</h1>
        <p>Your health is our priority. Share your experiences and help others make informed decisions.</p>

        <div class="options">
            <div class="option-card">
                <i>📝</i>
                <h3>Submit Feedback</h3>
                <p>Share your experience with medicines you've used.</p>
                <a href="feedback/submitFeedback.jsp">Submit Now</a>
            </div>

            <div class="option-card">
                <i>👀</i>
                <h3>View Feedbacks</h3>
                <p>See what others are saying about medicines.</p>
                <a href="feedback/viewFeedbacks.jsp">View All</a>
            </div>
        </div>

        <div class="admin-link">
            <a href="feedback/adminModeration.jsp">Admin Access</a>
        </div>
    </div>
</div>

</body>
</html>