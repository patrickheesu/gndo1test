package com.tech.gndo1.main.dao;

import java.util.ArrayList;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;

public interface MIDao {
	public ArrayList<Accommodation_infoDto> search_list(String sk);

	public int get_birth(int mem_num);

	public ArrayList<Accommodation_infoDto> get_recomand(String param1, String param2, String param3, String param4);
}
