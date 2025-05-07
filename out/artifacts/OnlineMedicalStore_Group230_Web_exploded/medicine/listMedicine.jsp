<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-container {
            margin-top: 20px;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .search-container {
            margin-bottom: 20px;
        }
        .filters-container {
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1>Medicine Inventory</h1>

        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        </c:if>

        <div class="d-flex justify-content-between mb-4">
            <a href="${pageContext.request.contextPath}/medicine/add" class="btn btn-primary">Add New Medicine</a>
            <a href="${pageContext.request.contextPath}/medicine/sort?sortBy=price&order=asc" class="btn btn-secondary">Sort Medicines</a>
        </div>

        <div class="search-container">
            <form action="${pageContext.request.contextPath}/medicine/search" method="get" class="row g-3">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" name="query" class="form-control" placeholder="Search by name..." value="${query}">
                        <button type="submit" class="btn btn-outline-secondary">Search</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="filters-container">
            <div>
                <a href="${pageContext.request.contextPath}/medicine/low-stock" class="btn btn-warning btn-sm">Low Stock</a>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/medicine/expiring" class="btn btn-danger btn-sm">Expiring Soon</a>
            </div>
            <div>
                <form action="${pageContext.request.contextPath}/medicine/category" method="get" class="d-flex">
                    <select name="category" class="form-select form-select-sm" style="width: 150px;">
                        <option value="">All Categories</option>
                        <option value="Antibiotics" ${category == 'Antibiotics' ? 'selected' : ''}>Antibiotics</option>
                        <option value="Analgesics" ${category == 'Analgesics' ? 'selected' : ''}>Analgesics</option>
                        <option value="Antacids" ${category == 'Antacids' ? 'selected' : ''}>Antacids</option>
                        <option value="Antihistamines" ${category == 'Antihistamines' ? 'selected' : ''}>Antihistamines</option>
                        <option value="Vitamins" ${category == 'Vitamins' ? 'selected' : ''}>Vitamins</option>
                        <option value="Other" ${category == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                    <button type="submit" class="btn btn-sm btn-outline-secondary ms-2">Filter</button>
                </form>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty medicines}">
                <div class="alert alert-info">
                    No medicines found.
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Name</th>
                                <th>Manufacturer</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Expiry Date</th>
                                <th>Prescription</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${medicines}" var="medicine">
                                <tr>
                                    <td>${medicine.name}</td>
                                    <td>${medicine.manufacturer}</td>
                                    <td>${medicine.category}</td>
                                    <td>$${medicine.price}</td>
                                    <td class="${medicine.quantity <= 10 ? 'text-danger' : ''}">${medicine.quantity}</td>
                                    <td>${medicine.expiryDateAsString}</td>
                                    <td>${medicine.requiresPrescription ? 'Yes' : 'No'}</td>
                                    <td class="action-buttons">
                                        <a href="${pageContext.request.contextPath}/medicine/edit?id=${medicine.id}" class="btn btn-sm btn-primary">Edit</a>
                                        <a href="${pageContext.request.contextPath}/medicine/delete?id=${medicine.id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this medicine?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>