package com.mystudy.userproject_shop.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.userps.dao.ShopDAO;

public class idFindCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		Map<String, String> map = new HashMap<String, String>();
 		map.put("name", name);
 		map.put("phone", phone);
 		System.out.println("map : " + map);
 		
		String findid = ShopDAO.idFind(map);
		
		System.out.println("findid : " + findid);
		
		request.setAttribute("findid", findid);
		
		return "userFind.jsp";
	} 

}
