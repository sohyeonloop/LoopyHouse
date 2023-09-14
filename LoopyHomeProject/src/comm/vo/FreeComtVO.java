package comm.vo;

public class FreeComtVO {
	private String freeCmNo;
	private String freeCmDate;
	private String freeCmContent;
	private String custId;
	private String freeNo;
	
	public FreeComtVO() {
		// TODO Auto-generated constructor stub
	}

	public FreeComtVO(String custId, String boardNo, String comment) {
		this.custId = custId;
		this.freeNo = boardNo;
		this.freeCmContent = comment;
	}

	public FreeComtVO(String comtNo) {
		this.freeCmNo = comtNo;
	}

	public String getFreeCmNo() {
		return freeCmNo;
	}

	public void setFreeCmNo(String freeCmNo) {
		this.freeCmNo = freeCmNo;
	}

	public String getFreeCmDate() {
		return freeCmDate;
	}

	public void setFreeCmDate(String freeCmDate) {
		this.freeCmDate = freeCmDate;
	}

	
	public String getFreeCmContent() {
		return freeCmContent;
	}

	public void setFreeCmContent(String freeCmContent) {
		this.freeCmContent = freeCmContent;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(String freeNo) {
		this.freeNo = freeNo;
	}
	
	
}
