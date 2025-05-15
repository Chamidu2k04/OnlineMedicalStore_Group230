<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Medicine</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: #f3f7fa;
        }
        .form-container {
            max-width: 750px;
            margin: 50px auto;
        }
        .form-card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .form-header {
            color: #0d6efd;
            font-weight: bold;
        }
        .required-field::after {
            content: "*";
            color: red;
            margin-left: 4px;
        }
        .form-label i {
            margin-right: 6px;
            color: #0d6efd;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <div class="form-card">
            <h2 class="form-header text-center mb-4"><i class="fas fa-pills"></i> Add New Medicine</h2>

<<<<<<< Updated upstream
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                        ${error}
                </div>
            </c:if>
=======
            <br>
>>>>>>> Stashed changes

            <form action="${pageContext.request.contextPath}/medicine/add" method="post">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-3 col-form-label required-field form-label">
                        <i class="fas fa-capsules"></i> Name
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="manufacturer" class="col-sm-3 col-form-label required-field form-label">
                        <i class="fas fa-industry"></i> Manufacturer
                    </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="manufacturer" name="manufacturer" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="category" class="col-sm-3 col-form-label form-label">
                        <i class="fas fa-layer-group"></i> Category
                    </label>
                    <div class="col-sm-9">
                        <select class="form-select" id="category" name="category">
                            <option value="Antibiotics">Antibiotics</option>
                            <option value="Analgesics">Analgesics</option>
                            <option value="Antacids">Antacids</option>
                            <option value="Antihistamines">Antihistamines</option>
                            <option value="Vitamins">Vitamins</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="price" class="col-sm-3 col-form-label required-field form-label">
                        <i class="fas fa-dollar-sign"></i> Price ($)
                    </label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="quantity" class="col-sm-3 col-form-label required-field form-label">
                        <i class="fas fa-sort-numeric-up"></i> Quantity
                    </label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="quantity" name="quantity" min="0" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="expiryDate" class="col-sm-3 col-form-label form-label">
                        <i class="fas fa-calendar-alt"></i> Expiry Date
                    </label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="expiryDate" name="expiryDate">
                        <small class="text-muted">Format: YYYY-MM-DD</small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="description" class="col-sm-3 col-form-label form-label">
                        <i class="fas fa-align-left"></i> Description
                    </label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-sm-9 offset-sm-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="requiresPrescription" name="requiresPrescription">
                            <label class="form-check-label" for="requiresPrescription">
                                <i class="fas fa-file-prescription"></i> Requires Prescription
                            </label>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-sm-9 offset-sm-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus-circle"></i> Add Medicine
                        </button>
                        <a href="${pageContext.request.contextPath}/medicine/" class="btn btn-secondary ms-2">
                            <i class="fas fa-times-circle"></i> Cancel
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
