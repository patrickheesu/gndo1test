package com.tech.gndo1.pay.dao;

import java.util.List;

import com.tech.gndo1.mb.dto.MembersDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

public interface PIDao {
	List<RoomTypeDto> reservesel(int acc_num);

	RoomTypeDto reservesel(String rt_num);

	MembersDto memsel(String mem_num);

	
}
