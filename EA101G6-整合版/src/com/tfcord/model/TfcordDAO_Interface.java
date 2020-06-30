package com.tfcord.model;

import java.util.List;

public interface TfcordDAO_Interface {
	public void insert(TfcordVO tfcordVO);
	public void update(TfcordVO tfcordVO);
	public void delete(String tfno);
	public void changeStatusBytfno(String tfno);//v
	public TfcordVO findByPrimaryKey(String tfno);//查詢某筆訂單//v
	public List<TfcordVO> findWhoAll(String mbrno);//查某會員有哪些紀錄，也可用於帳戶管理
	public List<TfcordVO> getAll();//查所有點數紀錄
	
	//還沒：查詢某段時間的紀錄  換點的  換錢的
	

}
