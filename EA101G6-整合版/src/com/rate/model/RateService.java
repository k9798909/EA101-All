package com.rate.model;

import java.sql.*;

public class RateService {
	private RateJDBCDAO_interface dao;
	
	public RateService() {
		dao = new RateJDBCDAO();
	}
	public RateVO sendRate(String rmno, String ratingmbrno, String ratedmbrno, String detail, Integer score) {
		RateVO rateVO = new RateVO();
		rateVO.setRmno(rmno);
		rateVO.setRatingmbrno(ratingmbrno);
		rateVO.setRatedmbrno(ratedmbrno);
		rateVO.setDetail(detail);
		rateVO.setScore(score);
		dao.insert(rateVO);
		
		return rateVO;
	}
}
