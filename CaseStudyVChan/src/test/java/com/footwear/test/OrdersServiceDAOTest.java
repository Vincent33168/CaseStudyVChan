package com.footwear.test;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.footwear.test.CustomerServiceTestI;
import com.footwear.test.OrdersServiceTestI;
import com.footwear.model.OrderDetail;
import com.footwear.model.Orders;


public class OrdersServiceDAOTest {
	//define static DAO and Orders variable
	
	//static OrderDetailService OrderDAO;
	@Autowired
	OrdersServiceTestI OrderDAO;
	
	@Autowired
	CustomerServiceTestI customerDAO;
	
	static Orders expectedOrder;
	static OrderDetail expectedOrderDetail;
	static Set<OrderDetail> odlist;
	
	//@BeforeAll - setup connection
	@BeforeAll
	static void setup() {
		expectedOrder = new Orders();
		expectedOrderDetail = new OrderDetail();
		odlist = new HashSet<OrderDetail>();
		
	}
	
	@BeforeEach
	void init() {
		double oAmount=0.0, oTax=0.0;
		
		//order header
		expectedOrder.setDeliverydate(null);
		expectedOrder.setOdate(new Date());
		expectedOrder.setPaidamount(0.0);
		expectedOrder.setPaycardtype("VISA");
		expectedOrder.setPaydate(new Date());
		expectedOrder.setShippingcost(0.0);
		expectedOrder.setShipToaddressid(1);
		expectedOrder.setCurrency("USD");
		expectedOrder.setStatus("Cart");
		
		//order detail
		expectedOrderDetail.setColor("Black");
		expectedOrderDetail.setSize("A");
		expectedOrderDetail.setDesc("MEN CASUAL");
		expectedOrderDetail.setName("BYNUM_01");
		expectedOrderDetail.setQuantity(10); 
		expectedOrderDetail.setPhoto("photo/BYNUM01.jpg");
		expectedOrderDetail.setSku("4001");
		expectedOrderDetail.setUnitprice(15.0); 
		odlist.add(expectedOrderDetail);
		
		//tax and order total calculation from order details
		oTax += expectedOrderDetail.getUnitprice() * expectedOrderDetail.getQuantity() *12 * 8.875/100;
		oAmount += expectedOrderDetail.getUnitprice()  * expectedOrderDetail.getQuantity() * 12 ;
		
		expectedOrder.setAmount(oAmount);
		expectedOrder.setTax(oTax);
		expectedOrder.setOrderTotal(oTax + oAmount);
		
		expectedOrder.setOdetail(odlist);
		expectedOrderDetail.setOrders(expectedOrder);
		//expectedOrder.addOrderDetail(expectedOrderDetail);
		
		System.out.println("***ExpectedOrder***" + expectedOrder);
		System.out.println("***ExpectedOrder Detail***" + expectedOrderDetail);
		
		OrderDAO.addOrders(expectedOrder);
		
		Orders order = OrderDAO.getOrder(expectedOrder.getId());
		order.setCustomer(customerDAO.getCustomer(9));
		//expectedOrder.setCustomer(customerDAO.getCustomer(9));
		
		System.out.println("***ExpectedOrder***" + expectedOrder);
		System.out.println("***ExpectedOrder Detail***" + expectedOrderDetail);
		System.out.println("***customer code***" + expectedOrder.getCustomer().getCustcode());
		
		OrderDAO.addOrders(expectedOrder);
	
		
	}
	
	@Test
	void testFindOrderById() {
		Assertions.assertEquals(expectedOrder.getId(), 
				OrderDAO.getOrder(expectedOrder.getId()).getId());
		
	}
	
	@Test
	@Disabled
	void testRemoveOrderById() {
		int tempId = expectedOrder.getId();
		OrderDAO.deleteOrders(expectedOrder);
		Assertions.assertEquals(false, OrderDAO.getOrder(tempId)); 
	}
	
	
}
