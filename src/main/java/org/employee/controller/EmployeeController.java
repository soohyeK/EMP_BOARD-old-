package org.employee.controller;

import org.employee.domain.EmployeeVO;
import org.employee.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/employee")
@Log4j
@AllArgsConstructor
public class EmployeeController {
	private EmployeeService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("employee list");
		
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String regisert(EmployeeVO employee, RedirectAttributes rttr) {
		log.info("insert..."+employee);
		
		int checkid = service.getId(employee.getId());
		
		if(checkid>0) {
			rttr.addFlashAttribute("result", "exit");
		}else {
			service.register(employee);
			rttr.addFlashAttribute("result", "insert");
		}
		
		return "redirect:/employee/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") String id, @ModelAttribute("employee") EmployeeVO employee, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("employee", service.getEmployee(id));
	}
	
	@PostMapping("/modify")
	public String modify(EmployeeVO employee, RedirectAttributes rttr) {
		log.info("modify:"+employee);
		
		int result = service.modify(employee);
		
		if(result>0) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/employee/list";
	}
	
	@PostMapping("/delete")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		log.info("delete");
		
		int result = service.remove(id);
		
		if(result>0) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/employee/list";
	}

}
