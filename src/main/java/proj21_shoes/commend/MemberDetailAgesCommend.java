package proj21_shoes.commend;

public class MemberDetailAgesCommend {
	private String gender;
	private int birthday;
	private int ages;
	private int total;

	public MemberDetailAgesCommend() {
		// TODO Auto-generated constructor stub
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getBirthday() {
		return birthday;
	}

	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}

	public int getAges() {
		return ages;
	}

	public void setAges(int ages) {
		this.ages = ages;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return String.format("MemberDetailAgesCommend [gender=%s, birthday=%s, ages=%s, total=%s]", gender, birthday,
				ages, total);
	}

}
