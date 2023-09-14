package shop.service;

import shop.vo.ItemVO;
import shop.vo.OrderVO;

public interface IOrderService {
	
	public int addOrder(OrderVO ov);
	
	public int ordNoProdCheck(ItemVO item);
	
	//주문번호 가격 조회
	
	public OrderVO orderPriceCheck(String ordNo);
	
	//고객 주문번호 체크
	public OrderVO orderNoCheck(OrderVO ordNo);
	
	//오더 테이블 상태 변경
	public int changeOrdStatus(OrderVO ov);
	
	//주문 반품
	public int deleteOrder(OrderVO ov);
	
	
	//반품내역 추가
	public int insertReturn(String ordNo);
	
}
