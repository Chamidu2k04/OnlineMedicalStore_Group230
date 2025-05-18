<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Supplier</title>
    <link rel="stylesheet" href="../styles/addSupplier.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 for Toasts -->
</head>
<body>

<div class="form-container">
    <h2>Add New Supplier</h2>

    <!-- Supplier Add Form -->
    <form id="supplierForm" action="${pageContext.request.contextPath}/addSupplier" method="post" class="supplier-form">
        <label for="id">Supplier ID</label>
        <input type="text" name="id" id="id" required>
        <span id="idError" class="error-message"></span> <!-- Error message for Supplier ID -->

        <label for="name">Name</label>
        <input type="text" name="name" id="name" required>
        <span id="nameError" class="error-message"></span> <!-- Error message for Name -->

        <label for="email">Email Address</label>
        <input type="email" name="email" id="email" required>
        <span id="emailError" class="error-message"></span>

        <label for="type">Supplier Type</label>
        <select name="type" id="type" required>
            <option value="Wholesaler">Wholesaler</option>
            <option value="Manufacturer">Manufacturer</option>
            <option value="Distributor">Distributor</option>
        </select>
<br>
 <br><br>
        <label for="contact">Contact</label>
        <input type="text" name="contact" id="contact" required>
        <span id="contactError" class="error-message"></span> <!-- Error message for Contact -->

        <button type="submit">Add Supplier</button>
    </form>
</div>

<!-- Toast Message Div (Hidden initially) -->
<div id="toast" class="toast-message"></div>

<script>
    // Function to display a toast message
    function showToast(message, type) {
        const toast = document.getElementById('toast');
        toast.textContent = message;
        toast.style.backgroundColor = type === 'success' ? '#28a745' : '#dc3545'; // Green for success, Red for error
        toast.style.display = 'block';

        setTimeout(() => {
            toast.style.display = 'none';
        }, 3000); // Hide after 3 seconds
    }

    // Form Validation and Submission
    document.getElementById('supplierForm').addEventListener('submit', function (e) {
        e.preventDefault(); // Prevent form submission initially

        let isValid = true;

        // Get the values of the form fields
        const id = document.getElementById('id').value.trim();
        const name = document.getElementById('name').value.trim();
        const contact = document.getElementById('contact').value.trim();
        const email = document.getElementById('email').value.trim();
        const type = document.getElementById('type').value;


        // Clear previous error messages
        document.getElementById('idError').textContent = '';
        document.getElementById('nameError').textContent = '';
        document.getElementById('contactError').textContent = '';
        document.getElementById('emailError').textContent = '';

        // Validation for Supplier ID (must be numeric)
        if (!id) {
            document.getElementById('idError').textContent = 'Supplier ID is required.';
            isValid = false;
        } else if (!/^\d+$/.test(id)) { // Ensure the Supplier ID is numeric
            document.getElementById('idError').textContent = 'Supplier ID must be numeric.';
            isValid = false;
        }

        // Email Validation
        if (!email) {
            document.getElementById('emailError').textContent = 'Email is required.';
            isValid = false;
        } else if (!/\S+@\S+\.\S+/.test(email)) {
            document.getElementById('emailError').textContent = 'Invalid email format.';
            isValid = false;
        }

        // Validation for Name
        if (!name) {
            document.getElementById('nameError').textContent = 'Name is required.';
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(name)) {
            document.getElementById('nameError').textContent = 'Name must contain only letters and spaces.';
            isValid = false;
        }

        // Validation for Contact (must be a 10-digit number)
        if (!contact) {
            document.getElementById('contactError').textContent = 'Contact is required.';
            isValid = false;
        } else if (!/^\d{10}$/.test(contact)) {
            document.getElementById('contactError').textContent = 'Contact must be a 10-digit number.';
            isValid = false;
        }

        if (isValid) {
            // If validation is successful, show a success message and submit the form
            showToast('Supplier added successfully!', 'success');
            setTimeout(() => {
                document.getElementById('supplierForm').submit();
            }, 3000); // Submit the form after 3 seconds to show the success toast
        } else {
            // If there are validation errors, show an error toast
            showToast('Please fix the errors in the form.', 'error');
        }
    });
</script>

</body>
</html>
