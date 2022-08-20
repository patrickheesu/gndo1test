package com.tech.gndo1.board.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class BoardRestController {
	
	@PostMapping("/review/reviewlist")
	public String review_list(String scroll_count) throws Exception{
		
		System.out.println(scroll_count);
		int int_count = Integer.parseInt(scroll_count);
		
		
		return "";
	}
}
