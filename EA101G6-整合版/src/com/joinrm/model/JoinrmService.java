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

	public List<JoinrmVO> findByPK(String rmno,String mbrno){
		return dao.findByPK(rmno,mbrno);
	}

	public void deleteMbr(String rmno,String mbrno) {
		dao.delete(rmno, mbrno);
	}
	
	public List<JoinrmVO> getAll(){
		return dao.getAll();
	}
}
