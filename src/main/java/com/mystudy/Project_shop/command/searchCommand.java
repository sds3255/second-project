package com.mystudy.Project_shop.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;

public class searchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("idx : ~!~!!" + idx);
		System.out.println("keyword" + keyword);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("idx", idx);
		
		System.out.println("map!!!!!" + map);
		
		int cnt = ShopDAO.searchCount(map);
		
		 System.out.println("cnt!!!!!!! : " + cnt);
		 request.setAttribute("cnt", cnt);
		 request.setAttribute("idx", idx);
		 request.setAttribute("keyword", keyword);
		
		 path = "searchView.jsp?cnt=" + cnt;
		
		
		return path;
	}

}
