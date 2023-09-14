package comm.vo;

public class BlackListVO {
	private String bListNo;
	private String custId;
	private String mngId;
	private String bListReason;
	private String bListDate;
	
	public BlackListVO() {
		
	}
	
	public BlackListVO(String custId, String mngId) {
		this.custId = custId;
		this.mngId = mngId;
	}

	public String getbListNo() {
		return bListNo;
	}

	public void setbListNo(String bListNo) {
		this.bListNo = bListNo;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getMngId() {
		return mngId;
	}

	public void setMngId(String mngId) {
		this.mngId = mngId;
	}

	public String getbListReason() {
		return bListReason;
	}

	public void setbListReason(String bListReason) {
		this.bListReason = bListReason;
	}

	public String getbListDate() {
		return bListDate;
	}

	public void setbListDate(String bListDate) {
		this.bListDate = bListDate;
	}

	
}
