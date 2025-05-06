<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Feedback Moderation</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .admin-actions {
            margin-top: 10px;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-header a {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<div class="feedback-container">
    <div class="admin-header">
        <h1>Admin Feedback Moderation</h1>
        <a href="../index.jsp">Back to Home</a>
    </div>

    <section class="feedback-list">
        <h2>All Customer Feedbacks</h2>
        <c:if test="${not empty reviews}">
            <div class="reviews-container">
                <c:forEach var="review" items="${reviews}">
                    <div class="feedback-box">
                        <div class="feedback-header">
                            <span class="medicine-name">${review.medicineName}</span>
                            <span class="username">By: ${review.userName}</span>
                        </div>
                        <div class="feedback-body">
                            <p class="review-text">${review.feedback}</p>
                        </div>
                        <div class="feedback-footer">
                            <span class="review-rating">Rating: ${review.rating}/5</span>
                            <div class="admin-actions">
                                <form action="deleteFeedback" method="post">
                                    <input type="hidden" name="userName" value="${review.userName}">
                                    <input type="hidden" name="medicineName" value="${review.medicineName}">
                                    <button type="submit" class="delete-btn">Delete Feedback</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty reviews}">
            <p class="no-feedback">No reviews available yet.</p>
        </c:if>
    </section>
</div>

</body>
</html>