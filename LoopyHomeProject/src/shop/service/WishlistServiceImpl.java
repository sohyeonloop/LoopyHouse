package shop.service;

import java.util.List;

import shop.dao.IWishlistDao;
import shop.dao.WishlistDaoImpl;
import shop.vo.ProductVO;
import shop.vo.WishListVO;

public class WishlistServiceImpl implements IWishlistService{

	private IWishlistDao wishDao;
	private static IWishlistService wishService;
	
	private WishlistServiceImpl() {
		wishDao = WishlistDaoImpl.getInstance();
	}
	
	public static IWishlistService getInstance() {
		if(wishService == null) {
			wishService = new WishlistServiceImpl();
		}
		return wishService;
	}
	
	//카테고리별 위시리스트 메서드
	@Override
	public List<WishListVO> selectCateProd(String prodCode) {
		return wishDao.selectWishProd(prodCode);
	}

	@Override
	public ProductVO getDetail(String prodCode) {
		return null;
	}

	@Override
	public int deleteWish(WishListVO wv) {
		return wishDao.deleteWish(wv);
	}
	
		@Override
	public int insertWish(WishListVO wv) {
		int cnt = wishDao.insertWish(wv);
		return cnt;
	}
	
		@Override
	public int deleteWish(String prodCode) {
		int cnt = wishDao.deleteWish(prodCode);
		return cnt;
	}

	@Override
	public boolean wishChk(WishListVO wv) {
		
		return wishDao.wishChk(wv);
	}

	@Override
	public List<WishListVO> selectCustWish(WishListVO wv) {
		return wishDao.selectCustWish(wv);
	}
	
	
	
	//상품 상세 리스트
//	@Override
//	public WishListVO getDetail(String prodCode) {
//		return wishDao.getDetail(wishCode);
//	}

}
