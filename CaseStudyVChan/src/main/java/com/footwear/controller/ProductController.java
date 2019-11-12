package com.footwear.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.footwear.model.Item;
import com.footwear.model.ItemDetail;
import com.footwear.service.ItemService;
import com.footwear.service.OrdersService;


@Controller
public class ProductController {
	public static List<Item>itemList;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	OrdersService orderService;
	
	@RequestMapping(value = "/product",params = {"cat","subcat"}, method = RequestMethod.GET)
	public ModelAndView getProductList(
			@RequestParam(value = "cat") String category,
			@RequestParam(value = "subcat") String subcategory) {

		//for test
		//addTestData();
		
		System.out.println(category + "|"+ subcategory+"|");
		if (category!=null && subcategory!=null) {
			itemList = itemService.findByCategoryAndSubcategory(category, subcategory);
		}
		ModelAndView mav = new ModelAndView("product_list");
		mav.addObject("ITEMLIST",itemList);
		return mav;
	}
	
	@RequestMapping(value = "/productlist",method = RequestMethod.GET)
	public ModelAndView getProductList2() {
		ModelAndView mav = new ModelAndView("product_list");
		mav.addObject("ITEMLIST",itemList);
		return mav;
	}
	
	@RequestMapping(value="/buyitem/{selectedItem}")
	public ModelAndView buyItem(HttpSession session, @PathVariable int selectedItem,
			@CookieValue(value = "myCart", required = false) Item item) {
        ModelAndView mav = new ModelAndView("buyItemForm");
		mav.addObject("SELECTEDITEM", itemService.getItem(selectedItem));
		return mav;
        
	}
	
	@RequestMapping(value = "/inventory",  method = RequestMethod.GET)
	public ModelAndView updateInventory() {
		ModelAndView mav = new ModelAndView("comingSoon");
		return mav;
	}
	
