package com.medstore.usermodule.service;

import java.io.*;
import java.util.*;

public class FileHandler {
    private static final String FILE_NAME = "users.txt";
    private static final String RESOURCE_PATH = "C:\\Users\\ADMIN\\Desktop\\OnlineMedicalStore_Group230\\src\\main\\resources\\users.txt";

    public static List<String[]> getAllUsers() throws IOException {
        File file = new File(RESOURCE_PATH);   //Create a File object and print path
        System.out.println("Reading from file: " + file.getAbsolutePath());

        if (!file.exists()) {            //Check if file exists
            System.out.println("File does not exist, creating it...");
            file.getParentFile().mkdirs();  //Before creating the file, make sure the folder structure exists
            file.createNewFile();
        }

        List<String[]> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    users.add(line.split(","));
                }
            }
        }
        System.out.println("Found " + users.size() + " users");
        return users;
    }

    public static void addUser(String username, String password, String fullName, String email) throws IOException {
        System.out.println("Adding user: " + username);

        // First check if user already exists
        List<String[]> users = getAllUsers();
        for (String[] user : users) {
            if (user[0].equals(username)) {
                throw new IOException("Username already exists");
            }
        }

        // Write the new user
        File file = new File(RESOURCE_PATH);
        System.out.println("Writing to file: " + file.getAbsolutePath());

        try (FileWriter writer = new FileWriter(file, true)) {
            String userData = username + "," + password + "," + fullName + "," + email + "\n";
            writer.write(userData);
            System.out.println("Successfully wrote user data");
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
            throw e;
        }
    }

    public static String[] findUser(String username, String password) throws IOException {
        System.out.println("Finding user: " + username);
        List<String[]> users = getAllUsers();

        for (String[] user : users) {
            if (user[0].equals(username) && user[1].equals(password)) {
                System.out.println("User found");
                return user;
            }
        }
        System.out.println("User not found");
        return null;
    }
}
