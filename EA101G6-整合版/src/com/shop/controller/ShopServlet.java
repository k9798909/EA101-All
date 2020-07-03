package com.shop.controller;

import java.io.*;

import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.shop.model.*;

@MultipartConfig
public class ShopServlet extends HttpServlet {
	String saveDirectory = "/images_uploaded";

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			String errorMsgs ="";
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String shopno = req.getParameter("shopno");
				String shopnoReg = "[D][S]\\d{5}";
				if (shopno == null || (shopno.trim()).length() == 0) {
					errorMsgs+="請輸入要查詢的店家";
					req.setAttribute("errorMsgs", errorMsgs);
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShop.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				ShopService shopSvc = new ShopService();
				ShopVO shopVO = shopSvc.getOneShop(shopno);
				if (shopVO == null) {
					errorMsgs+="查無資料";
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("listAllShop.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("shopVO", shopVO); // ��Ʈw���X��shopVO����,�s�Jreq
				String url = "listOneShop.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs+="無法取得資料:" + e.getMessage()+"/n";
				RequestDispatcher failureView = req.getRequestDispatcher("listAllShop.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllshop.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			ShopService shopSvc = new ShopService();
			String shopno = null;
			ShopVO shopVO = null;
			shopVO = (ShopVO) session.getAttribute("account");
			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				if(req.getParameter("shopno") == null) {
					shopno = shopVO.getShopno();					
				}
				else{
					shopno = req.getParameter("shopno");
				}
				
				

				/*************************** 2.�}�l�d�߸�� ****************************************/
//				ShopService shopSvc = new ShopService();
				shopVO = shopSvc.getOneShop(shopno);
				String city = shopVO.getShoploc().substring(0,2);
				String area = shopVO.getShoploc().substring(3,5);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("shopVO", shopVO); // ��Ʈw���X��shopVO����,�s�Jreq
				req.setAttribute("city", city);
				req.setAttribute("area", area);
				String url = "update_shop_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_shop_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("listAllShop.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_shop_input.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String shopno = req.getParameter("shopno");
				String shopnoReg = "[D][S]\\d{5}";
				if (shopno == null || (shopno.trim()).length() == 0) {
					errorMsgs.add("店家編號:請勿空白");
				} else if (!shopno.trim().matches(shopnoReg)) {
					errorMsgs.add("店家編號格式錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				String shopname = req.getParameter("shopname");
				String shopnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,10}$";
				if (shopname == null || shopname.trim().length() == 0) {
					errorMsgs.add("店家名稱請勿空白");
				} else if (!shopname.trim().matches(shopnameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家");
				}

				String shopact = req.getParameter("shopact");
				String shopactReg = "^[(a-zA-Z0-9)]{3,10}$";
				if (shopact == null || shopact.trim().length() == 0) {
					errorMsgs.add("店家帳號請勿空白");
				} else if (!shopact.trim().matches(shopactReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家帳號格是錯誤");
				}

				String shoppw = req.getParameter("shoppw");
				String shoppwReg = "^[(a-zA-Z0-9)]{3,10}$";
				if (shoppw == null || shoppw.trim().length() == 0) {
					errorMsgs.add("店家密碼請勿空白");
				} else if (!shoppw.trim().matches(shoppwReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家密碼格式錯誤");
				}

				String shoploc = "";
				String city = req.getParameter("city");
				String area = req.getParameter("area");
				String addr = req.getParameter("addr");
				String addrReg = "^[(\u4e00-\u9fa5) a-zA-Z0-9_]{2,50}$";
				if (city != null && city.trim().length() != 0 && area != null && area.trim().length() != 0
						&& addr != null && addr.trim().length() != 0) {

					shoploc = city + area.substring(3) + addr;
					if (!shoploc.matches(addrReg)) {
						errorMsgs.add("地址格式錯誤");
					}
				} else {
					errorMsgs.add("請輸入地址");

				}

				String shopcy = req.getParameter("shopcy");
				String shopcyReg = "^[(\\u4e00-\\u9fa5)(0-9\\*)]{3,9}$";
				if (shopcy == null || shopcy.trim().length() == 0) {
					errorMsgs.add("場地大小請勿空白");
				} else if (!shopcy.trim().matches(shopcyReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("場地格式錯誤");
				}
				Integer shopphone = null;
				try {
					shopphone = new Integer(req.getParameter("shopphone"));

				} catch (NumberFormatException e) {
					shopphone = 912345678;
					errorMsgs.add("電話號碼有誤");
				}
				byte[] shopimg = null;

				Part part;
				part = req.getPart("shopimg");

				InputStream in = null;

				try {
					 if(part.getSize() == 0) {			            	
			     		ShopService shopSvc = new ShopService();
		         		ShopVO shopVo = shopSvc.getOneShop(shopno);
		         		shopimg = shopVo.getShopimg(); 
		         		in = part.getInputStream();
		         		in.read(shopimg);
					 }else{
		            	in = part.getInputStream();
		            	shopimg = new byte[in.available()];
		          		in.read(shopimg);
			    	  } 
				}catch (IOException e) {
					errorMsgs.add("上傳失敗");
					in = getServletContext().getResourceAsStream("/NoData/null.jpg");
					shopimg = new byte[in.available()];
	          		in.read(shopimg);
				}finally {
					in.close();
				}

				Integer status = new Integer(req.getParameter("status").trim());

				ShopVO shopVO = new ShopVO();
				shopVO.setShopno(shopno);
				shopVO.setShopact(shopact);
				shopVO.setShoppw(shoppw);
				shopVO.setShopname(shopname);
				shopVO.setShoploc(shoploc);
				shopVO.setShopcy(shopcy);
				shopVO.setShopphone(shopphone);
				shopVO.setShopimg(shopimg);
				shopVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopVO", shopVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("update_shop_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}

				/*************************** 2.�}�l�ק��� *****************************************/
				ShopService shopSvc = new ShopService();
				shopVO = shopSvc.updateShop(shopno, shopact, shoppw, shopname, shoploc, shopcy, shopphone, shopimg,
						status);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
				req.setAttribute("shopVO", shopVO); // ��Ʈwupdate���\��,���T����shopVO����,�s�Jreq
				String url = "listOneShop.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("update_shop_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // �Ӧ�addshop.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/

				String shopname = req.getParameter("shopname");
				String shopnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,10}$";
				if (shopname == null || shopname.trim().length() == 0) {
					errorMsgs.add("店家名稱請勿空白");
				} else if (!shopname.trim().matches(shopnameReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家名稱格式錯誤");
				}

				String shopact = req.getParameter("shopact");
				String shopactReg = "^[(a-zA-Z0-9)]{3,10}$";
				if (shopact == null || shopact.trim().length() == 0) {
					errorMsgs.add("店家帳號請勿空白");
				} else if (!shopact.trim().matches(shopactReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家帳號格式錯誤");
				}

				String shoppw = req.getParameter("shoppw");
				String shoppwReg = "^[(a-zA-Z0-9)]{3,10}$";
				if (shoppw == null || shoppw.trim().length() == 0) {
					errorMsgs.add("店家密碼請勿空白");
				} else if (!shoppw.trim().matches(shoppwReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
					errorMsgs.add("店家密碼格式錯誤");
				}

//				String shoploc = req.getParameter("shoploc");
//				String shoplocReg = "^[(\\u4e00-\\u9fa5)]{3,9}$";
//				if (shoploc == null || shoploc.trim().length() == 0) {
//					errorMsgs.add("店家位置請勿空白");
//				} else if (!shoploc.trim().matches(shoplocReg)) { // �H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
//					errorMsgs.add("店家密碼格式錯誤");
//				}
				String shoploc = "";
				String city = req.getParameter("city");
				String area = req.getParameter("area");
				String addr = req.getParameter("addr");
				String addrReg = "^[(\u4e00-\u9fa5) a-zA-Z0-9_]{2,50}$";
				if (city != null && city.trim().length() != 0 && area != null && area.trim().length() != 0
						&& addr != null && addr.trim().length() != 0) {

					shoploc = city + area.substring(3) + addr;
					if (!shoploc.matches(addrReg)) {
						errorMsgs.add("地址格式錯誤");
					}
				} else {
					errorMsgs.add("請輸入地址");

				}

				String shopcy = req.getParameter("shopcy");
				String shopcyReg = "^[(\\u4e00-\\u9fa5)(0-9\\*)]{3,9}$";
				if (shopcy == null || shopcy.trim().length() == 0) {
					errorMsgs.add("店家場地請勿空白");
				} else if (!shopcy.trim().matches(shopcyReg)) { 
					errorMsgs.add("場地格式錯誤");
				}
				Integer shopphone = null;
				try {
					shopphone = new Integer(req.getParameter("shopphone"));

				} catch (NumberFormatException e) {
					shopphone = 912345678;
					errorMsgs.add("電話號碼格式錯誤");
				}
				
				byte[] shopimg = null;
				Part part = req.getPart("shopimg");
				InputStream in = null;
				try {
					in = part.getInputStream();
					shopimg = new byte[in.available()];
					in.read(shopimg);
				} catch (IOException e) {

				} finally {
					in.close();
				}
				Integer status = new Integer(req.getParameter("status").trim());

				ShopVO shopVO = new ShopVO();
				shopVO.setShopact(shopact);
				shopVO.setShoppw(shoppw);
				shopVO.setShopname(shopname);
				shopVO.setShoploc(shoploc);
				shopVO.setShopcy(shopcy);
				shopVO.setShopphone(shopphone);
				shopVO.setShopimg(shopimg);
				shopVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("shopVO", shopVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
					HashMap<String, String> hashmap = new HashMap<String, String>();
					hashmap.put("city", city);
					hashmap.put("area", area);
					hashmap.put("addr", addr);
					req.setAttribute("cityarea", hashmap);
					RequestDispatcher failureView = req.getRequestDispatcher("addShop.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				ShopService shopSvc = new ShopService();
				shopVO = shopSvc.addShop(shopact, shoppw, shopname, shoploc, shopcy, shopphone, shopimg, status);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "listAllShop.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllshop.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("addShop.jsp");
				failureView.forward(req, res);
			}
		}
		if ("login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String account = req.getParameter("account");
			String password = req.getParameter("password");
			
			ShopVO shopVO = new ShopVO();
			shopVO.setShopact(account);
			shopVO.setShoppw(password);
			
			ShopService shopSvc = new ShopService();
			shopVO = shopSvc.compare(account, password);
			if (shopVO == null) {
				errorMsgs.add("帳號密碼錯誤");
			}			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("shopVO", shopVO); // �t����J�榡���~��shopVO����,�]�s�Jreq
				RequestDispatcher failureView = req.getRequestDispatcher("login.jsp");
				failureView.forward(req, res);
				return; // �{�����_
			}else {
				shopVO = shopSvc.getOneShop(shopVO.getShopno());
				session.setAttribute("shopVO", shopVO);
			      
			       try {                                                        
			         String location = (String) session.getAttribute("location");
			         if (location != null) {
			           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
			           res.sendRedirect(location);            
			           return;
			         }
			       }catch (Exception ignored) { }
			       res.sendRedirect(req.getContextPath()+"/front-end/index.jsp");
			}
		}

	}

}
