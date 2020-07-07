package com.rate.model;

import java.util.List;

public interface RateJDBCDAO_interface {
	public void insert(RateVO rateVO);
	public void delete(String rateno);
	public List<RateVO> getAll();
}
