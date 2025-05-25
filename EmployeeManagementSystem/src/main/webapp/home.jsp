<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee List</title>
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
            padding: 20px;
            box-sizing: border-box;
            position: relative;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 900px;
            background-color: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transform: scale(0.8);
            animation: scaleUp 0.5s forwards;
        }
        @keyframes scaleUp {
            to {
                transform: scale(1);
            }
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f7f7f7;
        }
        tr:hover {
            background-color: #e9e9e9;
            transform: scale(1.01);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            transition: all 0.3s ease;
        }
        .button {
            display: inline-block;
            padding: 8px 12px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            text-align: center;
        }
        .button-delete {
            background-color: #dc3545;
            color: #ffffff;
        }
        .button-delete:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }
        .button-edit {
            background-color: #007bff;
            color: #ffffff;
        }
        .button-edit:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .button-add {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: #ffffff;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .button-add:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<table>
    <tr>
        <th>Emp ID</th>
        <th>Emp Name</th>
        <th>Emp City</th>
        <th>Emp Email</th>
        <th>Emp Contact</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
    <c:forEach var="emp" items="${emps}">
        <tr>
        
            <td>${emp.empId}</td>
            <td>${emp.empName}</td>
            <td>${emp.empCity}</td>
            <td>${emp.empEmail}</td>
            <td>${emp.empContact}</td>
            <td><a href="deleteEmployee?id=${emp.empId}" class="button button-delete">Delete</a></td>
            <td><a href="editEmployee?id=${emp.empId}" class="button button-edit">Edit</a></td>
        </tr>
    </c:forEach>
</table>

<a href="addEmployee" class="button button-add">Add Employee</a>

</body>
</html>
