<%@ page import="java.util.Base64" %>
<%@ page import="dtoclass.Userdto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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

        .profile-container {
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

        .profile-container img {
            display: block;
            margin: 0 auto 20px;
            border-radius: 50%;
            border: 3px solid #fff;
        }

        .profile-container p {
            margin: 10px 0;
            color: #fff;
            font-size: 18px;
        }

        .profile-container p strong {
            color: #e0e0e0;
        }

        .profile-container button {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: #6a11cb;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s;
        }

        .profile-container button:hover {
            background: #5a0cb9;
            transform: translateY(-3px);
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            animation: fadeIn 0.5s ease-out;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-content input[type="text"], 
        .modal-content input[type="email"], 
        .modal-content input[type="tel"], 
        .modal-content input[type="file"] {
            width: calc(100% - 40px);
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: rgba(0,0,0,0.1);
            font-size: 16px;
        }

        .modal-content button {
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

        .modal-content button:hover {
            background: #5a0cb9;
            transform: translateY(-3px);
        }

        @media (max-width: 480px) {
            .profile-container {
                width: 90%;
                padding: 30px;
            }

            .profile-container p {
                font-size: 16px;
            }

            .profile-container img {
                width: 100px;
                height: 100px;
            }
        }
        #back-button {
    color: white;
    background-color: 
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background 0.3s ease, transform 0.2s;
}

#back-button:hover {
    background-color: #5a0cb9;
    transform: translateY(-3px);
}

#back-button a {
    color: white;
    text-decoration: none;
}

    </style>
</head>
<body>
    <div class="profile-container">
        <% 
            Userdto d = (Userdto)request.getSession().getAttribute("userdata");
        %>
        <p><strong>User Name:</strong> <%= d.getUname() %></p>
        <p><strong>Contact:</strong> <%= d.getContact() %></p>
        <p><strong>Email:</strong> <%= d.getUmail() %></p>
        <% 
            String image = new String(Base64.getEncoder().encode(d.getImage()));
        %>
        <img src="data:image/jpeg;base64,<%= image %>" height="150px" width="150px" alt="Profile Image">
        
        
        <button id="back-button" ><a href="Home.jsp">Back</a></button>
     <!--   <button id="editProfileBtn">Edit Profile</button>-->
    </div>

    <!-- The Modal -->
    <div id="editProfileModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Edit Profile</h2>
            <form method="post" action="updateProfile" enctype="multipart/form-data">
                <input type="text" name="name" placeholder="User Name" value="<%= d.getUname() %>" required><br>
                <input type="file" name="profile"><br>
                <input type="email" name="mail" placeholder="User Email" value="<%= d.getUmail() %>" required><br>
                <input type="tel" name="con" placeholder="User Contact" value="<%= d.getContact() %>" required><br>
                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>

    <script>

        var modal = document.getElementById("editProfileModal");

        var btn = document.getElementById("editProfileBtn");

        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>
