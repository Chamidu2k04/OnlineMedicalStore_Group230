public class Feedback {

    //declare attributes
	private String id, userName, comment, date;
    private int rating;

    //parameterized constructor
    public Feedback(String id, String userName, String comment, String date, int rating) {date
        this.id = id;
        this.userName = userName;
        this.comment = comment;
        this.date = date;
        this.rating = rating;
    }

    //getters and setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        if (rating >= 0 && rating <= 10) {
            this.rating = rating;
        }else {
            System.out.println("Invalid rating");
        }
    }
}