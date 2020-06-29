package com.rminfo.model;

import java.util.*;

public interface RminfoDAO_interface {
	public void insert(RminfoVO rminfoVO);
	public void update(Integer status,String rmno);
	public List<RminfoVO> getAll();
	public RminfoVO findByRmno(String rmno);
	
}
