package main.admin.service;

import main.java.model.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserAdminService {
    private static final String USERS_FILE = "users.txt";
    private List<User> users;

    // Constructor - loads users from file
    public UserAdminService() {
        this.users = loadUsers();
    }

    // Create a new user (Register)
    public User createUser(String username, String password, String email, String fullName, String role) {
        // Check if username already exists
        if (getUserByUsername(username) != null) {
            return null; // Username already taken
        }

        // Create new user with UUID
        String userId = UUID.randomUUID().toString();
        User newUser = new User();
        newUser.setUserId(userId);
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setFullName(fullName);
        newUser.setRole(role);

        // Add to list and save
        users.add(newUser);
        saveUsers();

        return newUser;
    }

    // Read all users
    public List<User> getAllUsers() {
        return new ArrayList<>(users);
    }

    // Read user by ID
    public User getUserById(String userId) {
        for (User user : users) {
            if (user.getUserId().equals(userId)) {
                return user;
            }
        }
        return null;
    }

    // Read user by username
    public User getUserByUsername(String username) {
        for (User user : users) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }
        return null;
    }

    // Update user
    public boolean updateUser(User updatedUser) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserId().equals(updatedUser.getUserId())) {
                users.set(i, updatedUser);
                saveUsers();
                return true;
            }
        }
        return false;
    }

    // Delete user
    public boolean deleteUser(String userId) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserId().equals(userId)) {
                users.remove(i);
                saveUsers();
                return true;
            }
        }
        return false;
    }

    // Search users by name, email, or username
    public List<User> searchUsers(String searchTerm) {
        List<User> results = new ArrayList<>();
        String term = searchTerm.toLowerCase();

        for (User user : users) {
            if (user.getUsername().toLowerCase().contains(term) ||
                    user.getEmail().toLowerCase().contains(term) ||
                    user.getFullName().toLowerCase().contains(term)) {
                results.add(user);
            }
        }

        return results;
    }

    // Load users from file
    private List<User> loadUsers() {
        List<User> loadedUsers = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(USERS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    User user = new User();
                    user.setUserId(parts[0]);
                    user.setUsername(parts[1]);
                    user.setPassword(parts[2]);
                    user.setEmail(parts[3]);
                    user.setFullName(parts[4]);
                    user.setRole(parts[5]);
                    loadedUsers.add(user);
                }
            }
        } catch (IOException e) {
            // File might not exist yet - that's okay
            System.out.println("Users file not found. Creating new file when users are added.");
        }

        return loadedUsers;
    }

    // Save users to file
    private void saveUsers() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(USERS_FILE))) {
            for (User user : users) {
                writer.write(String.format("%s,%s,%s,%s,%s,%s\n",
                        user.getUserId(),
                        user.getUsername(),
                        user.getPassword(),
                        user.getEmail(),
                        user.getFullName(),
                        user.getRole()));
            }
        } catch (IOException e) {
            System.err.println("Error saving users: " + e.getMessage());
        }
    }
}