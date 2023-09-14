package user.dao;

import java.util.HashMap;
import java.util.List;

import shop.vo.ReviewVO;

public interface IReviewDao {
	
	//리뷰 작성 메서드
	public int insertReview(ReviewVO rv);
	
	//리뷰 보기 메서드
	public List<ReviewVO> getReview(String prodCode);
}
