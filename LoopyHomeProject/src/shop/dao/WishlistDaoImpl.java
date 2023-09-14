package shop.dao;

import java.util.List;

import shop.vo.ProductVO;
import shop.vo.WishListVO;
import user.dao.MyBatisDao;

public class WishlistDaoImpl extends MyBatisDao implements IWishlistDao{

	private static WishlistDaoImpl wishDao;
	private WishlistDaoImpl() {}
	
	public static WishlistDaoImpl getInstance() {
		if(wishDao == null) {
			wishDao = new WishlistDaoImpl();
		}
		return wishDao;
	}

	//카테고리별 상품페이지 리스트 메서드
	@Override
	public List<WishListVO> selectWishProd(String prodCode) {
		
		List<WishListVO> wvList = selectList("shop.wishlistList", prodCode);
		
		return wvList;
	}
	
		//위시리스트 추가
	@Override	
	public int insertWish(WishListVO wv) {
		int cnt = insert("shop.wishInsert", wv);
		return cnt;
	}
	//위시리스트 삭제
	@Override
	public int deleteWish(String prodCode) {
		int cnt = delete("shop.wishDelete", prodCode);
		return cnt;
	}
	
	
		//위시리스트 여부
	@Override
	public boolean wishChk(WishListVO wv) {
		
		int cnt = selectOne("shop.wishChk", wv);
		
		boolean isExist = false;
		
		if(cnt > 0) {
			isExist = true;
		}
		return isExist;
		
	}

	@Override
	public int deleteWish(WishListVO wv) {
		int cnt = delete("shop.deleteWish",wv);
		return cnt;
	}

	@Override
	public List<WishListVO> selectCustWish(WishListVO wv) {
		return selectList("shop.selectWish",wv);
	}

//	@Override
//	public WishListVO getDetail(String prodCode) {
//		
//		return null;
//	}

	

}
