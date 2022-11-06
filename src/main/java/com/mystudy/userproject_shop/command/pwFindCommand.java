package com.mystudy.userproject_shop.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;

public class pwFindCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("phone", phone);
		
		String pwFInd = ShopDAO.pwFind(map);
		
		System.out.println("pwFInd : " + pwFInd);
		request.setAttribute("Fid", id);
		request.setAttribute("pwFInd", pwFInd);
		
		return "pwuserFind.jsp";
		
	}

}
