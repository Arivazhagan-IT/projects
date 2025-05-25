package daoclass;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import dtoclass.Taskdto;
import dtoclass.Userdto;

public class taskdao {
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todoproject?user=root&password=root");
		return con;
	}

	public int SaveTask(Taskdto t) throws Exception {
		Connection con = getConnection();
		PreparedStatement  pst = con.prepareStatement("insert into tasktable  values (?,?,?,?,?,?)");
		pst.setInt(1,t.getTaskid());
		pst.setString(2,t.getTaskTitle());
		pst.setString(3, t.getTaskDescription());
		pst.setString(4,t.getTaskPriority());
//		Date d=(Date)t.getTaskDueDate();
		pst.setString(5, t.getTaskDueDate());
		pst.setInt(6, t.getUserid());

		int val=pst.executeUpdate();
		return val;
	}

	public int DeleteTask(int id) throws Exception {
		Connection con = getConnection();
		
		PreparedStatement  pst = con.prepareStatement("delete from tasktable where Taskid=?");
		pst.setInt(1, id);
		int val=	pst.executeUpdate();
		return val;
	}


	public List<Taskdto> FindTask(int n) throws Exception{
		Connection con = getConnection();
		PreparedStatement  pst = con.prepareStatement("select * from tasktable where UserId=?");
		pst.setInt(1, n);
		List<Taskdto> usertask=new ArrayList();
		ResultSet rs=pst.executeQuery();
		while(rs.next()) {
			Taskdto task=new Taskdto();
			task.setTaskid(rs.getInt(1));
			task.setTaskTitle(rs.getString(2));
			task.setTaskDescription(rs.getString(3));
			task.setTaskPriority(rs.getString(4));
			task.setTaskDueDate(rs.getString(5));
			task.setUserid(rs.getInt(6));
			usertask.add(task);
		}
		return usertask;
	}

	public int UpdateTask(Taskdto task) throws Exception {
		Connection con=getConnection();
	
		PreparedStatement pst=con.prepareStatement("UPDATE tasktable \r\n"
				+ "SET taskTitle = ?, taskDescription = ?, Priority = ?, dueDate = ? \r\n"
				+ "WHERE Taskid = ?; ");
		pst.setString(1,task.getTaskTitle());
		pst.setString(2,task.getTaskDescription() );
		pst.setString(3,task.getTaskPriority());
				pst.setString(4, task.getTaskDueDate());
				
		pst.setInt(5, task.getTaskid());

	pst.executeUpdate();
	int num=task.getUserid();
	
	return num;
	}
	public int findId() throws Exception {
		Connection con=getConnection();
	
		PreparedStatement pst=con.prepareStatement("SELECT MAX(Taskid) FROM tasktable");
		int id=0;
		
		ResultSet rs=pst.executeQuery();
		System.out.println();
		if(rs.next()) {
			id=rs.getInt(1);
		}
		
		return id+1 ;
		
	}
	
	public Taskdto findIdTask(int n) throws Exception {
		Connection con=getConnection();
		
		PreparedStatement pst=con.prepareStatement("select * from tasktable where Taskid=?");
		pst.setInt(1, n);
		
		ResultSet rs=pst.executeQuery();
		
		Taskdto t=new Taskdto();
	
		if(rs.next()) {
			
			t.setTaskid(rs.getInt(1));
			t.setTaskTitle(rs.getString(2));
			t.setTaskDescription(rs.getString(3));
			t.setTaskPriority(rs.getString(4));
			t.setTaskDueDate(rs.getString(5));
			t.setUserid(rs.getInt(6));
		}
		
		return t;
		
	}


}
