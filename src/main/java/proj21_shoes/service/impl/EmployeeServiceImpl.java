package proj21_shoes.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_shoes.dto.Employee;
import proj21_shoes.mapper.EmployeeMapper;
import proj21_shoes.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper mapper;
	
	@Override
	public List<Employee> employeeList() {
		return mapper.employeeList();
	}

}
