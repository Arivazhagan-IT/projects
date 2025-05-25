package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import daoclass.userdao;
import dtoclass.Userdto;
@WebServlet("/signupServer")
@MultipartConfig
public class signServer extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	userdao d=new userdao();
	int a=0;
	 try {
		a=d.finduid();
	} catch (Exception e) {
	
		e.printStackTrace();
	}

	int id=a;
	String nam=req.getParameter("name");
	String mail=req.getParameter("mail");
	Long num=Long.parseLong(req.getParameter("con"));
	String pass=req.getParameter("pass");
	Part p=req.getPart("profile");
	byte[]img=p.getInputStream().readAllBytes();
	
	
	Userdto u=new Userdto();
	u.setUid(id);
	u.setUname(nam);
	u.setUmail(mail);
	u.setContact(num);
	u.setImage(img);
	u.setPassword(pass);
	
	boolean emailExists;
	try {
		emailExists = d.checkEmail(mail);
		 if (emailExists) {
	           req.setAttribute("message", "Email already exists. Please use a different email.");
	           req.getRequestDispatcher("signup.jsp").forward(req, resp);
	       }
		 else {
			 try {
					int j=d.SaveUser(u);
				     resp.sendRedirect("login.jsp");
				} catch (Exception e) {
				
					e.printStackTrace();
				}
		 }
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	  

	
	
	
}
}
