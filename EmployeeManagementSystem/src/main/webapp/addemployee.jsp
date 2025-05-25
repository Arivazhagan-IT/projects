<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            margin: 0;
        }
        .signup-form {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            transform: scale(0.8);
            animation: scaleUp 0.5s forwards;
        }
        @keyframes scaleUp {
            to {
                transform: scale(1);
            }
        }
        .signup-form h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333333;
            text-align: center;
        }
        .signup-form label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
        }
        .signup-form input {
            width: 80%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f7f7f7;
            transition: all 0.3s ease;
        }
        .signup-form input:focus {
            background-color: #ffffff;
            border-color: #007bff;
            outline: none;
            transform: scale(1.02);
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .signup-form button {
            width: 100%;
            padding: 12px 0;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .signup-form button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
        }
    </style>
</head>
<body>
    <form:form action="addemp" modelAttribute="emp" class="signup-form">
        <h2>Sign Up</h2>
        <label for="empName">Name</label>
        <form:input path="empName" id="empName" required="true" />
        <label for="empCity">City</label>
        <form:input path="empCity" id="empCity" required="true" />
        <label for="empEmail">Email</label>
        <form:input path="empEmail" id="empEmail" required="true" />
        <label for="empContact">Contact</label>
        <form:input path="empContact" id="empContact" required="true" />
        <label for="empPassword">Password</label>
        <form:password path="empPassword" id="empPassword" required="true" />
        <button type="submit">Submit</button>
    </form:form>
</body>
</html>
