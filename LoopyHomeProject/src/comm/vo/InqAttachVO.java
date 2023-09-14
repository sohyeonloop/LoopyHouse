package comm.vo;

public class InqAttachVO {
	private String inqAtchCode;
	private String inqAtchFile;
	private String inqNo;
	private String custId;
	
	public InqAttachVO() {
		// TODO Auto-generated constructor stub
	}

	public InqAttachVO(String custId, String image) {
		this.custId = custId;
		this.inqAtchFile = image;
	}

	public String getInqAtchCode() {
		return inqAtchCode;
	}

	public void setInqAtchCode(String inqAtchCode) {
		this.inqAtchCode = inqAtchCode;
	}

	public String getInqAtchFile() {
		return inqAtchFile;
	}

	public void setInqAtchFile(String inqAtchFile) {
		this.inqAtchFile = inqAtchFile;
	}

	public String getInqNo() {
		return inqNo;
	}

	public void setInqNo(String inqNo) {
		this.inqNo = inqNo;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	
}
