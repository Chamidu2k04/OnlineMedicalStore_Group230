<!DOCTYPE html>
<html>
<head>
    <title>Add Feedback</title>
</head>
<body>
<h2>Submit Feedback</h2>
<form action="add-feedback" method="post">
    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>

    <label>Rating (1 to 5):</label><br>
    <input type="number" name="rating" min="1" max="5" required><br><br>

    <label>Comment:</label><br>
    <textarea name="comment" required></textarea><br><br>

    <input type="submit" value="Submit Feedback">
</form>
</body>
</html>