	//helper method to create some test data for testing
	public void addTestData() {
		Item item1 = new Item();
		item1.setName("ANCHOR_02");
		item1.setDesc("MEN CASUAL");
		item1.setCategory("MEN");
		item1.setSubcategory("CASUAL");
		item1.setPhoto("photo/ANCHOR02.jpg");
		item1.setCurrency("USD");
		item1.setUnitprice(15.0);
		
		Item item2 = new Item();
		item2.setName("BAREA_01");
		item2.setDesc("MEN CASUAL");
		item2.setCategory("MEN");
		item2.setSubcategory("CASUAL");
		item2.setPhoto("photo/BAREA01.jpg");
		item2.setCurrency("USD");
		item2.setUnitprice(14.0);
		
		Item item3 = new Item();
		item3.setName("BLACKSTONE_01");
		item3.setDesc("MEN CASUAL");
		item3.setCategory("MEN");
		item3.setSubcategory("CASUAL");
		item3.setPhoto("photo/BLACKSTONE01.jpg");
		item3.setCurrency("USD");
		item3.setUnitprice(16.0);
		
		Item item4 = new Item();
		item4.setName("BYNUM_01");
		item4.setDesc("MEN CASUAL");
		item4.setCategory("MEN");
		item4.setSubcategory("CASUAL");
		item4.setPhoto("photo/BYNUM01.jpg");
		item4.setCurrency("USD");
		item4.setUnitprice(14.0);
		
		ItemDetail itemdetail11 =  new ItemDetail();
		itemdetail11.setColor("Black");
		itemdetail11.setSize("A");
		itemdetail11.setQuantity(100);
		itemdetail11.setSku("1001");
		itemdetail11.setItem(item1);
		
		ItemDetail itemdetail12 =  new ItemDetail();
		itemdetail12.setColor("Black");
		itemdetail12.setSize("B");
		itemdetail12.setQuantity(100);
		itemdetail12.setSku("1002");
		itemdetail12.setItem(item1);
		
		ItemDetail itemdetail13 =  new ItemDetail();
		itemdetail13.setColor("Black");
		itemdetail13.setSize("C");
		itemdetail13.setQuantity(100);
		itemdetail13.setSku("1003");
		itemdetail13.setItem(item1);
		
		ItemDetail itemdetail14 =  new ItemDetail();
		itemdetail14.setColor("Brown");
		itemdetail14.setSize("A");
		itemdetail14.setQuantity(200);
		itemdetail14.setSku("1004");
		itemdetail14.setItem(item1);
		
		ItemDetail itemdetail15 =  new ItemDetail();
		itemdetail15.setColor("Brown");
		itemdetail15.setSize("B");
		itemdetail15.setQuantity(200);
		itemdetail15.setSku("1005");
		itemdetail15.setItem(item1);
		
		ItemDetail itemdetail16 =  new ItemDetail();
		itemdetail16.setColor("Brown");
		itemdetail16.setSize("C");
		itemdetail16.setQuantity(200);
		itemdetail16.setSku("1006");
		itemdetail16.setItem(item1);
		
		ItemDetail itemdetail17 =  new ItemDetail();
		itemdetail17.setColor("Dark Brown");
		itemdetail17.setSize("A");
		itemdetail17.setQuantity(300);
		itemdetail17.setSku("1007");
		itemdetail17.setItem(item1);
		
		ItemDetail itemdetail18 =  new ItemDetail();
		itemdetail18.setColor("Dark Brown");
		itemdetail18.setSize("B");
		itemdetail18.setQuantity(300);
		itemdetail18.setSku("1008");
		itemdetail18.setItem(item1);
		
		ItemDetail itemdetail19 =  new ItemDetail();
		itemdetail19.setColor("Dark Brown");
		itemdetail19.setSize("C");
		itemdetail19.setQuantity(300);
		itemdetail19.setSku("1009");
		itemdetail19.setItem(item1);
		
		ItemDetail itemdetail21 =  new ItemDetail();
		itemdetail21.setColor("Black");
		itemdetail21.setSize("A");
		itemdetail21.setQuantity(100);
		itemdetail21.setSku("2001");
		itemdetail21.setItem(item2);
		
		ItemDetail itemdetail22 =  new ItemDetail();
		itemdetail22.setColor("Black");
		itemdetail22.setSize("B");
		itemdetail22.setQuantity(100);
		itemdetail22.setSku("2002");
		itemdetail22.setItem(item2);
		
		ItemDetail itemdetail23 =  new ItemDetail();
		itemdetail23.setColor("Black");
		itemdetail23.setSize("C");
		itemdetail23.setQuantity(100);
		itemdetail23.setSku("2003");
		itemdetail23.setItem(item2);
		
		ItemDetail itemdetail24 =  new ItemDetail();
		itemdetail24.setColor("Brown");
		itemdetail24.setSize("A");
		itemdetail24.setQuantity(100);
		itemdetail24.setSku("2004");
		itemdetail24.setItem(item2);
		
		ItemDetail itemdetail25 =  new ItemDetail();
		itemdetail25.setColor("Brown");
		itemdetail25.setSize("B");
		itemdetail25.setQuantity(200);
		itemdetail25.setSku("2005");
		itemdetail25.setItem(item2);
		
		ItemDetail itemdetail26 =  new ItemDetail();
		itemdetail26.setColor("Brown");
		itemdetail26.setSize("C");
		itemdetail26.setQuantity(200);
		itemdetail26.setSku("2006");
		itemdetail26.setItem(item2);
		
		ItemDetail itemdetail27 =  new ItemDetail();
		itemdetail27.setColor("Dark Brown");
		itemdetail27.setSize("A");
		itemdetail27.setQuantity(300);
		itemdetail27.setSku("2007");
		itemdetail27.setItem(item2);
		
		ItemDetail itemdetail28 =  new ItemDetail();
		itemdetail28.setColor("Dark Brown");
		itemdetail28.setSize("B");
		itemdetail28.setQuantity(300);
		itemdetail28.setSku("2008");
		itemdetail28.setItem(item2);
		
		ItemDetail itemdetail29 =  new ItemDetail();
		itemdetail29.setColor("Dark Brown");
		itemdetail29.setSize("C");
		itemdetail29.setQuantity(300);
		itemdetail29.setSku("2009");
		itemdetail29.setItem(item2);

		ItemDetail itemdetail31 =  new ItemDetail();
		itemdetail31.setColor("Black");
		itemdetail31.setSize("A");
		itemdetail31.setQuantity(100);
		itemdetail31.setSku("3001");
		itemdetail31.setItem(item3);
		
		ItemDetail itemdetail32 =  new ItemDetail();
		itemdetail32.setColor("Black");
		itemdetail32.setSize("B");
		itemdetail32.setQuantity(100);
		itemdetail32.setSku("3002");
		itemdetail32.setItem(item3);
		
		ItemDetail itemdetail33 =  new ItemDetail();
		itemdetail33.setColor("Black");
		itemdetail33.setSize("C");
		itemdetail33.setQuantity(100);
		itemdetail33.setSku("3003");
		itemdetail33.setItem(item3);
		
		ItemDetail itemdetail34 =  new ItemDetail();
		itemdetail34.setColor("Brown");
		itemdetail34.setSize("A");
		itemdetail34.setQuantity(200);
		itemdetail34.setSku("3004");
		itemdetail34.setItem(item3);
		
		ItemDetail itemdetail35 =  new ItemDetail();
		itemdetail35.setColor("Brown");
		itemdetail35.setSize("B");
		itemdetail35.setQuantity(200);
		itemdetail35.setSku("3005");
		itemdetail35.setItem(item3);
		
		ItemDetail itemdetail36 =  new ItemDetail();
		itemdetail36.setColor("Brown");
		itemdetail36.setSize("C");
		itemdetail36.setQuantity(200);
		itemdetail36.setSku("3006");
		itemdetail36.setItem(item3);
		
		ItemDetail itemdetail37 =  new ItemDetail();
		itemdetail37.setColor("Dark Brown");
		itemdetail37.setSize("A");
		itemdetail37.setQuantity(300);
		itemdetail37.setSku("3007");
		itemdetail37.setItem(item3);
		
		ItemDetail itemdetail38 =  new ItemDetail();
		itemdetail38.setColor("Dark Brown");
		itemdetail38.setSize("B");
		itemdetail38.setQuantity(300);
		itemdetail38.setSku("3008");
		itemdetail38.setItem(item3);
		
		ItemDetail itemdetail39 =  new ItemDetail();
		itemdetail39.setColor("Dark Brown");
		itemdetail39.setSize("C");
		itemdetail39.setQuantity(300);
		itemdetail39.setSku("3009");
		itemdetail39.setItem(item3);
		
		ItemDetail itemdetail41 =  new ItemDetail();
		itemdetail41.setColor("Black");
		itemdetail41.setSize("A");
		itemdetail41.setQuantity(100);
		itemdetail41.setSku("4001");
		itemdetail41.setItem(item4);
		
		ItemDetail itemdetail42 =  new ItemDetail();
		itemdetail42.setColor("Black");
		itemdetail42.setSize("B");
		itemdetail42.setQuantity(100);
		itemdetail42.setSku("4002");
		itemdetail42.setItem(item4);
		
		ItemDetail itemdetail43 =  new ItemDetail();
		itemdetail43.setColor("Black");
		itemdetail43.setSize("C");
		itemdetail43.setQuantity(100);
		itemdetail43.setSku("4003");
		itemdetail43.setItem(item4);
		
		ItemDetail itemdetail44 =  new ItemDetail();
		itemdetail44.setColor("Brown");
		itemdetail44.setSize("A");
		itemdetail44.setQuantity(200);
		itemdetail44.setSku("4004");
		itemdetail44.setItem(item4);
		
		ItemDetail itemdetail45 =  new ItemDetail();
		itemdetail45.setColor("Brown");
		itemdetail45.setSize("B");
		itemdetail45.setQuantity(200);
		itemdetail45.setSku("4005");
		itemdetail45.setItem(item4);
		
		ItemDetail itemdetail46 =  new ItemDetail();
		itemdetail46.setColor("Brown");
		itemdetail46.setSize("C");
		itemdetail46.setQuantity(200);
		itemdetail46.setSku("4006");
		itemdetail46.setItem(item4);
		
		ItemDetail itemdetail47 =  new ItemDetail();
		itemdetail47.setColor("Dark Brown");
		itemdetail47.setSize("A");
		itemdetail47.setQuantity(300);
		itemdetail47.setSku("4007");
		itemdetail47.setItem(item4);
		
		ItemDetail itemdetail48 =  new ItemDetail();
		itemdetail48.setColor("Dark Brown");
		itemdetail48.setSize("B");
		itemdetail48.setQuantity(300);
		itemdetail48.setSku("4008");
		itemdetail48.setItem(item4);
		
		ItemDetail itemdetail49 =  new ItemDetail();
		itemdetail49.setColor("Dark Brown");
		itemdetail49.setSize("C");
		itemdetail49.setQuantity(300);
		itemdetail49.setSku("4009");
		itemdetail49.setItem(item4);
		
		List<ItemDetail> itemDetail1 = new ArrayList<ItemDetail>();
		itemDetail1.add(itemdetail11);
		itemDetail1.add(itemdetail12);
		itemDetail1.add(itemdetail13);
		itemDetail1.add(itemdetail14);
		itemDetail1.add(itemdetail15);
		itemDetail1.add(itemdetail16);
		itemDetail1.add(itemdetail17);
		itemDetail1.add(itemdetail18);
		itemDetail1.add(itemdetail19);
		item1.setItemdetail(itemDetail1);
		

		List<ItemDetail> itemDetail2 = new ArrayList<ItemDetail>();
		itemDetail2.add(itemdetail21);
		itemDetail2.add(itemdetail22);
		itemDetail2.add(itemdetail23);
		itemDetail2.add(itemdetail24);
		itemDetail2.add(itemdetail25);
		itemDetail2.add(itemdetail26);
		itemDetail2.add(itemdetail27);
		itemDetail2.add(itemdetail28);
		itemDetail2.add(itemdetail29);
		item2.setItemdetail(itemDetail2);
		
		
		List<ItemDetail> itemDetail3 = new ArrayList<ItemDetail>();
		itemDetail3.add(itemdetail31);
		itemDetail3.add(itemdetail32);
		itemDetail3.add(itemdetail33);
		itemDetail3.add(itemdetail34);
		itemDetail3.add(itemdetail35);
		itemDetail3.add(itemdetail36);
		itemDetail3.add(itemdetail37);
		itemDetail3.add(itemdetail38);
		itemDetail3.add(itemdetail39);
		item3.setItemdetail(itemDetail3);
		
		List<ItemDetail> itemDetail4 = new ArrayList<ItemDetail>();
		itemDetail4.add(itemdetail41);
		itemDetail4.add(itemdetail42);
		itemDetail4.add(itemdetail43);
		itemDetail4.add(itemdetail44);
		itemDetail4.add(itemdetail45);
		itemDetail4.add(itemdetail46);
		itemDetail4.add(itemdetail47);
		itemDetail4.add(itemdetail48);
		itemDetail4.add(itemdetail49);
		item4.setItemdetail(itemDetail4);
		
		itemService.addItem(item1);
		itemService.addItem(item2);
		itemService.addItem(item3);
		itemService.addItem(item4);
		
	}
	
}
