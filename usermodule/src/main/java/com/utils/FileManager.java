package com.utils;

import com.models.Users;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileManager {

    // Read users from file and convert to User objects
    public static List<Users> readUsersAsObjects(String filePath) {
        List<Users> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    String name = parts[0];
                    String address = parts[1];
                    String city = parts[2];
                    int phone = Integer.parseInt(parts[3]);
                    String email = parts[4];
                    String password = parts[5];

                    users.add(new Users(name, address, city, phone, email, password));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Save a single user to the file
    public static void saveUser(String filePath, Users user) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(user.toCSV());  // assuming user.toCSV() outputs comma-separated values
            writer.newLine();
        }
    }

    public static void writeUsersToFile(String filePath, List<Users> users) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Users user : users) {
                writer.write(user.toDataString()); // Make sure Users class has toDataString()
                writer.newLine();
            }
 }
 }
}
