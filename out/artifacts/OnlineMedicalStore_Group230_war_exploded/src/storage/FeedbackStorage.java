package storage;

import model.Feedback;
import java.io.*;
import java.util.*;

public class FeedbackStorage {
    private static final String FILE_PATH = "D:/medical_store/feedbacks.dat";

    public static void addFeedback(Feedback f) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.add(f);
        saveAll(list);
    }

    public static void updateFeedback(Feedback updated) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId().equals(updated.getId())) {
                list.set(i, updated);
                break;
            }
        }
        saveAll(list);
    }

    public static void deleteFeedback(String id) throws IOException, ClassNotFoundException {
        List<Feedback> list = getAllFeedbacks();
        list.removeIf(f -> f.getId().equals(id));
        saveAll(list);
    }

    public static List<Feedback> getAllFeedbacks() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Feedback>) ois.readObject();
        }
    }

    public static Feedback getFeedbackById(String id) throws IOException, ClassNotFoundException {
        for (Feedback f : getAllFeedbacks()) {
            if (f.getId().equals(id)) return f;
        }
        return null;
    }

    private static void saveAll(List<Feedback> list) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            oos.writeObject(list);
        }
    }
}
