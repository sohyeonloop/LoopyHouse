package user.service;

import java.util.HashMap;
import java.util.List;

import shop.vo.ReviewVO;
import user.dao.IReviewDao;
import user.dao.ReviewDaoImpl;

public class ReviewServiceImpl implements IReviewService{
	private IReviewDao revDao;
	private static IReviewService revSerivce;
	
	private ReviewServiceImpl() {
		revDao = ReviewDaoImpl.getInstance();
	}
	
	public static IReviewService getInstance() {
		if(revSerivce == null) {
			revSerivce = new ReviewServiceImpl();
		}
		return revSerivce;
	}

	@Override
	public int insertReview(ReviewVO rv) {
		return revDao.insertReview(rv);
	}

	@Override
	public List<ReviewVO> getReview(String prodCode) {
		return revDao.getReview(prodCode);
	}

	
}
