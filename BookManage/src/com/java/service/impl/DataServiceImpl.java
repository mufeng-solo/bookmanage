package com.java.service.impl;

import com.java.entity.Data;
import com.java.mapper.DataMapper;
import com.java.service.DataService;

public class DataServiceImpl implements DataService{

	DataMapper dataMapper;
	
	public void setDataMapper(DataMapper dataMapper) {
		this.dataMapper = dataMapper;
	}

	@Override
	public Data queryData(int id) {
		return dataMapper.queryData(1);
	}

	@Override
	public void updatePagesize(int pagesize) {
		dataMapper.updatePagesize(pagesize);
	}

	@Override
	public void updateReturnDate(int returndate) {
		dataMapper.updateReturnDate(returndate);
	}

	@Override
	public void updateFine(int fine) {
		dataMapper.updateFine(fine);
		
	}

	@Override
	public void updateStyle(String style) {
		dataMapper.updateStyle(style);
	}

}
