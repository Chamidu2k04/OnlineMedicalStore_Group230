<!DOCTYPE html>
<html>
<head>
    <title>Add Supplier</title>
    <link rel="stylesheet" href="../styles/addSupplier.css">

</head>
<body>
<div class="form-container">
    <h2>Add New Supplier</h2>
    <form action="${pageContext.request.contextPath}/addSupplier" method="post" class="supplier-form">
        <label for="id">Supplier ID</label>
        <input type="text" name="id" id="id" required>

        <label for="name">Name</label>
        <input type="text" name="name" id="name" required>

        <label for="contact">Contact</label>
        <input type="text" name="contact" id="contact" required>

        <button type="submit">Add Supplier</button>
    </form>
</div>
</body>
</html>
