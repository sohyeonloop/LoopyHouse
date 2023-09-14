package shop.service;

import shop.dao.IOrderDao;
import shop.dao.IPaymentDao;
import shop.dao.OrderDaoImpl;
import shop.dao.PaymentDaoImpl;
import shop.vo.PaymentVO;

public class PaymentServiceImpl implements IPaymentService {
	
	private IPaymentDao payDao;
	private static IPaymentService payService;
	
	private  PaymentServiceImpl() {
		payDao = PaymentDaoImpl.getInstance();
	}
	
	public static IPaymentService getinstance() {
		if(payService == null) {
			payService = new PaymentServiceImpl();
		}
		return payService;
	}
	

	@Override
	public int insertPayment(PaymentVO pv) {
		return payDao.insertPayment(pv);
	}

}
