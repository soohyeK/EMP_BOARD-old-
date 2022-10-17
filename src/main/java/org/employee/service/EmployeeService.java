package org.employee.service;

import java.util.List;

import org.employee.domain.EmployeeVO;

public interface EmployeeService {
	public List<EmployeeVO> getList();
	
	public void register(EmployeeVO employee);
	
	public int getId(String id);
	
	public EmployeeVO getEmployee(String id);
	
	public int modify(EmployeeVO employee);
	
	public int remove(String id);
}
