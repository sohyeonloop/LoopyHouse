package shop.dao;

import shop.vo.PaymentVO;

public interface IPaymentDao {
	
	//결제 테이블 추가
	public int insertPayment(PaymentVO pv);
	
	
}
