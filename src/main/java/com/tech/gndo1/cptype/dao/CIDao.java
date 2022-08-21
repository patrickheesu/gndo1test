package com.tech.gndo1.cptype.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.gndo1.cp.dto.CompanyDto;
import com.tech.gndo1.cptype.dto.Accommodation_infoDto;
import com.tech.gndo1.review.dto.ReviewDto;
import com.tech.gndo1.roomtype.dto.AccimgDto;
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
	int acccnt(int cpy_num);

	List<RoomTypeDto> rtnumsel(int acc_num);

	Accommodation_infoDto cptypesel(int acc_num);
	
	void rtdel(String rt_num);
	void rtidel(String rt_num);


	List<RoomTypeDto> rtimgselect(int acc_num);

	List<RoomTypeDto> accroomselect(int acc_num);
	
	

	List<RoomTypeDto> htsel(String acc_num);

	Accommodation_infoDto csel(String acc_num);
	
	CompanyDto cinfo(int cpy_num);

	/* List<AccimgDto> accimg(int acc_num); */

	List<AccimgDto> accimg(String acc_num);

	int accimgcnt(String acc_num);

	double rating(String acc_num);
	
	int reviewcnt(String acc_num);

	List<Accommodation_infoDto> accreselect(String acc_num);

	ArrayList<ReviewDto> review_imgList(String acc_num);

//	public CpTypeDto accinfo();

//	ArrayList<RoomTypeDto> rlist();

}
