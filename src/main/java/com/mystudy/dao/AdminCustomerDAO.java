package com.mystudy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminCustomerVO;

public class AdminCustomerDAO {
	
	public static String getAdinPwd(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwd = ss.selectOne("shop.admingetAdinPwd", id);
		ss.close();
		return pwd;
	}
	
	public static List<AdminCustomerVO> selectCustAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCustomerVO> list = ss.selectList("shop.adminselectCustAll");
		ss.close();
		return list;
	}
	
	public static List<AdminCustomerVO> selectCustName(String name) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCustomerVO> list = ss.selectList("shop.adminselectCustName", name);
		ss.close();
		return list;
	}
	
	public static List<AdminCustomerVO> selectCustId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCustomerVO> list = ss.selectList("shop.adminselectCustId", id);
		ss.close();
		return list;
	}
	
	public static List<AdminCustomerVO> getSearch(String select, String keyword, String begin, String end) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCustomerVO> list = ss.selectList("shop.adminsearchMember", map); 
		ss.close();
		return list;
	}
	
	//전체 회원수 조회
	public static int getTotalCountMember() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.admintotalCountMember");
		ss.close();
		return totalCount;
	}
	
	//키워드에 해당하는 회원수 조회
	public static int SearchCountMember(String select, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("select", select);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shop.adminsearchCountMember", map); 
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 회원목록 가져오기
	public static List<AdminCustomerVO> memberList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCustomerVO> list = ss.selectList("shop.adminmemberList", map);
		ss.close();
		return list;
	}
	
	
}
