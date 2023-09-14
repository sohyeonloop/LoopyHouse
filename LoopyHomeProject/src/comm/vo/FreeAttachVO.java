package comm.vo;

public class FreeAttachVO {
	private String freeAtchCode;
	private String freeNo;
	private String custId;
	private String freeAtchFile;
	
	public FreeAttachVO() {
		
	}

	public FreeAttachVO(String custId, String image) {
		this.custId = custId;
		this.freeAtchFile = image;
	}

	public String getFreeAtchCode() {
		return freeAtchCode;
	}

	public void setFreeAtchCode(String freeAtchCode) {
		this.freeAtchCode = freeAtchCode;
	}

	public String getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(String freeNo) {
		this.freeNo = freeNo;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getFreeAtchFile() {
		return freeAtchFile;
	}

	public void setFreeAtchFile(String freeAtchFile) {
		this.freeAtchFile = freeAtchFile;
	}
	
	
}
