<html>
    <head>
        <title>Submit Feedback</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>

    <div class="feedback-container">

        <!-- Header -->
        <header>
            <h1>Customer Feedbacks</h1>
            <p>Your feedback matters! Share your experience with any medicine you've used.</p>
        </header>

        <!-- Feedback Submission Form -->
        <section class="feedback-form">
            <h2>Submit Your Feedback</h2>
            <form action="${pageContext.request.contextPath}/submitFeedback" method="post">
            <label for="medicine">Medicine Name:</label>
                <input type="text" id="medicine" name="medicine" placeholder="Enter medicine name" required>

                <label for="userName">Your Name:</label>
                <input type="text" id="userName" name="username" placeholder="Enter your name" required>

                <label for="reviewText">Your Feedback:</label>
                <textarea id="reviewText" name="review" placeholder="Share your thoughts..." rows="4" required></textarea>

                <label for="rating">Rating:</label>
                <div id="rating" class="rating">
                    <input type="radio" id="star5" name="rating" value="5">
                    <label for="star5">&#9733;</label>

                    <input type="radio" id="star4" name="rating" value="4">
                    <label for="star4">&#9733;</label>

                    <input type="radio" id="star3" name="rating" value="3">
                    <label for="star3">&#9733;</label>

                    <input type="radio" id="star2" name="rating" value="2">
                    <label for="star2">&#9733;</label>

                    <input type="radio" id="star1" name="rating" value="1">
                    <label for="star1">&#9733;</label>
                </div>

                <button type="submit">Submit Feedback</button>
                <button> <a href="feedbackIndex.jsp">Back</a></button>
            </form>

        </section>

    </div>

    </body>
</html>