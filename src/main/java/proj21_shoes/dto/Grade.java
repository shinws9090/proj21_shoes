package proj21_shoes.dto;

public class Grade {			//	등급
	
	private int gradeCode; 		// 	등급코드
	private String grade; 		// 	등급

	public int getGradeCode() {
		return gradeCode;
	}

	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return String.format("Grade [gradeCode=%s, grade=%s]", gradeCode, grade);
	}

}
