package com.tech.gndo1.main.dao;

import java.util.ArrayList;

import com.tech.gndo1.cptype.dto.Accommodation_infoDto;

public interface MIDao {
	public ArrayList<Accommodation_infoDto> search_list(String sk);
}
