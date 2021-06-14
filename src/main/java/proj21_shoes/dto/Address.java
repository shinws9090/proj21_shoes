package proj21_shoes.dto;

public class Address { // 배송지정보

	private int orderCode; // 주문정보
	private String recipient; // 받는사람
	private String zipCode; // 우편번호
	private String address; // 주소
	private String detailAddress; // 상세주소
	private String tel; // 연락처


	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	@Override
	public String toString() {
		return String.format("Address [orderCode=%s, recipient=%s, zipCode=%s, address=%s, detailAddress=%s, tel=%s]",
				orderCode, recipient, zipCode, address, detailAddress, tel);
	}

}
