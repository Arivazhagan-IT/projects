package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoclass.taskdao;
import dtoclass.Taskdto;
import dtoclass.Userdto;
@WebServlet("/TaskFilled")
public class AddTask extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		taskdao da=new taskdao();
		int check=1;
		try {
			check=da.findId();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

		int id=check;
		String title=req.getParameter("Title");
		String Desc=req.getParameter("desc");
		String priority=req.getParameter("priority");
		String dt=req.getParameter("duedate");

		Userdto u=(Userdto)req.getSession().getAttribute("userdata");
		int uid=u.getUid();

		Taskdto t=new Taskdto();
		t.setTaskid(id);
		t.setTaskTitle(title);
		t.setTaskDescription(Desc);
		t.setTaskPriority(priority);
		t.setTaskDueDate(dt);
		t.setUserid(uid);



		try {
			da.SaveTask(t);
			resp.sendRedirect("Home.jsp");
//			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	}

}
