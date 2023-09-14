package shop.vo;

import java.util.ArrayList;

public class ProductVO {
	private String prodCode;
	private String prodName;
	private int prodPrice;
	private String cateCode;
	private int prodSale;
	private int prodWish;
	private String prodColor;
	private String prodImage;
	private String detailImage;
	
	private ArrayList<String> colorList;
	
	
	
	public ProductVO() {}

	public ProductVO(String prodCode, String prodName, int prodPrice, String cateCode, String prodColor,
			String thumbnailName, String detailName) {
		this.prodCode = prodCode;
		this.prodName = prodName;
		this.prodPrice = prodPrice;
		this.cateCode = cateCode;
		this.prodColor = prodColor;
		this.prodImage = thumbnailName;
		this.detailImage = detailName;
	}

	public String getProdCode() {
		return prodCode;
	}

	public void setProdCode(String prodCode) {
		this.prodCode = prodCode;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdImage() {
		return prodImage;
	}

	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public int getProdSale() {
		return prodSale;
	}

	public void setProdSale(int prodSale) {
		this.prodSale = prodSale;
	}

	public int getProdWish() {
		return prodWish;
	}

	public void setProdWish(int prodWish) {
		this.prodWish = prodWish;
	}

	public String getProdColor() {
		return prodColor;
	}

	public void setProdColor(String prodColor) {
		this.prodColor = prodColor;
	}

	public String getDetailImage() {
		return detailImage;
	}

	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}
	
	
	
	
	
}
