<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to ToDo List</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-image: url('https://images.unsplash.com/photo-1557682224-5b8590cd9ec5');
    background-size: cover;
    background-position: center;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #ffffff;
}

#main {
    background: rgba(0, 0, 0, 0.75);
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    text-align: center;
}

h1 {
    margin-bottom: 20px;
    font-size: 32px;
    color: #ffffff;
}

a {
    display: inline-block;
    margin: 10px;
    padding: 15px 25px;
    font-size: 18px;
    color: #ffffff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.3s;
}

a:hover {
    transform: scale(1.05);
}

.login-button {
    background-color: #007bff;
}

.login-button:hover {
    background-color: #0056b3;
}

.signup-button {
    background-color: #28a745;
}


.signup-button:hover {
    background-color: #218838;
}
</style>
</head>
<body>

<div id="main">
    <h1>Welcome to Our ToDo List Application</h1>
    <a href="login.jsp" class="login-button">Login</a>
    <a href="signup.jsp" class="signup-button">Sign Up</a>
</div>

</body>
</html>
