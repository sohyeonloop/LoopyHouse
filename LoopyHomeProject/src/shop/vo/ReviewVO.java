package shop.vo;

public class ReviewVO {
	private String revNo;
	private String revContent;
	private String ordNo;
	private String prodCode;
	private String custId;
	private String revImage;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public ReviewVO(String revContent, String ordNo, String prodCode, String custId, String revImage) {
		super();
		this.revContent = revContent;
		this.ordNo = ordNo;
		this.prodCode = prodCode;
		this.custId = custId;
		this.revImage = revImage;
	}


	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	public String getRevcontent() {
		return revContent;
	}

	public void setRevcontent(String revContent) {
		this.revContent = revContent;
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

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getRevImage() {
		return revImage;
	}

	public void setRevImage(String revImage) {
		this.revImage = revImage;
	}
	
	
}
