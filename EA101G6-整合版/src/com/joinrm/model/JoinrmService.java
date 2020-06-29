package com.joinrm.model;

import java.util.List;

public class JoinrmService {
	
	private JoinrmDAO_interface dao;
	
	public JoinrmService() {
		dao = new JoinrmJDBCDAO();
	}
	
	
	public JoinrmVO insertMbr(String rmno,String mbrno) {
		JoinrmVO joinrmVO = new JoinrmVO();
		
		joinrmVO.setRmno(rmno);
		joinrmVO.setMbrno(mbrno);
		dao.insert(joinrmVO);
		return joinrmVO;
		
	}
	//查會員有加入的房間OR查房間內的會員
	public List<JoinrmVO> findByPK(String rmno,String mbrno){
		return dao.findByPK(rmno,mbrno);
	}
	//離開房間
	public void deleteMbr(String rmno,String mbrno) {
		dao.delete(rmno, mbrno);
	}
	
	public List<JoinrmVO> getAll(){
		return dao.getAll();
	}
}
