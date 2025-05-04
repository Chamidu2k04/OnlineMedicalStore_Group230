package storage;

import model.Feedback;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackStorage {
    private static final String FILE_PATH = "C:\\Users\\chami\\Documents\\GitHub\\OnlineMedicalStore_Group230\\Data\\feedback.txt";

    public static void addFeedback(Feedback feedback) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.add(feedback);
        saveAll(list);
    }

    public static List<Feedback> getAllFeedbacks() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Feedback>) ois.readObject();
        }
    }

    public static void deleteFeedback(String name) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.removeIf(feedback -> feedback.getUserName().equals(name));
        saveAll(list);
    }

    private static void saveAll(List<Feedback> list) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            oos.writeObject(list);
        }
    }
}
