package com.footwear.test;

import java.util.Set;

import com.footwear.model.Customer;
import com.footwear.model.Orders;

public interface OrdersServiceTestI {

	boolean addOrders(Orders order);
	void deleteOrders(Orders order);
	Set<Orders> findByStatusAndCustomer(String status, Customer customer);
	Orders getOrder(Integer id);
}
