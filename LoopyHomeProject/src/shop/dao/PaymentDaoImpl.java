package shop.dao;

import shop.vo.PaymentVO;
import user.dao.MyBatisDao;

public class PaymentDaoImpl extends MyBatisDao implements IPaymentDao {

	private static IPaymentDao payDao;
	
	private PaymentDaoImpl() {}
	
	public static IPaymentDao getInstance() {
		if(payDao == null) {
			payDao = new PaymentDaoImpl();
		}
		return payDao;
	}
	
	@Override
	public int insertPayment(PaymentVO pv) {
		return insert("insertPayment",pv);
	}

}
