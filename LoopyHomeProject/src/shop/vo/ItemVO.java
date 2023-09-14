package shop.vo;

public class ItemVO {
	private String ordNo;
	private String prodCode;
	private int itemQua;
	private String itemColor;
	private String itemStatus;
	
	public ItemVO() {
		// TODO Auto-generated constructor stub
	}
	

	public ItemVO(String ordNo, String prodCode, int itemQua) {
		super();
		this.ordNo = ordNo;
		this.prodCode = prodCode;
		this.itemQua = itemQua;
	}
	
	


	public ItemVO(String ordNo, String prodCode) {
		super();
		this.ordNo = ordNo;
		this.prodCode = prodCode;
	}


	public String getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public int getItemQua() {
		return itemQua;
	}

	public void setItemQua(int itemQua) {
		this.itemQua = itemQua;
	}


	public String getItemColor() {
		return itemColor;
	}


	public void setItemColor(String itemColor) {
		this.itemColor = itemColor;
	}


	public String getItemStatus() {
		return itemStatus;
	}


	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}
	
	
	
}
