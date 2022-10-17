package org.employee.service;

import java.util.List;

import org.employee.domain.EmployeeVO;
import org.employee.mapper.EmployeeMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
	private EmployeeMapper mapper;
	
	@Override
	public List<EmployeeVO> getList() {
		// TODO Auto-generated method stub
		log.info("get employee list");
		
		return mapper.selectAllEmployees();
	}
	
	@Override
	public void register(EmployeeVO employee) {
		log.info("register...."+employee);
		
		mapper.insertEmployee(employee);
	}
	
	@Override
	public int getId(String id) {
		log.info("chedk id");
		
		return mapper.getId(id);
	}
	
	@Override
	public EmployeeVO getEmployee(String id) {
		log.info("employee info..."+id);
		
		return mapper.getMember(id);
	}
	
	@Override
	public int modify(EmployeeVO employee) {
		log.info("modify..."+employee);
		
		return mapper.updateEmployee(employee);
	}
	
	@Override
	public int remove(String id) {
		log.info("delete employee..."+id);
		
		return mapper.deleteEmployee(id);
	}

}
