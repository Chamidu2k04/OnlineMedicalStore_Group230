package util;

import java.io.*;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Utility class for file operations
 */
public class FileUtil {

    /**
     * Read all lines from a file
     * @param filePath Path to the file
     * @return List of lines from the file
     */
    public static List<String> readAllLines(String filePath) {
        List<String> lines = new ArrayList<>();
        try {
            // Create parent directories if they don't exist
            File file = new File(filePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
                return lines;
            }

            // Read all lines from the file
            lines = Files.readAllLines(Paths.get(filePath));
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }
        return lines;
    }

    /**
     * Write all lines to a file
     * @param filePath Path to the file
     * @param lines List of lines to write
     * @return true if successful, false otherwise
     */
    public static boolean writeAllLines(String filePath, List<String> lines) {
        try {
            // Create parent directories if they don't exist
            File file = new File(filePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
            }

            // Write all lines to the file
            Files.write(Paths.get(filePath), lines);
            return true;
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
            return false;
        }
    }

    /**
     * Append a line to a file
     * @param filePath Path to the file
     * @param line Line to append
     * @return true if successful, false otherwise
     */
    public static boolean appendLine(String filePath, String line) {
        try {
            // Create parent directories if they don't exist
            File file = new File(filePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }

            // Append line to the file
            Files.write(
                    Paths.get(filePath),
                    (line + System.lineSeparator()).getBytes(),
                    StandardOpenOption.APPEND
            );
            return true;
        } catch (IOException e) {
            System.err.println("Error appending to file: " + e.getMessage());
            return false;
        }
    }

    /**
     * Delete a line from a file
     * @param filePath Path to the file
     * @param lineToDelete Line to delete
     * @return true if successful, false otherwise
     */
    public static boolean deleteLine(String filePath, String lineToDelete) {
        try {
            List<String> lines = readAllLines(filePath);
            lines.remove(lineToDelete);
            return writeAllLines(filePath, lines);
        } catch (Exception e) {
            System.err.println("Error deleting line: " + e.getMessage());
            return false;
        }
    }

    /**
     * Update a line in a file
     * @param filePath Path to the file
     * @param oldLine Old line to replace
     * @param newLine New line to replace with
     * @return true if successful, false otherwise
     */
    public static boolean updateLine(String filePath, String oldLine, String newLine) {
        try {
            List<String> lines = readAllLines(filePath);
            int index = lines.indexOf(oldLine);
            if (index != -1) {
                lines.set(index, newLine);
                return writeAllLines(filePath, lines);
            }
            return false;
        } catch (Exception e) {
            System.err.println("Error updating line: " + e.getMessage());
            return false;
        }
    }

    /**
     * Check if a file exists
     * @param filePath Path to the file
     * @return true if file exists, false otherwise
     */
    public static boolean fileExists(String filePath) {
        return new File(filePath).exists();
    }

    /**
     * Create a file if it doesn't exist
     * @param filePath Path to the file
     * @return true if successful, false otherwise
     */
    public static boolean createFileIfNotExists(String filePath) {
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
            return true;
        } catch (IOException e) {
            System.err.println("Error creating file: " + e.getMessage());
            return false;
        }
    }
}
