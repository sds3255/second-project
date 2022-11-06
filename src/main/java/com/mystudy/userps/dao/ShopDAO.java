package com.mystudy.userps.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.Project_shop.vo.customerVO;
import com.mystudy.mybatis.DBService;


public class ShopDAO {
//컨트롤러에 지정해준 이름으로 메서드 생성
	
	//회원가입
	public static int join(customerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("customer.join", vo);
		ss.close();
		return result;
	}
	
	//로그인
	public static String login(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String st = ss.selectOne("customer.login", map);
		ss.close();
		return st;
	}
	

	//회원정보 업뎃
	public static int update(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("customer.update", id);
		ss.close();
		return result;
	}


	
	//회원정보 삭제 //삭제도 무조건 리턴값이 int임!
	public static int delete(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("customer.delete", id);
		ss.close();
		return result;
	}
	
	//회원정보 전체 조회
	public static customerVO select(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		customerVO vo = ss.selectOne("customer.all", id);
		ss.close();
		return vo;
	}

	//회원정보 수정 //업데이트는 무조건 리턴값이 int임!
	public static int updateok(customerVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("customer.update", vo);
		ss.close();
		return result;
	}
	
	//아이디값 중복 확인
	public static String idcheck(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String vo = ss.selectOne("customer.idcheck", id);
		ss.close();
		return vo;
	}
	
	//패스워드값 중복 확인
	public static String pwdcheck(String pwd) {
		SqlSession ss = DBService.getFactory().openSession();
		String vo = ss.selectOne("customer.pwdcheck", pwd);
		ss.close();
		return vo;
	}
	
	//로그아웃
	public static String logout(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String st = ss.selectOne("customer.logout", id);
		ss.close();
		return st;
	}
	
	public static String pwd(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		String st = ss.selectOne("customer.pwd", id);
		ss.close();
		return st;
	}

	public static String idFind(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String findId =  ss.selectOne("customer.idFind", map);
		ss.close();
		return findId;
	}

	public static String pwFind(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwFind =  ss.selectOne("customer.pwFind", map);
		ss.close();
		return pwFind;
	}

}
