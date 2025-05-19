package servlet;

import model.Medicine;
import service.MedicineService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Optional;

/**
 * Servlet for handling Medicine operations
 * Maps to /medicine/* URL pattern
 */
@WebServlet("/medicine/*")
public class MedicineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MedicineService medicineService;
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Override
    public void init() throws ServletException {
        super.init();
        medicineService = new MedicineService();
    }

    /**
     * Handle GET requests for medicine operations
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // List all medicines
            handleListMedicines(request, response);
        } else if (pathInfo.equals("/add")) {
            // Show add medicine form
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
        } else if (pathInfo.equals("/edit")) {
            // Show edit medicine form
            handleEditMedicineForm(request, response);
        } else if (pathInfo.equals("/sort")) {
            // Show sorted medicines
            handleSortMedicines(request, response);
        } else if (pathInfo.equals("/search")) {
            // Search medicines
            handleSearchMedicines(request, response);
        } else if (pathInfo.equals("/category")) {
            // Filter by category
            handleCategoryFilter(request, response);
        } else if (pathInfo.equals("/low-stock")) {
            // Show low stock medicines
            handleLowStockMedicines(request, response);
        } else if (pathInfo.equals("/expiring")) {
            // Show expiring medicines
            handleExpiringMedicines(request, response);
        } else if (pathInfo.equals("/delete")) {
            // Delete medicine
            handleDeleteMedicine(request, response);
        } else {
            // Invalid path
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    /**
     * Handle POST requests for medicine operations
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Default action (add medicine)
            handleAddMedicine(request, response);
        } else if (pathInfo.equals("/add")) {
            // Add medicine
            handleAddMedicine(request, response);
        } else if (pathInfo.equals("/edit")) {
            // Update medicine
            handleUpdateMedicine(request, response);
        } else if (pathInfo.equals("/delete")) {
            // Delete medicine
            handleDeleteMedicine(request, response);
        } else {
            // Invalid path
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    /**
     * Handle listing all medicines
     */
    private void handleListMedicines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Medicine> medicines = medicineService.getAllMedicines();
        request.setAttribute("medicines", medicines);
        request.getRequestDispatcher("/medicine/listMedicine.jsp").forward(request, response);
    }

    /**
     * Handle sorting medicines
     */
    private void handleSortMedicines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sortBy = request.getParameter("sortBy");
        String order = request.getParameter("order");
        boolean ascending = "asc".equals(order);

        List<Medicine> medicines;

        if ("name".equals(sortBy)) {
            medicines = medicineService.getMedicinesSortedByName(ascending);
        } else if ("expiryDate".equals(sortBy)) {
            medicines = medicineService.getMedicinesSortedByExpiryDate(ascending);
        } else if ("quantity".equals(sortBy)) {
            medicines = medicineService.getMedicinesSortedByQuantity(ascending);
        } else {
            // Default: sort by price
            medicines = medicineService.getMedicinesSortedByPrice(ascending);
        }

        request.setAttribute("medicines", medicines);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("order", order);
        request.getRequestDispatcher("/medicine/sortMedicine.jsp").forward(request, response);
    }

    /**
     * Handle searching medicines
     */
    private void handleSearchMedicines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        List<Medicine> medicines = medicineService.searchMedicinesByName(query);

        request.setAttribute("medicines", medicines);
        request.setAttribute("query", query);
        request.getRequestDispatcher("/medicine/listMedicine.jsp").forward(request, response);
    }

    /**
     * Handle filtering medicines by category
     */
    private void handleCategoryFilter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        List<Medicine> medicines = medicineService.getMedicinesByCategory(category);

        request.setAttribute("medicines", medicines);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/medicine/listMedicine.jsp").forward(request, response);
    }

    /**
     * Handle showing low stock medicines
     */
    private void handleLowStockMedicines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int threshold = 10; // Default threshold
        try {
            String thresholdStr = request.getParameter("threshold");
            if (thresholdStr != null && !thresholdStr.isEmpty()) {
                threshold = Integer.parseInt(thresholdStr);
            }
        } catch (NumberFormatException e) {
            // Use default threshold
        }

        List<Medicine> medicines = medicineService.getLowStockMedicines(threshold);

        request.setAttribute("medicines", medicines);
        request.setAttribute("threshold", threshold);
        request.getRequestDispatcher("/medicine/listMedicine.jsp").forward(request, response);
    }

    /**
     * Handle showing expiring medicines
     */
    private void handleExpiringMedicines(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int daysThreshold = 30; // Default days threshold
        try {
            String daysStr = request.getParameter("days");
            if (daysStr != null && !daysStr.isEmpty()) {
                daysThreshold = Integer.parseInt(daysStr);
            }
        } catch (NumberFormatException e) {
            // Use default days threshold
        }

        List<Medicine> medicines = medicineService.getExpiringMedicines(daysThreshold);

        request.setAttribute("medicines", medicines);
        request.setAttribute("days", daysThreshold);
        request.getRequestDispatcher("/medicine/listMedicine.jsp").forward(request, response);
    }

    /**
     * Handle showing edit medicine form
     */
    private void handleEditMedicineForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/medicine");
            return;
        }

        Optional<Medicine> medicineOpt = medicineService.getMedicineById(id);
        if (!medicineOpt.isPresent()) {
            response.sendRedirect(request.getContextPath() + "/medicine");
            return;
        }

        request.setAttribute("medicine", medicineOpt.get());
        request.getRequestDispatcher("/medicine/editMedicine.jsp").forward(request, response);
    }

    /**
     * Handle adding a new medicine
     */
    private void handleAddMedicine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parse request parameters
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String requiresPrescriptionStr = request.getParameter("requiresPrescription");
        String expiryDateStr = request.getParameter("expiryDate");

        double price = 0.0;
        int quantity = 0;
        boolean requiresPrescription = "on".equals(requiresPrescriptionStr) || "true".equals(requiresPrescriptionStr);
        LocalDate expiryDate = null;

        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Invalid price");
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
            return;
        }

        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Invalid quantity");
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
            return;
        }

        try {
            if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                expiryDate = LocalDate.parse(expiryDateStr, DATE_FORMATTER);
            }
        } catch (DateTimeParseException e) {
            request.setAttribute("error", "Invalid expiry date format. Use yyyy-MM-dd");
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
            return;
        }

        // Validate required fields
        if (name == null || name.isEmpty()) {
            request.setAttribute("error", "Medicine name is required");
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
            return;
        }

        // Create and save medicine
        Medicine medicine = new Medicine(name, manufacturer, price, quantity, expiryDate, description, category, requiresPrescription);

        boolean success = medicineService.addMedicine(medicine);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/medicine");
        } else {
            request.setAttribute("error", "Failed to add medicine");
            request.getRequestDispatcher("/medicine/addMedicine.jsp").forward(request, response);
        }
    }

    /**
     * Handle updating an existing medicine
     */
    private void handleUpdateMedicine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Parse request parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String manufacturer = request.getParameter("manufacturer");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String requiresPrescriptionStr = request.getParameter("requiresPrescription");
        String expiryDateStr = request.getParameter("expiryDate");

        if (id == null || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/medicine");
            return;
        }

        Optional<Medicine> existingMedicineOpt = medicineService.getMedicineById(id);
        if (!existingMedicineOpt.isPresent()) {
            response.sendRedirect(request.getContextPath() + "/medicine");
            return;
        }

        Medicine medicine = existingMedicineOpt.get();

        // Update fields
        if (name != null && !name.isEmpty()) {
            medicine.setName(name);
        }

        if (manufacturer != null) {
            medicine.setManufacturer(manufacturer);
        }

        if (description != null) {
            medicine.setDescription(description);
        }

        if (category != null) {
            medicine.setCategory(category);
        }

        boolean requiresPrescription = "on".equals(requiresPrescriptionStr) || "true".equals(requiresPrescriptionStr);
        medicine.setRequiresPrescription(requiresPrescription);

        try {
            double price = Double.parseDouble(request.getParameter("price"));
            medicine.setPrice(price);
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Invalid price");
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("/medicine/editMedicine.jsp").forward(request, response);
            return;
        }

        try {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            medicine.setQuantity(quantity);
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Invalid quantity");
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("/medicine/editMedicine.jsp").forward(request, response);
            return;
        }

        try {
            if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
                LocalDate expiryDate = LocalDate.parse(expiryDateStr, DATE_FORMATTER);
                medicine.setExpiryDate(expiryDate);
            }
        } catch (DateTimeParseException e) {
            request.setAttribute("error", "Invalid expiry date format. Use yyyy-MM-dd");
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("/medicine/editMedicine.jsp").forward(request, response);
            return;
        }

        boolean success = medicineService.updateMedicine(medicine);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/medicine");
        } else {
            request.setAttribute("error", "Failed to update medicine");
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("/medicine/editMedicine.jsp").forward(request, response);
        }
    }

    /**
     * Handle deleting a medicine
     */
    private void handleDeleteMedicine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/medicine");
            return;
        }

        boolean success = medicineService.deleteMedicine(id);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/medicine");
        } else {
            request.setAttribute("error", "Failed to delete medicine");
            handleListMedicines(request, response);
        }
    }
}