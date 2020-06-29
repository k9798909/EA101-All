package com.shoprp.model;

import java.sql.Date;

import com.shoprp.model.ShoprpVO;

public class ShoprpService {
	
	private ShoprpJDBCDAO_interface dao;

	public ShoprpService() {
		dao = new ShoprpJDBCDAO();
	}
	
	public ShoprpVO report(String mbrno,String rmno,String detail,Integer attend) {
		ShoprpVO shoprpVO = new ShoprpVO();
		
		shoprpVO.setMbrno(mbrno);
		shoprpVO.setRmno(rmno);
		shoprpVO.setDetail(detail);
		shoprpVO.setAttend(attend);
		dao.insert(shoprpVO);
		
		return shoprpVO;
		
		
	}
}
