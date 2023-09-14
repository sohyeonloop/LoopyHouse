package shop.service;

import shop.vo.PaymentVO;

public interface IPaymentService {
	
	//결제 테이블 추가
	public int insertPayment(PaymentVO pv);
	
	
}
