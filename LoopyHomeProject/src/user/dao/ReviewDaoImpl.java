package user.dao;

import java.util.HashMap;
import java.util.List;

import shop.vo.ReviewVO;

public class ReviewDaoImpl extends MyBatisDao implements IReviewDao{
	
	private static IReviewDao revDao;
	private ReviewDaoImpl() {}
	
	public static IReviewDao getInstance() {
		if(revDao == null) {
			revDao = new ReviewDaoImpl();
		}
		return revDao;
	}

	@Override
	public int insertReview(ReviewVO rv) {
		return insert("user.insertReview", rv);
	}

	@Override
	public List<ReviewVO> getReview(String prodCode) {
		List<ReviewVO> revList = selectList("user.getReview", prodCode);
		return revList;
	}

	
	
	
}
