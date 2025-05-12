<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback Submitted</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    .success-container {
      text-align: center;
      padding: 40px;
    }

    .success-icon {
      font-size: 80px;
      color: #4CAF50;
      margin-bottom: 20px;
    }

    .action-links {
      margin-top: 40px;
    }

    .action-links a {
      display: inline-block;
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      margin: 0 10px;
    }
  </style>
</head>
<body>

<div class="feedback-container">
  <div class="success-container">
    <div class="success-icon">✓</div>
    <h1>Thank You for Your Feedback!</h1>
    <p>Your feedback has been successfully submitted. We appreciate your input as it helps us improve our products and services.</p>

    <div class="action-links">
      <a href="feedbackIndex.jsp">Return to Home</a>
      <a href="viewFeedbacks.jsp">View All Feedbacks</a>
    </div>
  </div>
</div>

</body>
</html>