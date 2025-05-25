package dtoclass;

import java.sql.Date;

public class Taskdto {
	
	private int taskid;
	private String taskTitle;
	private String taskDescription;
	private String taskPriority;
	private String taskDueDate;
	private int userid;
	
	
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	public String getTaskTitle() {
		return taskTitle;
	}
	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	public String getTaskPriority() {
		return taskPriority;
	}
	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}
	public String getTaskDueDate() {
		return taskDueDate;
	}
	public void setTaskDueDate(String date) {
		this.taskDueDate = date;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	

}
