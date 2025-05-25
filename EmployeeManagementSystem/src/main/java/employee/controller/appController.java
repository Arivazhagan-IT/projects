package employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import employee.dao.employeeDao;
import employee.dto.employeeDto;

@Controller
public class appController {
	
	@Autowired
	employeeDao dao;
	
	
	@RequestMapping("/signup")
	public ModelAndView signup() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("signup.jsp");
		mv.addObject("emp", new employeeDto());
		
		return mv;
	}
	
	
	@RequestMapping("/savemployee")
	public ModelAndView saveEmployee( @ModelAttribute employeeDto emp) {
		ModelAndView mv=new ModelAndView();
		dao.saveEmployee(emp);
		mv.setViewName("login.jsp");
		return mv;
		
		}
	
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam String email,@RequestParam String pass) {
		employeeDto e=dao.findbyEmail(email);
		if(e!=null) {
			if(e.getEmpPassword().equals(pass)) {
				return new ModelAndView("redirect:/home");
			}
			else {
				return new ModelAndView("login.jsp");
			}
		}else
		{
		return new ModelAndView("login.jsp");
		}
	}
	
	
	@RequestMapping("/home")
	public ModelAndView showhome() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home.jsp");
		mv.addObject("emps",dao.getAllEmployee());
		return mv;
	}
	
	
	@RequestMapping("/deleteEmployee")
	public  ModelAndView deleteEmp(@RequestParam int id) {
		dao.deleteEmployee(id);
		return new ModelAndView("redirect:/home");
		
	}
	
	
	@RequestMapping("/addEmployee")
	public ModelAndView addEmp() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addemployee.jsp");
		mv.addObject("emp", new employeeDto());
		
		return mv;
		
	}
	
	@RequestMapping("/addemp")
	public ModelAndView addEmployee( @ModelAttribute employeeDto emp) {
		
		dao.saveEmployee(emp);
	
		return new ModelAndView("redirect:/home");
		
		}
	
	@RequestMapping("/editEmployee")
	public ModelAndView editEmp(@RequestParam int id) {
		employeeDto employee=dao.findEmployee(id);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("editemp.jsp");
		mv.addObject("emp", employee);
		return mv;	
	}
	
	@RequestMapping("/editemp")
	public ModelAndView editEmployee(@ModelAttribute employeeDto emp,@RequestParam int id) {
	
		dao.updateEmployee(emp, id);
		return new ModelAndView("redirect:/home");
		
	}

}
