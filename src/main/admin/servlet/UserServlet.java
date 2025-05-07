package main.admin.servlet;

import main.admin.service.UserAdminService;
import main.java.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
    private UserAdminService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserAdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listUsers(request, response);
                break;
            case "view":
                viewUser(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "search":
                searchUsers(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            default:
                listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("users", userService.getAllUsers());
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    private void viewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        User user = userService.getUserById(userId);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/view-user.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "User not found");
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/add-user.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        User user = userService.getUserById(userId);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/edit-user.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "User not found");
            request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String role = request.getParameter("role");

        User newUser = userService.createUser(username, password, email, fullName, role);

        if (newUser != null) {
            request.setAttribute("message", "User added successfully");
        } else {
            request.setAttribute("error", "Username already exists");
        }

        listUsers(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String role = request.getParameter("role");

        User user = userService.getUserById(userId);

        if (user != null) {
            user.setUsername(username);
            user.setEmail(email);
            user.setFullName(fullName);
            user.setRole(role);

            boolean updated = userService.updateUser(user);

            if (updated) {
                request.setAttribute("message", "User updated successfully");
            } else {
                request.setAttribute("error", "Failed to update user");
            }
        } else {
            request.setAttribute("error", "User not found");
        }

        listUsers(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");

        boolean deleted = userService.deleteUser(userId);

        if (deleted) {
            request.setAttribute("message", "User deleted successfully");
        } else {
            request.setAttribute("error", "Failed to delete user");
        }

        listUsers(request, response);
    }

    private void searchUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");

        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            request.setAttribute("users", userService.searchUsers(searchTerm));
            request.setAttribute("searchTerm", searchTerm);
        } else {
            request.setAttribute("users", userService.getAllUsers());
        }

        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }
}