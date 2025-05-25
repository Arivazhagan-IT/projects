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
@WebServlet("/updateProfile")
@MultipartConfig
public class editprofile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Userdto u1=(Userdto)req.getSession().getAttribute("userdata");
		int id=u1.getUid();
		String nam=req.getParameter("name");
		String mail=req.getParameter("mail");
		Long num=Long.parseLong(req.getParameter("con"));
		String pass=u1.getPassword();
		Part p=req.getPart("profile");
		byte[]img=p.getInputStream().readAllBytes();
		
		
		Userdto u=new Userdto();
		u.setUid(id);
		u.setUname(nam);
		u.setUmail(mail);
		u.setContact(num);
		u.setImage(img);
		u.setPassword(pass);
		userdao d=new userdao();
		try {
			d.updateprofile(u);
			resp.sendRedirect("profile.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
