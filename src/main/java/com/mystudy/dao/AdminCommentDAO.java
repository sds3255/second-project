package com.mystudy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatiss.DBService;
import com.mystudy.vo.AdminCommentVO;

public class AdminCommentDAO {
	
	//해당 번호로 댓글 하나 가져오기
	public static List<AdminCommentVO> adminselectComment(int bNum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<AdminCommentVO> list = ss.selectList("shop.adminselectComment", bNum);
		ss.close();
		return list;
	}
	
	//댓글 추가
	public static int admininsertComment(AdminCommentVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shop.admininsertComment", vo);
		ss.close();
		return result;
	}
	
	//댓글 작성
	public static void admindeleteComment(int cNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("shop.admindeleteComment", cNum);
		ss.close();
	}
}
