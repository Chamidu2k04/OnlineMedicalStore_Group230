package storage;

import model.Supplier;
import java.io.*;
import java.util.*;

public class SupplierStorage {
    private static final String FILE_PATH = "D:/medical_store/suppliers.dat";

    // ✅ Add Supplier
    public static void addSupplier(Supplier s) throws IOException, ClassNotFoundException {
        List<Supplier> list = getAllSuppliers();
        list.add(s);
        saveAll(list);
    }

    // ✅ Update Supplier
    public static void updateSupplier(Supplier updated) throws IOException, ClassNotFoundException {
        List<Supplier> list = getAllSuppliers();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId().equals(updated.getId())) {
                list.set(i, updated);
                break;
            }
        }
        saveAll(list);
    }

    // ✅ Delete Supplier
    public static void deleteSupplier(String id) throws IOException, ClassNotFoundException {
        List<Supplier> list = getAllSuppliers();
        list.removeIf(s -> s.getId().equals(id));
        saveAll(list);
    }

    // ✅ Get All Suppliers
    public static List<Supplier> getAllSuppliers() throws IOException, ClassNotFoundException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Supplier>) ois.readObject();
        }
    }

    // ✅ Get One Supplier
    public static Supplier getSupplierById(String id) throws IOException, ClassNotFoundException {
        for (Supplier s : getAllSuppliers()) {
            if (s.getId().equals(id)) return s;
        }
        return null;
    }

    // ✅ Save All (used internally)
    private static void saveAll(List<Supplier> list) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH))) {
            oos.writeObject(list);
        }
    }
}
