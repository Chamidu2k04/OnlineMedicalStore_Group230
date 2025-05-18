package model;

import java.io.Serializable;

public class Feedback implements Serializable {

    private String medicineName;
    private String userName;
    private String feedback;
    private int rating;

    public Feedback(String medicineName, String userName, String feedback, int rating) {
        this.medicineName = medicineName;
        this.userName = userName;
        this.feedback = feedback;
        this.rating = rating;
    }

    public String getMedicineName() {return medicineName;}
    public String getUserName() {return userName;}
    public String getFeedback() {return feedback;}
    public int getRating() {return rating;}

    public void setMedicineName(String medicineName) {this.medicineName = medicineName;}
    public void setUserName(String userName) {this.userName = userName;}
    public void setFeedback(String feedback) {this.feedback = feedback;}
    public void setRating(int rating) {this.rating = rating;}
}
