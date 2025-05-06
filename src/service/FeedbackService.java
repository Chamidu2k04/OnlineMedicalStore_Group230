package service;

import model.Feedback;
import storage.FeedbackStorage;

import java.io.IOException;
import java.util.List;

public class FeedbackService {
    private FeedbackStorage storage;

    public FeedbackService() {
        this.storage = new FeedbackStorage();
    }

    public void addFeedback(Feedback feedback) throws IOException, ClassNotFoundException {
        storage.addFeedback(feedback);
    }

    public List<Feedback> getAllFeedbacks() throws IOException, ClassNotFoundException {
        return storage.getAllFeedbacks();
    }

    public void deleteFeedback(String userName, String medicineName) throws IOException, ClassNotFoundException {
        storage.deleteFeedback(userName, medicineName);
    }
}