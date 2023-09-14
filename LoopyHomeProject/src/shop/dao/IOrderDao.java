package shop.dao;

import shop.vo.ItemVO;
import shop.vo.OrderVO;

public interface IOrderDao {
	
	public int addOrder(OrderVO ov);
	
	//주문번호 상품확인
	public int ordNoProdCheck(ItemVO item);
	
	// 고객의 주문번호 가격 조회
	public OrderVO orderPriceCheck(String ordNo);
	
	//고객 주문번호 확인
	public OrderVO orderNoCheck(OrderVO ordNo);
	
	//주문테이블 상태 변경
	public int updateOrdStatus(OrderVO ov);
	
	//반품내역 추가
	public int insertReturn(String ordNo);
	
	public int deleteOrder(OrderVO ov);
	
}
