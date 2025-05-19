
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #ccc;
            width: 320px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff; /* Blue heading */
        }
        input[type=text], input[type=password], button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type=text], input[type=password] {
            border: 1px solid #ccc;
        }
        button {
            background: linear-gradient(90deg, #007bff, #00c6ff);
            border: none;
            color: white;
            font-weight: bold;
            transition: background 0.3s ease;
        }
        button:hover {
            background: linear-gradient(90deg, #0056b3, #0099cc);
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Admin Login</h2>

    <form method="post" action="login">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>



</div>
</body>
</html>
