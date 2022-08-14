package com.tech.gndo1.pay.dao;

import java.util.List;

import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.payment.dto.ReserveDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;
import com.tech.gndo1.roomtype.dto.RoomTypeimgDto;

public interface PIDao {
	List<RoomTypeDto> reservesel(int acc_num);

	RoomTypeDto reservesel(String rt_num);

	MembersDto memsel(String mem_num);
	
	public List<RoomTypeimgDto> rmimg(String rt_num);

	void reservein(int mem_num, int rt_num, String rs_start, String rs_end, int rs_people, String rs_name, String rs_pnum);

	int reserveselect(int mem_num);

	void paymentin(int rs_num, String pm_type);

	List<ReserveDto> mbpaymentselect(int mem_num);

	List<ReserveDto> cppaymentselect(int cpy_num);

	List<ReserveDto> mbpaycancelselect(int pm_num);

	String accnamesel(String rt_num);

	void paycancelin(int pm_num, String pc_reason, int rt_price, double pc_appamt);


	

	
}
