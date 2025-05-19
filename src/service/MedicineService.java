package service;

import model.Medicine;
import util.FileUtil;
import util.SortUtil;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Service class for Medicine operations
 * Handles CRUD operations for Medicine entities
 */
public class MedicineService {
    private static final String DATA_FILE = "src/data/medicines.txt";

    /**
     * Get all medicines from the data file
     * @return List of all medicines
     */
    public List<Medicine> getAllMedicines() {
        List<String> lines = FileUtil.readAllLines(DATA_FILE);
        List<Medicine> medicines = new ArrayList<>();

        for (String line : lines) {
            try {
                medicines.add(Medicine.fromCsvString(line));
            } catch (Exception e) {
                System.err.println("Error parsing medicine line: " + e.getMessage());
            }
        }

        return medicines;
    }

    /**
     * Get a medicine by ID
     * @param id Medicine ID
     * @return Optional containing the medicine if found, empty otherwise
     */
    public Optional<Medicine> getMedicineById(String id) {
        return getAllMedicines().stream()
                .filter(m -> m.getId().equals(id))
                .findFirst();
    }

    /**
     * Add a new medicine to the data file
     * @param medicine Medicine to add
     * @return true if successful, false otherwise
     */
    public boolean addMedicine(Medicine medicine) {
        if (medicine.getId() == null || medicine.getId().isEmpty()) {
            return false; // ID is required
        }

        // Check if medicine with same ID already exists
        if (getMedicineById(medicine.getId()).isPresent()) {
            return false; // Medicine with this ID already exists
        }

        return FileUtil.appendLine(DATA_FILE, medicine.toCsvString());
    }

    /**
     * Update an existing medicine in the data file
     * @param medicine Medicine to update
     * @return true if successful, false otherwise
     */
    public boolean updateMedicine(Medicine medicine) {
        List<Medicine> medicines = getAllMedicines();

        Optional<Medicine> existingMedicine = medicines.stream()
                .filter(m -> m.getId().equals(medicine.getId()))
                .findFirst();

        if (!existingMedicine.isPresent()) {
            return false; // Medicine not found
        }

        List<String> lines = medicines.stream()
                .map(m -> m.getId().equals(medicine.getId()) ? medicine.toCsvString() : m.toCsvString())
                .collect(Collectors.toList());

        return FileUtil.writeAllLines(DATA_FILE, lines);
    }

    /**
     * Delete a medicine from the data file
     * @param id ID of the medicine to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteMedicine(String id) {
        List<Medicine> medicines = getAllMedicines();

        Optional<Medicine> existingMedicine = medicines.stream()
                .filter(m -> m.getId().equals(id))
                .findFirst();

        if (!existingMedicine.isPresent()) {
            return false; // Medicine not found
        }

        List<String> lines = medicines.stream()
                .filter(m -> !m.getId().equals(id))
                .map(Medicine::toCsvString)
                .collect(Collectors.toList());

        return FileUtil.writeAllLines(DATA_FILE, lines);
    }

    /**
     * Search for medicines by name (case-insensitive)
     * @param query Search query
     * @return List of medicines matching the query
     */
    public List<Medicine> searchMedicinesByName(String query) {
        if (query == null || query.isEmpty()) {
            return getAllMedicines();
        }

        String lowercaseQuery = query.toLowerCase();

        return getAllMedicines().stream()
                .filter(m -> m.getName().toLowerCase().contains(lowercaseQuery))
                .collect(Collectors.toList());
    }

    /**
     * Search for medicines by category (case-insensitive)
     * @param category Category to search for
     * @return List of medicines in the specified category
     */
    public List<Medicine> getMedicinesByCategory(String category) {
        if (category == null || category.isEmpty()) {
            return getAllMedicines();
        }

        String lowercaseCategory = category.toLowerCase();

        return getAllMedicines().stream()
                .filter(m -> m.getCategory().toLowerCase().equals(lowercaseCategory))
                .collect(Collectors.toList());
    }

    /**
     * Get medicines that are about to expire
     * @param daysThreshold Number of days threshold
     * @return List of medicines expiring within the threshold
     */
    public List<Medicine> getExpiringMedicines(int daysThreshold) {
        LocalDate thresholdDate = LocalDate.now().plusDays(daysThreshold);

        return getAllMedicines().stream()
                .filter(m -> m.getExpiryDate() != null &&
                        m.getExpiryDate().isBefore(thresholdDate) &&
                        m.getExpiryDate().isAfter(LocalDate.now()))
                .collect(Collectors.toList());
    }

    /**
     * Get medicines that are out of stock or low in stock
     * @param threshold Quantity threshold
     * @return List of medicines with quantity below threshold
     */
    public List<Medicine> getLowStockMedicines(int threshold) {
        return getAllMedicines().stream()
                .filter(m -> m.getQuantity() <= threshold)
                .collect(Collectors.toList());
    }

    /**
     * Get medicines sorted by price
     * @param ascending true for ascending order, false for descending
     * @return Sorted list of medicines
     */
    public List<Medicine> getMedicinesSortedByPrice(boolean ascending) {
        List<Medicine> medicines = getAllMedicines();
        SortUtil.sortMedicinesByPrice(medicines, ascending);
        return medicines;
    }

    /**
     * Get medicines sorted by name
     * @param ascending true for ascending order, false for descending
     * @return Sorted list of medicines
     */
    public List<Medicine> getMedicinesSortedByName(boolean ascending) {
        List<Medicine> medicines = getAllMedicines();
        SortUtil.sortMedicinesByName(medicines, ascending);
        return medicines;
    }

    /**
     * Get medicines sorted by expiry date
     * @param ascending true for ascending order, false for descending
     * @return Sorted list of medicines
     */
    public List<Medicine> getMedicinesSortedByExpiryDate(boolean ascending) {
        List<Medicine> medicines = getAllMedicines();
        SortUtil.sortMedicinesByExpiryDate(medicines, ascending);
        return medicines;
    }

    /**
     * Get medicines sorted by quantity
     * @param ascending true for ascending order, false for descending
     * @return Sorted list of medicines
     */
    public List<Medicine> getMedicinesSortedByQuantity(boolean ascending) {
        List<Medicine> medicines = getAllMedicines();
        SortUtil.sortMedicinesByQuantity(medicines, ascending);
        return medicines;
    }
}
