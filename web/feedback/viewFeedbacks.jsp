<html>
<head>
    <title>View Feedback</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="feedback-container">

    <!-- Header -->
    <header>
        <h1>Customer Feedbacks</h1>
        <p>Here's what others have said about the medicines!</p>
    </header>

    <!-- Displaying Existing Feedbacks -->
    <section class="feedback-list">
        <h2>Previous Feedbacks</h2>
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
                            <div class="stars-display">
                                <c:forEach begin="1" end="${review.rating}">
                                    <span class="star filled">&#9733;</span>
                                </c:forEach>
                                <c:forEach begin="${review.rating + 1}" end="5">
                                    <span class="star">&#9733;</span>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty reviews}">
            <p class="no-feedback">No reviews available yet.</p>
        </c:if>

        <div class="action-buttons">
            <a href="submitFeedback.jsp" class="btn">Submit Your Feedback</a>
        </div>
    </section>

</div>

</body>
</html>