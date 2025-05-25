package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoclass.taskdao;
import daoclass.userdao;
import dtoclass.Taskdto;
import dtoclass.Userdto;
@WebServlet("/checkUser")
public class validateUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mail=req.getParameter("mail");
		String password=req.getParameter("pass");
		taskdao dt=new taskdao();
		userdao u=new userdao();


		try {
			Userdto d=u.findByEmail(mail);

			if(d!=null) {
				if(password.equals(d.getPassword())) {
					HttpSession session=req.getSession();
					session.setAttribute("userdata",d);


					resp.sendRedirect("Home.jsp");
				}
				else {
					req.setAttribute("message","invalid Password");
					req.getRequestDispatcher("login.jsp").forward(req, resp);
				}

			}
			else {
				req.setAttribute("message","invalid Email");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}

}
