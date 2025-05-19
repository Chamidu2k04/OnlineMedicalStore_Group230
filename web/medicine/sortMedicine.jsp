<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sort Medicines</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f9ff;
            font-family: 'Segoe UI', sans-serif;
        }
        .header {
            background-color: #d0ebff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .header h1 {
            font-weight: bold;
            color: #007bff;
        }
        .card-header {
            background-color: #cfe2ff;
            border-bottom: 2px solid #b6d4fe;
        }
        .card-body {
            background-color: #e7f5ff;
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-primary {
            background-color: #339af0;
            border: none;
        }
        .btn-secondary {
            background-color: #74c0fc;
            border: none;
        }
        .btn-success, .btn-outline-primary {
            border-radius: 8px;
        }
        .medicine-table th {
            background-color: #228be6 !important;
            color: white;
        }
        footer {
            font-size: 0.9rem;
            color: #6c757d;
        }
        .table td, .table th {
            vertical-align: middle;
        }
        .icon {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <div class="header">
        <h1><i class="bi bi-capsule-pill"></i> Medicine Management System</h1>
        <p class="text-muted">Sort and manage your medicine inventory</p>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h3><i class="bi bi-sort-alpha-down"></i> Sort Medicines</h3>
                </div>
                <div class="card-body">
                    <form action="sortMedicines" method="post" class="mb-3">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group mb-2">
                                    <label for="sortBy"><i class="bi bi-funnel-fill icon"></i>Sort By:</label>
                                    <select name="sortBy" id="sortBy" class="form-control">
                                        <option value="name">Medicine Name</option>
                                        <option value="expiry">Expiry Date</option>
                                        <option value="price">Price</option>
                                        <option value="stock">Stock Quantity</option>
                                        <option value="manufacturer">Manufacturer</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group mb-2">
                                    <label for="sortOrder"><i class="bi bi-arrow-down-up icon"></i>Sort Order:</label>
                                    <select name="sortOrder" id="sortOrder" class="form-control">
                                        <option value="asc">Ascending</option>
                                        <option value="desc">Descending</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 d-flex align-items-end mb-2">
                                <button type="submit" class="btn btn-primary"><i class="bi bi-arrow-down-up icon"></i>Sort</button>
                                <a href="resetSort" class="btn btn-secondary ms-2"><i class="bi bi-arrow-counterclockwise icon"></i>Reset</a>
                            </div>
                        </div>
                    </form>

                    <div class="table-responsive medicine-table">
                        <table class="table table-striped table-hover shadow-sm">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th><i class="bi bi-capsule"></i> Name</th>
                                <th><i class="bi bi-calendar-x"></i> Expiry</th>
                                <th><i class="bi bi-currency-dollar"></i> Price</th>
                                <th><i class="bi bi-box-seam"></i> Stock</th>
                                <th><i class="bi bi-building"></i> Manufacturer</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="medicine" items="${medicines}">
                                <tr>
                                    <td>${medicine.id}</td>
                                    <td>${medicine.name}</td>
                                    <td>${medicine.expiryDate}</td>
                                    <td>$${medicine.price}</td>
                                    <td>${medicine.stock}</td>
                                    <td>${medicine.manufacturer}</td>
                                    <td>
                                        <a href="editMedicine?id=${medicine.id}" class="btn btn-sm btn-warning"><i class="bi bi-pencil-square"></i></a>
                                        <a href="deleteMedicine?id=${medicine.id}" class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this medicine?')"><i class="bi bi-trash3-fill"></i></a>
                                        <a href="viewDetails?id=${medicine.id}" class="btn btn-sm btn-info"><i class="bi bi-info-circle-fill"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty medicines}">
                                <tr>
                                    <td colspan="7" class="text-center text-danger">No medicines found.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <div class="d-flex justify-content-between">
                <a href="addMedicine.jsp" class="btn btn-success"><i class="bi bi-plus-circle"></i> Add New Medicine</a>
                <a href="dashboard" class="btn btn-outline-primary"><i class="bi bi-arrow-left-circle"></i> Back to Dashboard</a>
            </div>
        </div>
    </div>
</div>

<footer class="text-center mt-5 mb-3">
    <p>&copy; 2025 <i class="bi bi-heart-pulse"></i> Medicine Management System. All rights reserved.</p>
</footer>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
