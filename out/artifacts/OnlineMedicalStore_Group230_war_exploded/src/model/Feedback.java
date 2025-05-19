package model;

import java.io.Serializable;

public class Feedback implements Serializable {
    private String id;
    private String medicine;
    private String username;
    private String review;
    private int rating;

    public Feedback() {}

    public Feedback(String id, String medicine, String username, String review, int rating) {
        this.id = id;
        this.medicine = medicine;
        this.username = username;
        this.review = review;
        this.rating = rating;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getMedicine() { return medicine; }
    public void setMedicine(String medicine) { this.medicine = medicine; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getReview() { return review; }
    public void setReview(String review) { this.review = review; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
}
