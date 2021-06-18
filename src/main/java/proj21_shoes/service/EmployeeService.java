package proj21_shoes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_shoes.dto.Employee;

@Service
public interface EmployeeService {
	public List<Employee> employeeList();
}
