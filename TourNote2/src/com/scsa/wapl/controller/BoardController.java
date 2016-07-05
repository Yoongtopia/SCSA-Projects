package com.scsa.wapl.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.wapl.entity.Board;
import com.scsa.wapl.entity.Member;
import com.scsa.wapl.service.BoardService;
import com.scsa.wapl.util.AdvancedPageUtility;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("board_insert_form.do")
	public String insertBoardForm(Model model){
		model.addAttribute("contentPage", "boardWrite.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("board_insert.do")
	public String insertBoard(Board board, Model model){
		boardService.createBoard(board);
		return "redirect:/board_list_category.do?boardCategory=qna";
	}
	
	@RequestMapping("board_insert_answer.do")
	public String insert_answer_Board(int boardNum, Model model){
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("contentPage", "boardWrite_answer.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("board_insert_answer2.do")
	public String insert_answer_Board2(Board board, Model model){
		System.out.println(board);
		boardService.createBoardAnswer(board);
		return "redirect:/board_list_category.do?boardCategory=qna";
	}

	@RequestMapping("board_update1.do")
	public String updateBoard1(int boardNum, Model model){
		model.addAttribute("board", boardService.findBoard(boardNum));
		model.addAttribute("contentPage", "boardUpdate.jsp");
		return "index.jsp";
	}

	@RequestMapping("board_update2.do")
	public String updateBoard2(Board board, Model model){
		System.out.println(board);
		boardService.modifyBoard(board);
		
		return "redirect:/board_list_category.do?boardCategory=qna";
	}
	
	@RequestMapping("faq_update1.do")
	public String updateFaq1(int boardNum, Model model){
		model.addAttribute("board", boardService.findBoard(boardNum));
		model.addAttribute("contentPage", "faqUpdate.jsp");
		return "index.jsp";
	}

	@RequestMapping("faq_update2.do")
	public String updateFaq2(Board board, Model model){
		System.out.println(board);
		boardService.modifyBoard(board);
		
		return "redirect:/board_list_faq.do?boardCategory=faq";
	}
	
	@RequestMapping("board_delete.do")
	public String removeBoard(int boardNum, Model model){
		boardService.removeBoard(boardNum);
		return "redirect:/board_list_category.do?boardCategory=qna";
	}
	
	@RequestMapping("faq_delete.do")
	public String removeFaq(int boardNum, Model model){
		boardService.removeBoard(boardNum);
		return "redirect:/board_list_faq.do?boardCategory=faq";
	}
	
	@RequestMapping("board_list_category.do")
	public String selectBoardListByCategory(String boardCategory, Model model, 
			HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
		final int perPage=15;
		int startNo=(page-1)*perPage+1;
		int endNo=page*perPage;
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, boardService.listCount(boardCategory), page,"images/");
			model.addAttribute("boardList", 
					boardService.findBoardListByCategory(boardCategory, startNo, endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "boardList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
	}
	
	@RequestMapping("adminBoard.do")
	public String adminBoard(String boardCategory, Model model, 
			HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
		final int perPage=15;
		int startNo=(page-1)*perPage+1;
		int endNo=page*perPage;
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, boardService.listCount(boardCategory), page,"images/");
			model.addAttribute("boardList", 
					boardService.findBoardListByCategory(boardCategory, startNo, endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "boardListforAdmin.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
	}
	

	
	@RequestMapping("board_list_faq.do")
	public String selectBoardListByFaq(String boardCategory, Model model
			, HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			final int perPage=15;
			int startNo=(page-1)*perPage+1;
			int endNo=page*perPage;
				AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, boardService.listCount(boardCategory), page,"images/");
				model.addAttribute("boardList", 
						boardService.findBoardListByCategory(boardCategory, startNo, endNo));
				model.addAttribute("pageLink", pageUtil.getPageBar());
				model.addAttribute("contentPage", "faqList.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return "index.jsp";
	}
	
	@RequestMapping("board_detail.do")
	public String selectBoard(int boardNum, Model model){
		model.addAttribute("board", boardService.findBoard(boardNum));
		model.addAttribute("contentPage", "boardDetail.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("board_list_id.do")
	public String selectBoardListById(HttpSession session, Model model){
		Member member=(Member)session.getAttribute("member");
		model.addAttribute("boardList", boardService.findBoardListById(member.getMemberId()));
		model.addAttribute("contentPage", "boardList.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("board_list_title.do")
	public String selectBoardListByTitle(String boardTitle, Model model){
		model.addAttribute("boardList", boardService.findBoardListByTitle(boardTitle));
		model.addAttribute("contentPage", "boardList.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("board_list_notice.do")
	public String selectNoticeList(String boardCategory, Model model, 
			HttpServletRequest request){
		String cPage=request.getParameter("pageNo");
		int page=1;
		
		try {
			page = Integer.parseInt(cPage);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
		final int perPage=15;
		int startNo=(page-1)*perPage+1;
		int endNo=page*perPage;
			AdvancedPageUtility pageUtil=new AdvancedPageUtility(perPage, boardService.listCount(boardCategory), page,"images/");
			model.addAttribute("boardList", 
					boardService.findBoardListByCategory(boardCategory, startNo, endNo));
			model.addAttribute("startNo", startNo);
			model.addAttribute("endNo", endNo);
			model.addAttribute("pageLink", pageUtil.getPageBar());
			model.addAttribute("contentPage", "noticeList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index.jsp";
	}
	
	@RequestMapping("notice_insert_form.do")
	public String insertNoticeForm(Model model){
		model.addAttribute("contentPage", "noticeWrite.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("notice_insert.do")
	public String insertNotice(Board board, Model model){
		boardService.createNotice(board);
		return "redirect:/board_list_notice.do?boardCategory=notice";
	}
	
	@RequestMapping("notice_update1.do")
	public String updateNotice1(int boardNum, Model model){
		model.addAttribute("board", boardService.findBoard(boardNum));
		model.addAttribute("contentPage", "noticeUpdate.jsp");
		return "index.jsp";
	}
	
	@RequestMapping("notice_update2.do")
	public String updateNotice2(Board board, Model model){
		boardService.modifyBoard(board);
		return "redirect:/board_list_category.do?boardCategory=notice";
	}
	
	@RequestMapping("notice_delete.do")
	public String removeNotice(int boardNum, Model model){
		boardService.removeBoard(boardNum);
		return "redirect:/board_list_category.do?boardCategory=notice";
	}
	
	@RequestMapping("searchBoard.do")
	public String Search(String boardTitle, Model model){
		List<Board> searchList = boardService.selectBoardbyTitleOrWriter(boardTitle);		
		model.addAttribute("searchList", searchList);
		model.addAttribute("contentPage", "boardSearchList.jsp");
		return "index.jsp";
	}
	
}//end class