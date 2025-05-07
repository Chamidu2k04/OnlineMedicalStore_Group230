package util;

import model.Medicine;
import java.util.Comparator;
import java.util.List;

/**
 * Utility class for sorting operations
 * Implements Quick Sort algorithm for sorting medicines
 */
public class SortUtil {

    /**
     * Sort medicines by price using Quick Sort algorithm
     * @param medicines List of medicines to sort
     * @param ascending true for ascending order, false for descending
     */
    public static void sortMedicinesByPrice(List<Medicine> medicines, boolean ascending) {
        if (medicines == null || medicines.size() <= 1) {
            return;
        }

        Comparator<Medicine> comparator = Comparator.comparingDouble(Medicine::getPrice);
        if (!ascending) {
            comparator = comparator.reversed();
        }

        quickSort(medicines, 0, medicines.size() - 1, comparator);
    }

    /**
     * Sort medicines by name using Quick Sort algorithm
     * @param medicines List of medicines to sort
     * @param ascending true for ascending order, false for descending
     */
    public static void sortMedicinesByName(List<Medicine> medicines, boolean ascending) {
        if (medicines == null || medicines.size() <= 1) {
            return;
        }

        Comparator<Medicine> comparator = Comparator.comparing(Medicine::getName);
        if (!ascending) {
            comparator = comparator.reversed();
        }

        quickSort(medicines, 0, medicines.size() - 1, comparator);
    }

    /**
     * Sort medicines by expiry date using Quick Sort algorithm
     * @param medicines List of medicines to sort
     * @param ascending true for ascending order, false for descending
     */
    public static void sortMedicinesByExpiryDate(List<Medicine> medicines, boolean ascending) {
        if (medicines == null || medicines.size() <= 1) {
            return;
        }

        Comparator<Medicine> comparator = Comparator.comparing(Medicine::getExpiryDate);
        if (!ascending) {
            comparator = comparator.reversed();
        }

        quickSort(medicines, 0, medicines.size() - 1, comparator);
    }

    /**
     * Sort medicines by quantity using Quick Sort algorithm
     * @param medicines List of medicines to sort
     * @param ascending true for ascending order, false for descending
     */
    public static void sortMedicinesByQuantity(List<Medicine> medicines, boolean ascending) {
        if (medicines == null || medicines.size() <= 1) {
            return;
        }

        Comparator<Medicine> comparator = Comparator.comparingInt(Medicine::getQuantity);
        if (!ascending) {
            comparator = comparator.reversed();
        }

        quickSort(medicines, 0, medicines.size() - 1, comparator);
    }

    /**
     * Quick Sort implementation for Medicine objects
     * @param list List of medicines to sort
     * @param low Starting index
     * @param high Ending index
     * @param comparator Comparator to use for comparison
     */
    private static <T> void quickSort(List<T> list, int low, int high, Comparator<T> comparator) {
        if (low < high) {
            int pivotIndex = partition(list, low, high, comparator);
            quickSort(list, low, pivotIndex - 1, comparator);
            quickSort(list, pivotIndex + 1, high, comparator);
        }
    }

    /**
     * Partition function for Quick Sort
     * @param list List to sort
     * @param low Starting index
     * @param high Ending index
     * @param comparator Comparator to use for comparison
     * @return Pivot index
     */
    private static <T> int partition(List<T> list, int low, int high, Comparator<T> comparator) {
        T pivot = list.get(high);
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (comparator.compare(list.get(j), pivot) <= 0) {
                i++;
                swap(list, i, j);
            }
        }

        swap(list, i + 1, high);
        return i + 1;
    }

    /**
     * Swap two elements in a list
     * @param list List to swap elements in
     * @param i First index
     * @param j Second index
     */
    private static <T> void swap(List<T> list, int i, int j) {
        T temp = list.get(i);
        list.set(i, list.get(j));
        list.set(j, temp);
    }
}
