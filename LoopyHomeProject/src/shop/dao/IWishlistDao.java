
package shop.dao;

import java.util.List;

import shop.vo.WishListVO;

public interface IWishlistDao {
	
	//위시리스트 추가
	public int insertWish(WishListVO wv);
	
	//위시리스트 삭제
	public int deleteWish(String prodCode);
	
	//위시리스트 여부
	public boolean wishChk(WishListVO wv);
	
	//위시리스트 삭제
	public int deleteWish(WishListVO wv);
	
	public List<WishListVO> selectWishProd(String prodCode);
	
	// 회원 위시리스트 조회
	public List<WishListVO> selectCustWish(WishListVO wv);
	
}
