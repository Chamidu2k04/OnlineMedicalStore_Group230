package model;

import java.io.Serializable;

public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;

    private String medicineName, userName, feedback;
    private int rating;

    public Feedback(String medicineName, String userName, String feedback, int rating) {
        this.medicineName = medicineName;
        this.userName = userName;
        this.feedback = feedback;
        this.rating = rating;
    }

    public String getMedicineName() {

        return medicineName;
    }

    public String getUserName() {

        return userName;
    }

    public String getFeedback() {

        return feedback;
    }

    public int getRating() {

        return rating;
    }
}
