package shop.vo;

public class WishListVO {
	private String custId;
	private String prodCode;
	
	public WishListVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public WishListVO(String custId, String prodCode) {
		super();
		this.custId = custId;
		this.prodCode = prodCode;
	}



	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}
	
	
}
