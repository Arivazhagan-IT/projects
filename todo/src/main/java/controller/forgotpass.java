package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoclass.userdao;
import dtoclass.Userdto;


@WebServlet("/forgotpassword")
public class forgotpass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        userdao dao = new userdao();

        try {
            Userdto user = dao.findByEmail(email);
            if (user != null) {
                String newPass = PasswordGenerator.generatePassword();
                user.setPassword(newPass); // Update the password of the retrieved user
                dao.updateprofile(user); // Save the updated user profile

                boolean emailSent = EmailUtil.sendEmail(email, "Your new password", "Your new password is: " + newPass);
                
                if (emailSent) {
                    req.setAttribute("message", "New password has been sent to your email.");
                } else {
                    req.setAttribute("error", "Error in sending email. Please try again later.");
                }
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            } else {
                req.setAttribute("checkers", "Email is not registered");
                req.getRequestDispatcher("forgotpassword.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("forgotpassword.jsp").forward(req, resp);
        }
    }
}
