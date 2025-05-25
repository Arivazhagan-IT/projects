<%@page import="daoclass.userdao"%>
<%@page import="dtoclass.Userdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
<style>
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes bounceIn {
        0%, 20%, 50%, 80%, 100% {
            transform: translateY(0);
        }
        40% {
            transform: translateY(-30px);
        }
        60% {
            transform: translateY(-15px);
        }
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        animation: fadeIn 1s ease-out;
    }

    .login-container {
        background: rgba(255, 255, 255, 0.3);
        padding: 40px;
        border-radius: 12px;
        backdrop-filter: blur(10px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        position: relative;
        width: 400px;
        animation: fadeIn 2s ease-out;
    }

    .login-container::before {
        content: '';
        width: 80px;
        height: 80px;
        background: #6a11cb;
        border-radius: 50%;
        position: absolute;
        top: -40px;
        left: 50%;
        transform: translateX(-50%);
        animation: bounceIn 1s;
    }

    .login-container .avatar {
        width: 60px;
        height: 60px;
        background: #fff;
        border-radius: 50%;
        position: absolute;
        top: -30px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        justify-content: center;
        align-items: center;
        animation: bounceIn 1s;
    }

    .login-container .avatar svg {
        width: 30px;
        height: 30px;
        fill: #6a11cb;
    }

    .login-container h2 {
        margin-bottom: 20px;
        color: #fff;
        font-size: 24px;
    }

    .login-container input[type="text"], 
    .login-container input[type="password"], 
    .login-container input[type="email"], 
    .login-container input[type="tel"], 
    .login-container input[type="file"] {
        width: calc(100% - 40px);
        padding: 12px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        background: rgba(255, 255, 255, 0.8);
        font-size: 16px;
        transition: box-shadow 0.3s ease;
    }

    .login-container input[type="text"]:focus, 
    .login-container input[type="password"]:focus, 
    .login-container input[type="email"]:focus, 
    .login-container input[type="tel"]:focus, 
    .login-container input[type="file"]:focus {
        box-shadow: 0 0 10px rgba(106, 17, 203, 0.5);
        outline: none;
    }

    .login-container .password-container {
        position: relative;
    }

    .login-container .password-container input[type="password"] {
        width: calc(100% - 40px);
    }

    .login-container .password-container .toggle-password {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }

    .login-container button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 5px;
        background: #6a11cb;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s;
    }

    .login-container button:hover {
        background: #5a0cb9;
        transform: translateY(-3px);
    }

    .message {
        margin-top: 15px;
        color: red;
    }

    span {
        color: red;
    }
</style>
</head>
<body>
    <div class="login-container">
        <div class="avatar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5zm0 2c-4.411 0-8 3.589-8 8 0 1.105.895 2 2 2h12c1.105 0 2-.895 2-2 0-4.411-3.589-8-8-8z"/>
            </svg>
        </div>
        <h2>Signup</h2>
        <form method="post" action="signupServer" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="User Name" required><br>
            <input type="file" name="profile" required><br>
            <input type="email" name="mail" placeholder="User Email" required><br>
            <input type="tel" name="con" placeholder="User Contact" required><br>
            <div class="password-container">
                <input type="password" name="pass" placeholder="Password" required>
                <span class="toggle-password" onclick="togglePassword()">👁️</span>
            </div>
            <% String msg = (String) request.getAttribute("message"); %>
            <% if (msg != null) { %>
                <span><%= msg %></span>
            <% } %>
            
            <br>
            
            <a href="login.jsp">Already you have account?</a>
            <br>
            <br>
            <button type="submit">Signup</button>
            
            
        </form>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.querySelector('.password-container input');
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
        }
    </script>
</body>
</html>
