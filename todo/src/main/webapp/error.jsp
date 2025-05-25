<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404 Error</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2; 
        }
        #error-container {
           background: linear-gradient(135deg, #8e9eab, #eef2f3);
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        #button {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: black;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        #button:hover {
            background-color: rgba(255, 255, 255, 1);
        }
    </style>
</head>
<body>

    <div id="error-container">
        <h1>404 - Page Not Found</h1>
        <a id="button" href="index.jsp">Back</a>
    </div>

</body>
</html>
