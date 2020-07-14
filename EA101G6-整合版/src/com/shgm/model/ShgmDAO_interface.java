package com.shgm.model;

import java.sql.Connection;

import com.mbrpf.model.MbrpfVO;

public interface ShgmDAO_interface {
	public void insertShgm(ShgmVO shgmvo);
	public void update(ShgmVO shgmvo);
	public void update(ShgmVO shgmvo, MbrpfVO mbrpfVO);
	public void update(ShgmVO shgmvo, Connection con);//檢舉更新用的
	public void delete(String shgmno);
	public ShgmVO findByPrimaryKey(String shgmno);
	public ShgmVO getOneForInfo(String shgmno);
	public java.util.Set<ShgmVO> getall();
	public java.util.Set<ShgmVO> allForSeller(String sellerno);
	public java.util.Set<ShgmVO> allForBuyer(String buyerno);
	public java.util.Set<ShgmVO> allForPpersonalMkt(String sellerno);
	public java.util.Set<ShgmVO> getAllForMain();
	public java.util.List<ShgmVO> getAllForInfoShuffle();
	public java.util.Set<ShgmVO> searchForMain(String word);
}
