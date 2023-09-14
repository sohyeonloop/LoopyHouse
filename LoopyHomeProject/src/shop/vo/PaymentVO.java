package shop.vo;

public class PaymentVO {
	private String payNb;
	private String payDate;
	private int payPrice;
	private String ordNo;
	
	public PaymentVO() {
		// TODO Auto-generated constructor stub
	}

	public String getPayNb() {
		return payNb;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public void setPayNb(String payNb) {
		this.payNb = payNb;
	}

	
	
	
	
}
