<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Medicine</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f8fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            max-width: 750px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .form-header i {
            font-size: 2rem;
            color: #0d6efd;
        }

        .required-field::after {
            content: "*";
            color: red;
            margin-left: 4px;
        }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.2rem rgba(13,110,253,.25);
        }

        .form-check-input:checked {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        .btn-primary {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <div class="form-header">
            <i class="bi bi-capsule-pill"></i>
            <h2 class="mb-0">Edit Medicine</h2>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/medicine/edit" method="post">
            <input type="hidden" name="id" value="${medicine.id}">

            <div class="mb-3 row">
                <label for="name" class="col-sm-3 col-form-label required-field">
                    <i class="bi bi-capsule"></i> Name
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="name" name="name" value="${medicine.name}" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="manufacturer" class="col-sm-3 col-form-label required-field">
                    <i class="bi bi-building"></i> Manufacturer
                </label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="manufacturer" name="manufacturer" value="${medicine.manufacturer}" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="category" class="col-sm-3 col-form-label">
                    <i class="bi bi-tags"></i> Category
                </label>
                <div class="col-sm-9">
                    <select class="form-select" id="category" name="category">
                        <option value="Antibiotics" ${medicine.category == 'Antibiotics' ? 'selected' : ''}>Antibiotics</option>
                        <option value="Analgesics" ${medicine.category == 'Analgesics' ? 'selected' : ''}>Analgesics</option>
                        <option value="Antacids" ${medicine.category == 'Antacids' ? 'selected' : ''}>Antacids</option>
                        <option value="Antihistamines" ${medicine.category == 'Antihistamines' ? 'selected' : ''}>Antihistamines</option>
                        <option value="Vitamins" ${medicine.category == 'Vitamins' ? 'selected' : ''}>Vitamins</option>
                        <option value="Other" ${medicine.category == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="price" class="col-sm-3 col-form-label required-field">
                    <i class="bi bi-currency-dollar"></i> Price
                </label>
                <div class="col-sm-9">
                    <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" value="${medicine.price}" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="quantity" class="col-sm-3 col-form-label required-field">
                    <i class="bi bi-stack"></i> Quantity
                </label>
                <div class="col-sm-9">
                    <input type="number" class="form-control" id="quantity" name="quantity" min="0" value="${medicine.quantity}" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="expiryDate" class="col-sm-3 col-form-label">
                    <i class="bi bi-calendar-date"></i> Expiry Date
                </label>
                <div class="col-sm-9">
                    <input type="date" class="form-control" id="expiryDate" name="expiryDate" value="${medicine.expiryDateAsString}">
                    <small class="text-muted">Format: YYYY-MM-DD</small>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="description" class="col-sm-3 col-form-label">
                    <i class="bi bi-card-text"></i> Description
                </label>
                <div class="col-sm-9">
                    <textarea class="form-control" id="description" name="description" rows="3">${medicine.description}</textarea>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-sm-9 offset-sm-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="requiresPrescription" name="requiresPrescription" ${medicine.requiresPrescription ? 'checked' : ''}>
                        <label class="form-check-label" for="requiresPrescription">
                            <i class="bi bi-file-earmark-medical"></i> Requires Prescription
                        </label>
                    </div>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-sm-9 offset-sm-3">
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-check-circle"></i> Update Medicine
                    </button>
                    <a href="${pageContext.request.contextPath}/medicine/" class="btn btn-secondary ms-2">
                        <i class="bi bi-x-circle"></i> Cancel
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
