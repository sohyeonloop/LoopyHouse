package shop.service;

import java.util.List;

import shop.vo.ProductVO;

public interface IProductService {

	//상품전체조회
	public List<ProductVO> selectCateProd(String cateCode);
	
	//상품판매순
	public List<ProductVO> selectSaleProd(String cateCode);
	
	//상품위시리스트순
	public List<ProductVO> selectWishProd(String cateCode);
	
	//�긽�뭹 �긽�꽭 
	public ProductVO getDetail(String prodCode);
	
	//상품 위시리스트 +1
	public int prodWishUp(String prodCode);
		
	//상품 위시리스트 -1
	public int prodWishDown(String prodCode);
	
	//장바구니 상품 가격 조회
	public ProductVO getProdPrice(ProductVO pv);
	
	//모든 상품 조회
	public List<ProductVO> CateProd();
	
	//상품 검색
	public List<ProductVO> searchProd(String searchText);
	
	//상품번호 get
	public List<ProductVO> getAllProdCode();
		
	//카테고리별 상품조회
	public List<ProductVO> getAllCateProd(ProductVO pv);
	//카테고리 상품추가
	public int registProd(ProductVO pv);
	//카테고리 상품 삭제
	public int removeProd(ProductVO pv);
	//상품 판매수 증가
	public int prodSaleUp(ProductVO pv);
}
