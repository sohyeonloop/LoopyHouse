package shop.vo;

public class OrderVO {
	private String ordNo;
	private String ordDate;
	private int ordPrice;
	private int ordQua;
	private String custId;
	private char ordStatus;
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public OrderVO(String ordNo, String ordDate, int ordPrice, int ordQua, String custId, char ordStatus) {
		super();
		this.ordNo = ordNo;
		this.ordDate = ordDate;
		this.ordPrice = ordPrice;
		this.ordQua = ordQua;
		this.custId = custId;
		this.ordStatus = ordStatus;
	}


	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public int getOrdPrice() {
		return ordPrice;
	}

	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}

	public int getOrdQua() {
		return ordQua;
	}

	public char getOrdStatus() {
		return ordStatus;
	}


	public void setOrdStatus(char ordStatus) {
		this.ordStatus = ordStatus;
	}


	public void setOrdQua(int ordQua) {
		this.ordQua = ordQua;
	}

	public String getCustId() {
		return custId;
	}
	
	public void setCustId(String custId) {
		this.custId = custId;
	}
	@Override
	public String toString() {
		return "OrderVO [ordNo=" + ordNo + ", ordDate=" + ordDate + ", ordPrice=" + ordPrice + ", ordQua=" + ordQua
				+ ", custId=" + custId + ", ordStatus=" + ordStatus + "]";
	}


	
}
