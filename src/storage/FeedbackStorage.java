package storage;

import model.Feedback;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackStorage {
    private String FILE_PATH = "C:\\Users\\chami\\Documents\\GitHub\\OnlineMedicalStore_Group230\\Data\\feedback.txt";

    public void addFeedback(Feedback feedback) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.add(feedback);
        saveAll(list);
    }

    public List<Feedback> getAllFeedbacks() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists() || file.length() == 0) {
            return new ArrayList<>();
        }
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Feedback>) ois.readObject();
        }
    }

    public void deleteFeedback(String userName, String medicineName) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.removeIf(feedback -> feedback.getUserName().equals(userName) &&
                feedback.getMedicineName().equals(medicineName));
        saveAll(list);
    }

    private void saveAll(List<Feedback> list) throws IOException {
        // Create directory if it doesn't exist
        File file = new File(FILE_PATH);
        File directory = file.getParentFile();
        if (!directory.exists()) {
            directory.mkdirs();
        }

        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            oos.writeObject(list);
        }
    }
}