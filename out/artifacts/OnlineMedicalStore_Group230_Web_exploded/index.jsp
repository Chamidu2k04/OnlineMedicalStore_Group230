<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediStore | Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: #f5f9ff;
            color: #333;
            line-height: 1.6;
        }

        header {
            background: #0b5394;
            padding: 20px 40px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #ffdd57;
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: linear-gradient(to right, #e3f2fd, #f5f9ff);
            padding: 60px 20px 40px;
        }

        .hero-content {
            max-width: 700px;
        }

        .hero-content h1 {
            font-size: 48px;
            color: #0b5394;
            margin-bottom: 20px;
        }

        .hero-content p {
            font-size: 20px;
            margin-bottom: 30px;
        }

        .hero-content a {
            text-decoration: none;
            padding: 12px 30px;
            background-color: #0b5394;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .hero-content a:hover {
            background-color: #08457e;
        }

        .section {
            padding: 60px 40px;
            text-align: center;
        }

        .section h2 {
            font-size: 36px;
            color: #0b5394;
            margin-bottom: 30px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 30px 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            color: #0b5394;
            margin-bottom: 15px;
        }

        .about {
            background-color: #e3f2fd;
        }

        .cta {
            background: #0b5394;
            color: white;
            padding: 60px 20px;
        }

        .cta h2 {
            margin-bottom: 20px;
        }

        .cta a {
            text-decoration: none;
            background-color: #ffdd57;
            color: #0b5394;
            font-weight: bold;
            padding: 12px 30px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .cta a:hover {
            background-color: #ffd633;
        }

        footer {
            background-color: #0b5394;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 36px;
            }

            nav ul {
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }

            .section h2 {
                font-size: 28px;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="logo">MediStore</div>
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="supplier/list.jsp">Suppliers</a></li>
            <li><a href="#">Medicines</a></li>
            <li><a href="#">Orders</a></li>
            <li><a href="feedback/list.jsp">Feedbacks</a></li>
        </ul>
    </nav>
</header>

<section class="hero">
    <div class="hero-content">
        <h1>Welcome to MediStore</h1>
        <p>Your trusted platform for managing medicines, suppliers, orders, and customer feedbacks all in one place.</p>

    </div>
</section>

<section class="section about">
    <h2>About MediStore</h2>
    <p>MediStore is a complete solution for managing your medical store's operations, from inventory and supplier management to order tracking and customer engagement. Trusted by pharmacies and medical businesses across the region.</p>
</section>

<section class="section">
    <h2>Our Services</h2>
    <div class="cards">
        <div class="card">
            <h3>Medicine Management</h3>
            <p>Organize, categorize, and track your medicine inventory efficiently with expiry reminders and stock status.</p>
        </div>
        <div class="card">
            <h3>Order Processing</h3>
            <p>Manage customer orders seamlessly and keep track of order history with real-time updates.</p>
        </div>
        <div class="card">
            <h3>Supplier Management</h3>
            <p>Maintain detailed supplier information and track procurement to ensure a steady medicine supply.</p>
        </div>
        <div class="card">
            <h3>Customer Feedback</h3>
            <p>Collect and analyze feedback to improve your services and build trust with your customers.</p>
        </div>
    </div>
</section>

<section class="cta">
    <h2>Ready to simplify your medical store operations?</h2>
    <a href="supplier/list.jsp">Explore Suppliers</a>
</section>

<footer>
    &copy; 2025 MediStore. All rights reserved.
</footer>
</body>
</html>
