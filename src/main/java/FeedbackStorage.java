package storage;

import model.Feedback;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackStorage {
    private static final String FILE_PATH = "C:\\Users\\chami\\Documents\\GitHub\\OnlineMedicalStore_Group230\\src\\Data\\feedback.txt";

    public static void addFeedback(Feedback feedback) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.add(feedback);
        saveAll(list);
    }

    public static List<Feedback> getAllFeedbacks() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Supplier>) ois.readObject();
        }
    }
}