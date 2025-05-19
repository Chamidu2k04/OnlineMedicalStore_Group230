package dao;


import model.Admin;
import java.io.*;
import java.util.*;

public class AdminDAO {
    private final String filePath;

    public AdminDAO(String filePath) {
        this.filePath = filePath;
    }

    public List<Admin> getAllAdmins() throws IOException {
        List<Admin> adminList = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) file.createNewFile();

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                Admin admin = Admin.fromFileString(line);
                if (admin != null) adminList.add(admin);
            }
        }
        return adminList;
    }

    public void addAdmin(Admin admin) throws IOException {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(admin.toFileString());
            bw.newLine();
        }
    }

    public String getNextId() throws IOException {
        List<Admin> admins = getAllAdmins();  // get all current admins
        int maxId = 0;

        for (Admin a : admins) {
            try {
                int id = Integer.parseInt(a.getId());  // safely parse ID
                if (id > maxId) {
                    maxId = id;
                }
            } catch (NumberFormatException e) {
                // ignore malformed or invalid IDs
            }
        }

        return String.valueOf(maxId + 1);  // return the next available ID
    }
    public Admin validateLogin(String username, String password) throws IOException {
        List<Admin> admins = getAllAdmins();

        for (Admin admin : admins) {
            // Match by name or email
            if ((admin.getName().equalsIgnoreCase(username) || admin.getEmail().equalsIgnoreCase(username)) &&
                    admin.getPassword().equals(password)) {
                return admin; // valid
            }
        }
        return null; // invalid
    }


    public void deleteAdminById(String id) throws IOException {
        List<Admin> admins = getAllAdmins();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (Admin a : admins) {
                if (!a.getId().equals(id)) {
                    bw.write(a.toFileString());
                    bw.newLine();
                }
            }
        }
    }
}