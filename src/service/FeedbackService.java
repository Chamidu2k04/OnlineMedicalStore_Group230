package service;

import module.Feedback;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackService {
    private static final String FILE_PATH = "feedback.txt";

    // ADD feedback
    public void addFeedback(Feedback feedback) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = feedback.getId() + "," +
                    feedback.getUsername() + "," +
                    feedback.getRating() + "," +
                    feedback.getComment() + "," +
                    feedback.getDate();
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // GET all feedback
    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    Feedback fb = new Feedback(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3], parts[4]);
                    list.add(fb);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    // DELETE feedback by ID
    public void deleteFeedback(String id) {
        List<Feedback> list = getAllFeedback();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Feedback fb : list) {
                if (!fb.getId().equals(id)) {
                    String line = fb.getId() + "," + fb.getUsername() + "," + fb.getRating() + "," + fb.getComment() + "," + fb.getDate();
                    bw.write(line);
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // UPDATE feedback by ID
    public void updateFeedback(String id, Feedback updatedFb) {
        List<Feedback> list = getAllFeedback();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Feedback fb : list) {
                if (fb.getId().equals(id)) {
                    fb = updatedFb;
                }
                String line = fb.getId() + "," + fb.getUsername() + "," + fb.getRating() + "," + fb.getComment() + "," + fb.getDate();
                bw.write(line);
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
