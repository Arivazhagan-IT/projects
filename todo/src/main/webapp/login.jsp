<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #6a11cb, #2575fc);
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	animation: gradientBackground 15s ease infinite;
}

@
keyframes gradientBackground { 0% {
	background: linear-gradient(to right, #6a11cb, #2575fc);
}

50
%
{
background
:
linear-gradient(
to
left
,
#2575fc
,
#6a11cb
);
}
100
%
{
background
:
linear-gradient(
to
right
,
#6a11cb
,
#2575fc
);
}
}
.login-container {
	background: rgba(255, 255, 255, 0.3);
	padding: 40px;
	border-radius: 12px;
	backdrop-filter: blur(10px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	text-align: center;
	position: relative;
	width: 360px;
	transition: transform 0.3s ease;
}

.login-container:hover {
	transform: translateY(-10px);
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

.login-container input[type="text"], .login-container input[type="password"]
	{
	width: calc(100% - 40px);
	padding: 12px;
	margin: 10px 0;
	border: none;
	border-radius: 5px;
	background: rgba(255, 255, 255, 0.8);
	font-size: 16px;
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
	transition: background 0.3s ease, transform 0.3s ease;
}

.login-container button:hover {
	background: #5a0cb9;
	transform: translateY(-3px);
}

.login-container .options {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
	font-size: 14px;
	color: #fff;
}

.login-container .options a {
	color: #fff;
	text-decoration: none;
	transition: color 0.3s ease;
}

.login-container .options a:hover {
	color: #5a0cb9;
}

.login-container .options input {
	margin-right: 5px;
}

.message {
	margin-top: 15px;
	color: red;
}

@media ( max-width : 480px) {
	.login-container {
		width: 90%;
		padding: 30px;
	}
	.login-container input[type="text"], .login-container input[type="password"]
		{
		width: calc(100% - 30px);
	}
	.login-container .password-container input[type="password"] {
		width: calc(100% - 30px);
	}
}

.gap {
	gap: 20px;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="avatar">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path
					d="M12 12c2.761 0 5-2.239 5-5s-2.239-5-5-5-5 2.239-5 5 2.239 5 5 5zm0 2c-4.411 0-8 3.589-8 8 0 1.105.895 2 2 2h12c1.105 0 2-.895 2-2 0-4.411-3.589-8-8-8z" />
            </svg>
		</div>
		<h2>Login</h2>
		<form method="post" action="checkUser">
			<input type="text" name="mail" placeholder="Email ID" required><br>
			<div class="password-container">
				<input type="password" name="pass" placeholder="Password" required>
				<span class="toggle-password" onclick="togglePassword()">👁️</span>
			</div>
			<% String msg = (String) request.getAttribute("message"); %>
			<% if (msg != null) { %>
			<span class="message"><%= msg %></span>
			<% } %>
			<div class="options">
				<label> <input type="checkbox"> Remember me
				</label> <a href="checkmail.jsp">Forgot Password?</a>
			</div>
			<button type="submit">Login</button>
			<br> <br> <a href="index.jsp">Back</a> <a
				style="margin-left:70px;" href="signup.jsp">New Account</a>

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
