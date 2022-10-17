package org.employee.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class EmployeeVO {
	private String id, pass, name, lev, phone;
	private Date enter;
	private Integer gender;
}
