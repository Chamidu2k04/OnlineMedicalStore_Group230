<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .table-container {
            margin-top: 20px;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .search-container, .filters-container {
            margin-bottom: 20px;
        }
        .filters-container {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        .badge-category {
            font-size: 0.75rem;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1 class="text-primary"><i class="fas fa-pills me-2"></i>Medicine Inventory</h1>
<<<<<<< Updated upstream

    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
                ${error}
        </div>
    </c:if>

    <div class="d-flex justify-content-between mb-4">
        <a href="${pageContext.request.contextPath}/medicine/add" class="btn btn-success">
=======
    <br>

    <div class="d-flex justify-content-between mb-4">
        <a href="addMedicine.jsp" class="btn btn-success">
>>>>>>> Stashed changes
            <i class="fas fa-plus-circle me-1"></i>Add New Medicine
        </a>
        <a href="${pageContext.request.contextPath}/medicine/sort?sortBy=price&order=asc" class="btn btn-info text-white">
            <i class="fas fa-sort-amount-up-alt me-1"></i>Sort by Price
        </a>
    </div>

    <div class="search-container">
        <form action="${pageContext.request.contextPath}/medicine/search" method="get" class="row g-3">
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" name="query" class="form-control" placeholder="Search by name..." value="${query}">
                    <button type="submit" class="btn btn-outline-primary">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>

    <div class="filters-container">
<<<<<<< Updated upstream
        <a href="${pageContext.request.contextPath}/medicine/low-stock" class="btn btn-warning btn-sm">
            <i class="fas fa-exclamation-triangle me-1"></i>Low Stock
        </a>
        <a href="${pageContext.request.contextPath}/medicine/expiring" class="btn btn-danger btn-sm">
            <i class="fas fa-calendar-times me-1"></i>Expiring Soon
        </a>
=======


>>>>>>> Stashed changes
        <form action="${pageContext.request.contextPath}/medicine/category" method="get" class="d-flex align-items-center">
            <select name="category" class="form-select form-select-sm" style="width: 150px;">
                <option value="">All Categories</option>
                <option value="Antibiotics" ${category == 'Antibiotics' ? 'selected' : ''}>Antibiotics</option>
                <option value="Analgesics" ${category == 'Analgesics' ? 'selected' : ''}>Analgesics</option>
                <option value="Antacids" ${category == 'Antacids' ? 'selected' : ''}>Antacids</option>
                <option value="Antihistamines" ${category == 'Antihistamines' ? 'selected' : ''}>Antihistamines</option>
                <option value="Vitamins" ${category == 'Vitamins' ? 'selected' : ''}>Vitamins</option>
                <option value="Other" ${category == 'Other' ? 'selected' : ''}>Other</option>
            </select>
            <button type="submit" class="btn btn-sm btn-outline-secondary ms-2">
                <i class="fas fa-filter"></i>
            </button>
        </form>
    </div>

    <c:choose>
        <c:when test="${empty medicines}">
            <div class="alert alert-info">
                <i class="fas fa-info-circle me-1"></i>No medicines found.
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-container">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                    <tr>
                        <th><i class="fas fa-capsules me-1"></i>Name</th>
                        <th><i class="fas fa-industry me-1"></i>Manufacturer</th>
                        <th><i class="fas fa-tags me-1"></i>Category</th>
                        <th><i class="fas fa-dollar-sign me-1"></i>Price</th>
                        <th><i class="fas fa-boxes me-1"></i>Quantity</th>
                        <th><i class="fas fa-calendar-alt me-1"></i>Expiry Date</th>
                        <th><i class="fas fa-file-prescription me-1"></i>Prescription</th>
                        <th><i class="fas fa-tools me-1"></i>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${medicines}" var="medicine">
                        <tr>
                            <td>${medicine.name}</td>
                            <td>${medicine.manufacturer}</td>
                            <td>
                                <span class="badge bg-secondary badge-category">${medicine.category}</span>
                            </td>
                            <td>$${medicine.price}</td>
                            <td class="${medicine.quantity <= 10 ? 'text-danger fw-bold' : ''}">
                                    ${medicine.quantity}
                            </td>
                            <td>${medicine.expiryDateAsString}</td>
                            <td>
                                <span class="badge ${medicine.requiresPrescription ? 'bg-danger' : 'bg-success'}">
                                        ${medicine.requiresPrescription ? 'Yes' : 'No'}
                                </span>
                            </td>
                            <td class="action-buttons">
                                <a href="${pageContext.request.contextPath}/medicine/edit?id=${medicine.id}" class="btn btn-sm btn-outline-primary" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/medicine/delete?id=${medicine.id}" class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Are you sure you want to delete this medicine?')" title="Delete">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
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
