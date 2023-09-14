package shop.vo;

public class SearchVO {
	private String schCode;
	private String schWord;
	private int schCont;
	
	public SearchVO() {
		// TODO Auto-generated constructor stub
	}
	
	public SearchVO(String schWord) {
		this.schWord = schWord;
	}

	public String getSchCode() {
		return schCode;
	}

	public void setSchCode(String schCode) {
		this.schCode = schCode;
	}

	public String getSchWord() {
		return schWord;
	}

	public void setSchWord(String schWord) {
		this.schWord = schWord;
	}

	public int getSchCont() {
		return schCont;
	}

	public void setSchCont(int schCont) {
		this.schCont = schCont;
	}
	
	
}
