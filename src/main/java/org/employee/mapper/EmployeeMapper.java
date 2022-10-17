package org.employee.mapper;

import java.util.List;

import org.employee.domain.EmployeeVO;

public interface EmployeeMapper {
	public List<EmployeeVO> selectAllEmployees();
	
	public void insertEmployee(EmployeeVO employee);
	
	public int getId(String id);
	
	public EmployeeVO getMember(String id);
	
	public int updateEmployee(EmployeeVO employee);
	
	public int deleteEmployee(String id);
}
