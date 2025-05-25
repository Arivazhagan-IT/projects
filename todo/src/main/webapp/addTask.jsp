<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Form</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background: rgba(255, 255, 255, 0.3);
        padding: 40px;
        border-radius: 12px;
        backdrop-filter: blur(10px);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        position: relative;
        width: 400px;
    }

    .form-container::before {
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

    .form-container .avatar {
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

    .form-container .avatar svg {
        width: 30px;
        height: 30px;
        fill: #6a11cb;
    }

    .form-container h2 {
        margin-bottom: 20px;
        color: #fff;
        font-size: 24px;
    }

    .form-container input[type="text"], 
    .form-container input[type="date"], 
    .form-container textarea {
        width: calc(100% - 40px);
        padding: 12px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        background: rgba(255, 255, 255, 0.8);
        font-size: 16px;
    }

    .form-container input[type="radio"] {
        display: inline-block;
        width: auto;
    }

    .form-container .radio-label {
        display: inline-block;
        margin-right: 20px;
        color: #fff;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 5px;
        background: #6a11cb;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background: #5a0cb9;
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
    <div class="form-container">
        <div class="avatar">
         
        </div>
        <h2>Task Form</h2>
        <form action="TaskFilled" method="post">
            <label for="title">TaskTitle:</label>
            <input type="text" id="title" name="Title" required>
            
            <label for="desc">TaskDescription:</label>
            <input type="text" id="desc" name="desc" required>
            
            <label class="radio-label">TaskPriority:</label>
            <label class="radio-label">
                <input type="radio" name="priority" value="low" required> Low
            </label>
            <label class="radio-label">
                <input type="radio" name="priority" value="high" required> High
            </label>
            <br>
            <label for="duedate">DueDate:</label>
            <input type="date" id="duedate" name="duedate" required>
            
            <input type="submit" value="Submit">
            <br>
            <br>
            <%request.getSession().getAttribute("userdata"); %>
            <a href="Home.jsp">Back</a>
        </form>
    </div>
</body>
</html>
