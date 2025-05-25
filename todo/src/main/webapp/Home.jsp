<%@page import="daoclass.taskdao"%>
<%@page import="java.util.Date"%>
<%@page import="dtoclass.Userdto"%>
<%@page import="dtoclass.Taskdto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Manager</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-image:
		url('https://cdn.pixabay.com/photo/2014/01/23/21/33/blue-250770_960_720.jpg');
	background-size: cover;
}

nav {
	width: 100%;
	background-color: #333;
	overflow: hidden;
	height: 60px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

nav .nav-left, nav .nav-right {
	display: flex;
	align-items: center;
}

nav a {
	color: white;
	text-align: center;
	padding: 14px 20px;
	text-decoration: none;
	font-size: 17px;
}

nav a:hover {
	background-color: #ddd;
	color: black;
}

.logout-link, .profile-button {
	margin-left: 10px;
}

.logout-link {
	border: 2px solid #45a049;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.logout-link:hover {
	background-color: #0A5001;
	color: white;
}

.profile-button {
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	padding: 12px 24px;
	color: white;
	transition: background-color 0.3s, transform 0.3s;
}

.profile-button:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}

.container {
	width: 90%;
	max-width: 1200px;
	margin: 20px auto;
	background: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 8px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 16px;
	text-align: center;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-decoration: none;
	font-size: 14px;
	margin: 2px;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s;
}

button.delete {
	background-color: #f44336;
}

button.delete:hover {
	background-color: #da190b;
}

.add-task-link {
	display: inline-block;
	padding: 10px 20px;
	margin: 20px 0;
	background-color: #4CAF50;
	color: white;
	text-align: center;
	text-decoration: none;
	font-size: 16px;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.add-task-link:hover {
	background-color: #0A5001;
}

@media ( max-width : 768px) {
	nav {
		flex-direction: column;
		height: auto;
		padding: 10px 0;
	}
	nav .nav-left, nav .nav-right {
		flex-direction: column;
		width: 100%;
	}
	nav a {
		width: 100%;
		text-align: center;
		padding: 10px 0;
	}
	.container {
		width: 95%;
	}
}
</style>
</head>
<body>
	<%
        Userdto d = (Userdto) request.getSession().getAttribute("userdata");   %>
        
        <%if(d!=null){ %>
        
       <% String name = (d != null) ? d.getUname() : "Guest"; %> 
       
  

	<nav>
		<div class="nav-left">
			<div id="welcome">
				Welcome 
				<%= name %></div>
		</div>
		<div class="nav-right">
			<a href="profile.jsp" class="profile-button">Profile</a> <a
				href="logout" class="logout-link">Logout <i
				class="fas fa-sign-out-alt"></i></a>
		</div>
	</nav>

	<div class="container">
		<%
            taskdao dt = new taskdao();
            int num = 1;
            int id = d != null ? d.getUid() : 0;
            List<Taskdto> lt = (List<Taskdto>) dt.FindTask(id);
        %>

		<% if (lt != null && !lt.isEmpty()) { %>
		<table>
			<thead>
				<tr>
					<th>Task Id</th>
					<th>Task Title</th>
					<th>Task Description</th>
					<th>Due date</th>
					<th>Priority</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% for (Taskdto task : lt) { %>
				<tr>
					<td><%= num %></td>
					<td><%= task.getTaskTitle() %></td>
					<td><%= task.getTaskDescription() %></td>
					<td><%= task.getTaskDueDate() %></td>
					<td><%= task.getTaskPriority() %></td>
					<td>
						<button>
							<a href="update.jsp?id=<%= task.getTaskid() %>"
								style="color: white;">Update</a>
						</button>
						<button class="delete">
							<a href="deleterow?id=<%= task.getTaskid() %>"
								style="color: white;">Delete</a>
						</button>
					</td>
				</tr>
				<%
                    num++;
                } %>
			</tbody>
		</table>
		<% } else { %>
		<h3>No tasks found.</h3>
		<% } %>

		<a href="addTask.jsp" class="add-task-link">Add Task <i
			class="fas fa-plus-circle"></i></a>
			
			<%}else{ %>
			
			<%response.sendRedirect("login.jsp");} %>
	</div>
</body>
</html>
