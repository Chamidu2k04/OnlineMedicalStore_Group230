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
                                <span class="medicine-name">${review.medicine}</span>
                                <span class="username">${review.userName}</span>
                                <span class="review-date">${review.date}</span>
                            </div>
                            <div class="feedback-body">
                                <p class="review-text">${review.text}</p>
                            </div>
                            <div class="feedback-footer">
                                <span class="review-rating">Rating: ${review.rating}</span>
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
