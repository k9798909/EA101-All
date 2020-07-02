package com.rminfo.model;

import java.sql.*;
import java.util.List;

public class RminfoService {
	
	private RminfoDAO_interface dao;
	
	public RminfoService() {
		dao = new RminfoJDBCDAO();
	}
	
	public RminfoVO createRm(String shopno, Timestamp cutoff, String naming, Integer uplimit, Integer lowlimit, Timestamp starttime, Timestamp endtime, String mbrno, String game, String remarks, Integer restriction, Integer confirmed ) {
		RminfoVO rminfoVO = new RminfoVO();
		
		rminfoVO.setShopno(shopno);
		rminfoVO.setCutoff(cutoff);
		rminfoVO.setNaming(naming);
		rminfoVO.setUplimit(uplimit);
		rminfoVO.setLowlimit(lowlimit);
		rminfoVO.setStarttime(starttime);
		rminfoVO.setEndtime(endtime);
		rminfoVO.setMbrno(mbrno);
		rminfoVO.setGame(game);
		rminfoVO.setRemarks(remarks);
		rminfoVO.setRestriction(restriction);
		rminfoVO.setConfirmed(confirmed);
		dao.insert(rminfoVO);
		
		return rminfoVO;
	}
	
	public void update(Integer status,Integer report,String rmno) {
		dao.update(status, report, rmno);
	}
	
	public List<RminfoVO> getAll(){
		return dao.getAll();
	}
	
	public RminfoVO getOneRm(String rmno) {
		return dao.findByRmno(rmno);
	}
	
	public List<RminfoVO> findByShopno(String shopno) {
		return dao.findByShopno(shopno);
	}
}
