package com.shoprp.model;

import java.util.List;

public interface ShoprpJDBCDAO_interface {
	public void insert(ShoprpVO shoprpVO);
	public List<ShoprpVO> getAll();
	public void delete(String rmno,String mbrno);
}
