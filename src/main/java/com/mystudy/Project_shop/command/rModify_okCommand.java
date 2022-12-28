package com.mystudy.Project_shop.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.Project_shop.dao.ShopDAO;
import com.mystudy.Project_shop.vo.reviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class rModify_okCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String filepath = "c:/MyStudy/temp";
		MultipartRequest mr = new MultipartRequest(
				request, filepath, (10 * 1024 * 1024),"UTF-8", new DefaultFileRenamePolicy()
				);
		
		reviewVO rvo = new reviewVO();
		rvo.setTitle(mr.getParameter("Qtitle"));
		rvo.setbContents(mr.getParameter("Qcontent"));
		rvo.setFileName(mr.getParameter("fileName"));
		rvo.setOriName(mr.getParameter("fileName"));
		rvo.setbNum(bNum);
		if (mr.getFile("fileName") != null) { // 첨부 파일이 있으면?
			rvo.setFileName(mr.getFilesystemName("fileName"));
			rvo.setOriName(mr.getOriginalFileName("fileName"));
		} else { // 첨부 파일이 없으면?
			rvo.setFileName("");
			rvo.setOriName("");
		}
		
		int result = ShopDAO.rUpdate(rvo);
		
		request.setAttribute("result", result);
		request.setAttribute("id", request.getParameter("id"));		
	 	String path = "/bord/review.jsp?cPage=" + cPage + "&bNum=" + bNum ;
		return path;
	}
}
