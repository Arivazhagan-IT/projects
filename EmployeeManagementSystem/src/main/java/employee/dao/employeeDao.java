package employee.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import employee.dto.employeeDto;

@Component
public class employeeDao {
	
	@Autowired
	EntityManager em;

	
	public employeeDto saveEmployee(employeeDto emp) {
		em.getTransaction().begin();
		em.persist(emp);
		em.getTransaction().commit();
		return emp;
	}

	public employeeDto findEmployee( int eid) {
		employeeDto emp=em.find(employeeDto.class, eid);
		if(emp!=null) {
			return emp;
		}
		return null;	
	}


	public employeeDto deleteEmployee(int eid) {
		employeeDto emp=findEmployee(eid);

		if(emp!=null) {
			em.getTransaction().begin();
			em.remove(emp);
			em.getTransaction().commit();
			return emp;
		}
		return null;
	}


	public employeeDto updateEmployee(employeeDto employee ,int eid) {
		employeeDto emp=findEmployee(eid);
		if(emp!=null) {
			employee.setEmpId(eid);
			em.getTransaction().begin();
			em.merge(employee);
			em.getTransaction().commit();
			return employee;
		}
		return null;
	}

	public List<employeeDto> getAllEmployee(){
		Query query=em.createQuery("select e from employeeDto e");
		List<employeeDto> emps = query.getResultList();
		return emps;

	}

	public employeeDto findbyEmail(String email) {
		Query query=em.createQuery("select e from employeeDto e where Empemail=?1");
		query.setParameter(1, email);
		employeeDto emp=(employeeDto) query.getSingleResult();
		if(emp!=null) {
			return emp;
		}
		return null;

	}

}
