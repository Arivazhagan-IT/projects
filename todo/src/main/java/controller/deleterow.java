package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoclass.taskdao;
import dtoclass.Taskdto;
import dtoclass.Userdto;
@WebServlet("/deleterow")
public class deleterow extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		taskdao td=new taskdao();
		String Str = req.getParameter("id");
		System.out.println("finded task delete id "+ Str);
		int id=Integer.parseInt(Str);
		Userdto d=(Userdto)req.getSession().getAttribute("userdata");
		int num=d.getUid();
		try {
			td.DeleteTask(id);
		resp.sendRedirect("Home.jsp");
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}

}
