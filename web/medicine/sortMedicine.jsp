<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sort Medicines</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .medicine-table {
            margin-top: 20px;
        }
        .sort-button {
            margin-right: 5px;
        }
        .header {
            background-color: #f8f9fa;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="header">
            <h1 class="text-center">Medicine Management System</h1>
            <p class="text-center">Sort and manage your medicine inventory</p>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Sort Medicines</h3>
                    </div>
                    <div class="card-body">
                        <form action="sortMedicines" method="post" class="mb-3">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="sortBy">Sort By:</label>
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
                                    <div class="form-group">
                                        <label for="sortOrder">Sort Order:</label>
                                        <select name="sortOrder" id="sortOrder" class="form-control">
                                            <option value="asc">Ascending</option>
                                            <option value="desc">Descending</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex align-items-end">
                                    <button type="submit" class="btn btn-primary">Sort</button>
                                    <a href="resetSort" class="btn btn-secondary ms-2">Reset</a>
                                </div>
                            </div>
                        </form>

                        <div class="table-responsive medicine-table">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Medicine Name</th>
                                        <th>Expiry Date</th>
                                        <th>Price</th>
                                        <th>Stock</th>
                                        <th>Manufacturer</th>
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
                                                <a href="editMedicine?id=${medicine.id}" class="btn btn-sm btn-warning">Edit</a>
                                                <a href="deleteMedicine?id=${medicine.id}" class="btn btn-sm btn-danger"
                                                   onclick="return confirm('Are you sure you want to delete this medicine?')">Delete</a>
                                                <a href="viewDetails?id=${medicine.id}" class="btn btn-sm btn-info">Details</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty medicines}">
                                        <tr>
                                            <td colspan="7" class="text-center">No medicines found.</td>
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
                    <a href="addMedicine" class="btn btn-success">Add New Medicine</a>
                    <a href="dashboard" class="btn btn-outline-primary">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center mt-5 mb-3">
        <p>&copy; 2025 Medicine Management System. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>