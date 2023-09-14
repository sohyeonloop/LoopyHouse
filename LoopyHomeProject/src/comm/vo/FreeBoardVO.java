package comm.vo;

public class FreeBoardVO {
	
	private String freeNo;
	private String freeTitle;
	private String freeContent;
	private String freeDate;
	private int freeViews;
	private String bdCode;
	private String custId;
	private String freeImage;
	
	public FreeBoardVO() {
		
	}

	public FreeBoardVO(String custId, String freeTitle, String freeContent, String imgName) {
		this.custId = custId;
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeImage = imgName;
	}

	public String getFreeImage() {
		return freeImage;
	}

	public void setFreeImage(String freeImage) {
		this.freeImage = freeImage;
	}

	public String getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(String freeNo) {
		this.freeNo = freeNo;
	}

	public String getFreeTitle() {
		return freeTitle;
	}

	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}

	public String getFreeContent() {
		return freeContent;
	}

	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

	public String getFreeDate() {
		return freeDate;
	}

	public void setFreeDate(String freeDate) {
		this.freeDate = freeDate;
	}

	public int getFreeViews() {
		return freeViews;
	}

	public void setFreeViews(int freeViews) {
		this.freeViews = freeViews;
	}

	public String getBdCode() {
		return bdCode;
	}

	public void setBdCode(String bdCode) {
		this.bdCode = bdCode;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [freeNo=" + freeNo + ", freeTitle=" + freeTitle + ", freeContent=" + freeContent
				+ ", freeDate=" + freeDate + ", freeViews=" + freeViews + ", bdCode=" + bdCode + ", custId=" + custId
				+ "]";
	}
	
	
	
}
