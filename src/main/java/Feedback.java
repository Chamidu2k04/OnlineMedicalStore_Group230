public class Feedback {

    private String medecineName, userName, feedback;
    private int rating;

    public Feedback(String medecineName, String userName, String feedback, int rating) {
        this.medecineName = medecineName;
        this.userName = userName;
        this.feedback = feedback;
        this.rating = rating;
    }

    public String getMedecineName() {
        return medecineName;
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