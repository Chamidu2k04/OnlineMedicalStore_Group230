<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Medicine</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 700px;
            margin: 0 auto;
        }
        .required-field::after {
            content: "*";
            color: red;
            margin-left: 4px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="form-container">
            <h1>Add New Medicine</h1>

            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/medicine/add" method="post" class="mt-4">
                <div class="mb-3 row">
                    <label for="name" class="col-sm-3 col-form-label required-field">Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="manufacturer" class="col-sm-3 col-form-label required-field">Manufacturer</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="manufacturer" name="manufacturer" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="category" class="col-sm-3 col-form-label">Category</label>
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
                    <label for="price" class="col-sm-3 col-form-label required-field">Price ($)</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="price" name="price" step="0.01" min="0" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="quantity" class="col-sm-3 col-form-label required-field">Quantity</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="quantity" name="quantity" min="0" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="expiryDate" class="col-sm-3 col-form-label">Expiry Date</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="expiryDate" name="expiryDate">
                        <small class="text-muted">Format: YYYY-MM-DD</small>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="description" class="col-sm-3 col-form-label">Description</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-sm-9 offset-sm-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="requiresPrescription" name="requiresPrescription">
                            <label class="form-check-label" for="requiresPrescription">
                                Requires Prescription
                            </label>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <div class="col-sm-9 offset-sm-3">
                        <button type="submit" class="btn btn-primary">Add Medicine</button>
                        <a href="${pageContext.request.contextPath}/medicine/" class="btn btn-secondary ms-2">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>