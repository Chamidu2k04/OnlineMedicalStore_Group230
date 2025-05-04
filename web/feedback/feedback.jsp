<html>
    <head>
        <title>Submit Feedback</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

    <!-- Main Feedback Container -->
    <div class="feedback-container">

        <!-- Header -->
        <header>
            <h1>Customer Feedbacks</h1>
            <p>Your feedback matters! Share your experience with any medicine you've used.</p>
        </header>

        <!-- Feedback Submission Form -->
        <section class="feedback-form">
            <h2>Submit Your Feedback</h2>
            <form action="/submitFeedback" method="post">
                <label for="medicine">Medicine Name:</label>
                <input type="text" id="medicine" name="medicine" placeholder="Enter medicine name" required>

                <label for="userName">Your Name:</label>
                <input type="text" id="userName" name="userName" placeholder="Enter your name" required>

                <label for="reviewText">Your Feedback:</label>
                <textarea id="reviewText" name="reviewText" placeholder="Share your thoughts..." rows="4" required></textarea>

                <label for="rating">Rating:</label>
                <div id="rating" class="rating">
                    <input type="radio" id="star5" name="rating" value="5"><label for="star5" class="star"></label>
                    <input type="radio" id="star4" name="rating" value="4"><label for="star4" class="star"></label>
                    <input type="radio" id="star3" name="rating" value="3"><label for="star3" class="star"></label>
                    <input type="radio" id="star2" name="rating" value="2"><label for="star2" class="star"></label>
                    <input type="radio" id="star1" name="rating" value="1"><label for="star1" class="star"></label>
                </div>

                <button type="submit">Submit Feedback</button>
            </form>
        </section>

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