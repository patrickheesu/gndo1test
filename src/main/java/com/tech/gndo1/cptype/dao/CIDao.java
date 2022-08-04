package com.tech.gndo1.cptype.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.roomtype.dto.RoomTypeDto;

public interface CIDao {

	void cpInsert(String cpname, String acc_tel, String acc_info, String acc_serkeyword,String acc_map, String acc_location,String lat,String lng, int cpy_num, String detailmap);

	int selacc_num();

	void cpimginsert(String originFile, int acc_num,String changeFile);

	int selrt_num();

	void rtimginsert(String originFile, int rt_num,String changeFile);

	void rtInsert(String rt_rmname, String rt_rmcount, String rt_rpeople, String rt_price, String rt_info, String rt_in,
			String rt_out,int acc_nu);

	int accsel(int cpy_num);

	Accommodation_infoDto cptype(String acc_num);

	List<RoomTypeDto> htsel();

//	public CpTypeDto accinfo();

//	ArrayList<RoomTypeDto> rlist();

}
