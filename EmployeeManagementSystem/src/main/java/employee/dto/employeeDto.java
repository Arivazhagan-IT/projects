package employee.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class employeeDto {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int empId;
	private String empName;
	private String empCity;
	private String empEmail;
	private String empContact;
	private String empPassword;
	
	@Override
	public String toString() {
		return "employeeDto [empId=" + empId + ", empName=" + empName + ", empCity=" + empCity + ", empEmail="
				+ empEmail + ", empContact=" + empContact + ", empPassword=" + empPassword + "]";
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpCity() {
		return empCity;
	}
	public void setEmpCity(String empCity) {
		this.empCity = empCity;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpContact() {
		return empContact;
	}
	public void setEmpContact(String empContact) {
		this.empContact = empContact;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

}
