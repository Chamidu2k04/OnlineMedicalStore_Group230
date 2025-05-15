package storage;

import model.Medicine;
import java.io.*;
import java.util.*;

public class MedicineStorage {
    private static final String FILE_PATH = "medicine.dat";

    // ✅ Add Supplier
    public static void addMedicine(Medicine s) throws IOException, ClassNotFoundException {
        List<Medicine> list = getAllSuppliers();
        list.add(s);
        saveAll(list);
    }

    // ✅ Update Supplier
    public static void updateMedicine(Medicine updated) throws IOException, ClassNotFoundException {
        List<Medicine> list = getAllSuppliers();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getName().equals(updated.getName())) {
                list.set(i, updated);
                break;
            }
        }
        saveAll(list);
    }

    // ✅ Delete Supplier
    public static void deleteMedicine(String id) throws IOException, ClassNotFoundException {
        List<Medicine> list = getAllSuppliers();
        list.removeIf(s -> s.getName().equals(id));
        saveAll(list);
    }

    // ✅ Get All Suppliers
    public static List<Medicine> getAllSuppliers() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Medicine>) ois.readObject();
        }
    }

    // ✅ Get One Supplier
    public static Medicine getSupplierById(String id) throws IOException, ClassNotFoundException {
        for (Medicine s : getAllSuppliers()) {
            if (s.getName().equals(id)) return s;
        }
        return null;
    }

    // ✅ Save All (used internally)
    private static void saveAll(List<Medicine> list) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            oos.writeObject(list);
        }
    }
}
