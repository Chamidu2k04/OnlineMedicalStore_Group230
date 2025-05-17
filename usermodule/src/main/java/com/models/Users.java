package com.models;

public class Users {
    private final String name;
    private final String address;
    private final String city;
    private final int phone;
    private final String email;
    private final String password;

    public Users(String name, String address, String city, int phone, String email, String password) {
        this.name = name;
        this.address = address;
        this.city = city;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    // Getters (optional for future use)
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getCity() { return city; }
    public int getPhone() { return phone; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }

    // toString for displaying in browser
    @Override
    public String toString() {
        return name + " | " + address + " | " + city + " | " + phone + " | " + email;
    }

    // toCSV for saving to file
    public String toCSV() {
        return name + "," + address + "," + city + "," + phone + "," + email + "," + password;
    }

    public String toDataString() {
        return name + "," + address + "," + city + "," + phone + "," + email + "," + password;
    }

    public static Users fromDataString(String data) {
        String[] parts = data.split(",");
        if (parts.length == 6) {
            try {
                int phone = Integer.parseInt(parts[3]);
                return new Users(parts[0], parts[1], parts[2], phone, parts[4], parts[5]);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
}

}

