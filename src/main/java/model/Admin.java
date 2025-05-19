package model;

public class Admin {
    private String id;
    private String name;
    private String email;
    private String password;

    public Admin(String id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }

    public String toFileString() {
        return id + "," + name + "," + email + "," + password;
    }

    public static Admin fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 4) {
            return new Admin(parts[0], parts[1], parts[2], parts[3]);
        }
        return null;
    }
}