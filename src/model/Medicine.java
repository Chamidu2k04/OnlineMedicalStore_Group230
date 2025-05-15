package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

<<<<<<< Updated upstream
/**
 * Medicine class representing the medicine entity in the system.
 * Implements Serializable to support file-based storage.
 */
=======
>>>>>>> Stashed changes
public class Medicine implements Serializable {
    private String id;
    private String name;
    private String manufacturer;
    private double price;
    private int quantity;
    private LocalDate expiryDate;
    private String description;
    private String category;
    private boolean requiresPrescription;

    // Format for storing and parsing dates
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // Default constructor
    public Medicine() {
        this.id = UUID.randomUUID().toString();
    }

    // Parameterized constructor
<<<<<<< Updated upstream
    public Medicine(String name, String manufacturer, double price, int quantity,
                    LocalDate expiryDate, String description, String category, boolean requiresPrescription) {
=======
    public Medicine(String name, String manufacturer, double price, int quantity, LocalDate expiryDate, String description, String category, boolean requiresPrescription) {
>>>>>>> Stashed changes
        this.id = UUID.randomUUID().toString();
        this.name = name;
        this.manufacturer = manufacturer;
        this.price = price;
        this.quantity = quantity;
        this.expiryDate = expiryDate;
        this.description = description;
        this.category = category;
        this.requiresPrescription = requiresPrescription;
    }

    // Constructor with ID for loading from file
    public Medicine(String id, String name, String manufacturer, double price, int quantity,
                    LocalDate expiryDate, String description, String category, boolean requiresPrescription) {
        this.id = id;
        this.name = name;
        this.manufacturer = manufacturer;
        this.price = price;
        this.quantity = quantity;
        this.expiryDate = expiryDate;
        this.description = description;
        this.category = category;
        this.requiresPrescription = requiresPrescription;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getExpiryDateAsString() {
        return expiryDate != null ? expiryDate.format(DATE_FORMATTER) : "";
    }

    public void setExpiryDateFromString(String dateStr) {
        if (dateStr != null && !dateStr.isEmpty()) {
            this.expiryDate = LocalDate.parse(dateStr, DATE_FORMATTER);
        }
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public boolean isRequiresPrescription() {
        return requiresPrescription;
    }

    public void setRequiresPrescription(boolean requiresPrescription) {
        this.requiresPrescription = requiresPrescription;
    }

    /**
     * Convert medicine object to CSV format for file storage
     * @return Medicine data in CSV format
     */
    public String toCsvString() {
        return String.join(",",
                id,
                name,
                manufacturer,
                String.valueOf(price),
                String.valueOf(quantity),
                getExpiryDateAsString(),
                description,
                category,
                String.valueOf(requiresPrescription)
        );
    }

    /**
     * Create Medicine object from CSV string
     * @param csvLine CSV line from file
     * @return Medicine object
     */
    public static Medicine fromCsvString(String csvLine) {
        String[] parts = csvLine.split(",");
        if (parts.length < 9) {
            throw new IllegalArgumentException("Invalid CSV format for Medicine");
        }

        String id = parts[0];
        String name = parts[1];
        String manufacturer = parts[2];
        double price = Double.parseDouble(parts[3]);
        int quantity = Integer.parseInt(parts[4]);
        LocalDate expiryDate = parts[5].isEmpty() ? null : LocalDate.parse(parts[5], DATE_FORMATTER);
        String description = parts[6];
        String category = parts[7];
        boolean requiresPrescription = Boolean.parseBoolean(parts[8]);

        return new Medicine(id, name, manufacturer, price, quantity, expiryDate, description, category, requiresPrescription);
    }

    @Override
    public String toString() {
        return "Medicine{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", expiryDate=" + (expiryDate != null ? expiryDate.format(DATE_FORMATTER) : "N/A") +
                ", description='" + description + '\'' +
                ", category='" + category + '\'' +
                ", requiresPrescription=" + requiresPrescription +
                '}';
    }
}