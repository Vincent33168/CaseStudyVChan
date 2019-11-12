package com.footwear.test;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.footwear.model.Customer;

@Repository
public interface CustomerRepositoryTest extends CrudRepository<Customer, Integer> {

	Customer findByCustname(String custname);
	

}
