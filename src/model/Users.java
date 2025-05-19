package com.medstore.usermodule.model;



public class Users {
    private String username;
    private String password;
    private String fullName;
    private String email;

    //Creates a Users object by initializing all fields
    public Users(String username, String password, String fullName, String email) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
    }

    // Getters to  retrieve property
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    // Setters
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Convert to CSV format (for saving in users.txt)
    public String toCSV() {
        return username + "," + password + "," + fullName + "," + email;
    }

    // Optional: toString() for debugging
    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
