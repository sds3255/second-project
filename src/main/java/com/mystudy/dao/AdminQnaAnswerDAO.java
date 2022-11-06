package com.mystudy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminQnaAnswerVO;

public class AdminQnaAnswerDAO {
	
	public static List<AdminQnaAnswerVO> selectQnaAnswerAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminQnaAnswerVO> list = ss.selectList("shop.adminselectQnaAnswerAll");
		ss.close();
		return list;
	}
	
	public static AdminQnaAnswerVO selectQnaAnswer(int qNum) {
		SqlSession ss = DBService.getFactory().openSession();
		AdminQnaAnswerVO vo = ss.selectOne("shop.adminselectQnaAnswer", qNum);
		ss.close();
		return vo;
	}
	
}
