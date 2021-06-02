package proj21_shoes.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.sun.javafx.beans.IDProperty;

public class RegisterRequest {
	@NotBlank
	private String id;
	@NotBlank
	@Email
	private String email;
	@Size(min=6)
	private String password;
	@NotEmpty
	private String confirmPassword;
	@NotEmpty
	private String name;
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email=email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password =password;
	}
	
	
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String conformPassword) {
		this.confirmPassword = conformPassword;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public boolean isPasswordEqualToConfirmPassword() {
		return password.contentEquals(confirmPassword);
	}



	public RegisterRequest(@NotBlank String id, @NotBlank @Email String email, @Size(min = 6) String password,
			@NotEmpty String confirmPassword, @NotEmpty String name) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.name = name;
	}

	@Override
	public String toString() {
		return String.format("RegisterRequest [email=%s, password=%s, confirmPassword=%s, name=%s]", email, password,
				confirmPassword, name);
	}
	
	

}
