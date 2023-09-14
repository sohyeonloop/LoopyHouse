package shop.service;

import java.util.List;

import shop.vo.ProductVO;
import shop.vo.WishListVO;

public interface IWishlistService {

	// 카테고리별 위시리스트 메서드
	public List<WishListVO> selectCateProd(String wishCode);

	// 상품 상세
	public ProductVO getDetail(String prodCode);

	// 위시리스트 삭제
	public int deleteWish(WishListVO wv);

	public int insertWish(WishListVO wv);

	public int deleteWish(String prodCode);

	public boolean wishChk(WishListVO wv);
	
	//회원 위시리스트 조회
	public List<WishListVO> selectCustWish(WishListVO wv);
}
