package chap07.dto;

import java.sql.Date;

public class EmployeeDTO {
	// DB의 컬럼명과 동일한 이름을 쓰는것이 좋다
	private Integer employee_id;
	private String first_name;
	private String last_name;
	private String email;
	private String phone_number;
	private Double salary;
	private Double commission_pct;
	private Date hire_date;
	private String job_id;
	private Integer manager_id;
	private Integer department_id;
	
	
	public EmployeeDTO(Integer employee_id, String first_name, String last_name, String email, String phone_number,
			Double salary, Double commission_pct, Date hire_date, String job_id, Integer manager_id,
			Integer department_id) {
		super();
		this.employee_id = employee_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.phone_number = phone_number;
		this.salary = salary;
		this.commission_pct = commission_pct;
		this.hire_date = hire_date;
		this.job_id = job_id;
		this.manager_id = manager_id;
		this.department_id = department_id;
	}

	public String getDivRow() {
		return String.format(
				"<div>%d</div>"
				+ "<div>%s</div>"
				+ "<div>%s</div>"
				+ "<div>%s</div>"
				+ "<div>%s</div>"
				+ "<div>%.2f</div>"
				+ "<div>%.2f</div>"
				+ "<div>%s</div>"
				+ "<div>%s</div>"
				+ "<div>%d</div>"
				+ "<div>%d</div>", 
				employee_id,
				first_name,
				last_name,
				email,
				phone_number,
				salary,
				commission_pct,
				hire_date,
				job_id,
				manager_id,
				department_id);
	}
	
	public String getName() {
		return 
				"<div class=\"name\">employee_id</div>"
				+ "<div class=\"name\">first_name</div>"
				+ "<div class=\"name\">last_name</div>"
				+ "<div class=\"name\">email</div>"
				+ "<div class=\"name\">phone_number</div>"
				+ "<div class=\"name\">salary</div>"
				+ "<div class=\"name\">commission_pct</div>"
				+ "<div class=\"name\">hire_date</div>"
				+ "<div class=\"name\">job_id</div>"
				+ "<div class=\"name\">manager_id/div>"
				+ "<div class=\"name\">department_id</div>";
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Double getCommission_pct() {
		return commission_pct;
	}
	public void setCommission_pct(Double commission_pct) {
		this.commission_pct = commission_pct;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public Integer getManager_id() {
		return manager_id;
	}
	public void setManager_id(Integer manager_id) {
		this.manager_id = manager_id;
	}
	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}

	@Override
	public String toString() {
		return String.format("<pre>[%d]\t[%s]  [%s]  [%s]  [%s]  [%s]  [%s]  [%.2f]  [%.2f]  [%d]  [%d]</pre>",
		employee_id,
		first_name,
		last_name,
		email, 
		phone_number,
		hire_date,
		job_id,
		salary,
		commission_pct,
		manager_id,
		department_id);
	}
}
