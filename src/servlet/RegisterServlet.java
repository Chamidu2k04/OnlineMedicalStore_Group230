package com.medstore.usermodule.servlet;

import com.medstore.usermodule.model.Users;
import com.medstore.usermodule.service.FileHandler;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");

        System.out.println("Registration attempt for user: " + username);

        // Create a new Users object
        Users newUser = new Users(username, password, fullName, email);
        
        try {
            // Add user to the file
            FileHandler.addUser(username, password, fullName, email);
            
            // Set success message and redirect to login
            request.setAttribute("message", "Registration successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Registration error: " + e.getMessage());
            // Handle any errors
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
