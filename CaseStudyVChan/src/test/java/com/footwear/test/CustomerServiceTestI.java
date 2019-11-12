package com.footwear.test;

import java.util.List;

import com.footwear.model.Customer;

public interface CustomerServiceTestI {
	
	List<Customer> getAllCustomer();
	boolean addCustomer(Customer customer);
	Customer getCustomer(Integer custcode);
	void deleteCustomer(Customer customer);
	Customer getCustomerByName(String custname);
	
}
