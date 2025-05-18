<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Medical Store - Feedback System</title>
  <link rel="stylesheet" href="styles.css">
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
        <a href="submitFeedback.jsp">Submit Now</a>
      </div>

      <div class="option-card">
        <i>👀</i>
        <h3>View Feedbacks</h3>
        <p>See what others are saying about medicines.</p>
        <a href="viewFeedbacks.jsp">View All</a>
      </div>
    </div>

    <div class="admin-link">
      <a href="adminModeration.jsp">Admin Access</a>
    </div>
  </div>
</div>

</body>
</html>