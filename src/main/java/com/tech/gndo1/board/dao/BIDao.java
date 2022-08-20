package com.tech.gndo1.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.gndo1.review.dto.ReviewDto;
import com.tech.gndo1.review.dto.Review_imgDto;

public interface BIDao {
	public ArrayList<ReviewDto> review_list();
	public ReviewDto review_detail(String rv_num);
	public String mem_nickselect(int mem_num);
	public void reviewInsert(int mem_num, int rt_num, String rv_title, String rv_content, String rv_grand);
	public int reviewIt(int mem_num);
	public int rvnumselect(int mem_num);
	public void reviewrt(String originFile, int rt_num, String changeFile);
	public int rvdtselect(String rv_num);
	public List<Review_imgDto> rvimg(String rv_num);
	public List<Review_imgDto> rvimgselect();
}
