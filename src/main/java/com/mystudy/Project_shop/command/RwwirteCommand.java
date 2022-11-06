package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.reviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RwwirteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String id = request.getParameter("id");
		//System.out.println("id : " + id);
		
		//파일의 저장위치
		String filepath = "C:\\MyStudy\\Project_shop\\WebContent\\temp";
		
		MultipartRequest mr = new MultipartRequest(
				request, filepath, (10 * 1024 * 1024),"UTF-8", new DefaultFileRenamePolicy()
				);
		
//	 	전달받은 데이터 처리
		reviewVO rvo = new reviewVO();
		rvo.setTitle(mr.getParameter("title"));
		rvo.setbContents(mr.getParameter("bContent"));
		rvo.setFileName(mr.getParameter("fileName"));
		rvo.setId(mr.getParameter("id"));
		rvo.setProductName(mr.getParameter("proName"));
		
		
		// 첨부 파일 데이터 처리
		if (mr.getFile("fileName") != null) { // 첨부 파일이 있으면?
			rvo.setFileName(mr.getFilesystemName("fileName"));
			rvo.setOriName(mr.getOriginalFileName("fileName"));
		} else { // 첨부 파일이 없으면?
			rvo.setFileName("");
			rvo.setOriName("");
		}
		
		System.out.println(">> rvo : "+rvo);
		System.out.println(">> rvo : "+rvo.getId());
		System.out.println(">> rvo : "+mr.getParameter("cPage"));
		
		
		//DB에 입력(저장) 처리!!!!!!!!!11여기부터 하자
		ShopDAO.revInsert(rvo);
		
		request.setAttribute("id", rvo.getId());
		request.setAttribute("cPage", mr.getParameter("cPage"));
		// 화면전환(목록 페이지로 이동 - 첫페이지로 가기)
		String path ="/bord/review.jsp" ;
		
		return path;
	}

}
