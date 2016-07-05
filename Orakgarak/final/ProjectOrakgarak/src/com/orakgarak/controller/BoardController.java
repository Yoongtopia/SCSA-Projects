package com.orakgarak.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orakgarak.service.BoardService;
import com.orakgarak.service.ReplyService;
import com.orakgarak.service.ReplyServiceImpl;
import com.orakgarak.service.UserService;
import com.orakgarak.util.PageUtil;
import com.orakgarak.vo.Board;
import com.orakgarak.vo.Reply;
import com.orakgarak.vo.User;

@Controller
public class BoardController {
 
	private BoardService boardService;
	private UserService userService;
	private ReplyService replyService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
		
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired	
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	@RequestMapping("/board_write.do")
	public String regist(String boardTitle, String boardContent, String boardCategory, String userId){
		User user=userService.findUserView(userId);
		boardService.create(new Board(user.getName(), boardTitle, boardContent, boardCategory, userId));
		return "redirect:/board_list.do";
	}
	
	@RequestMapping("/board_updateMove.do")
	public String updateMove(int boardNo, Model model){
		model.addAttribute("board", boardService.boardView(boardNo));
		model.addAttribute("contentPage","board/boardUpdate.jsp");
		return "index";
	}
	
	@RequestMapping("/board_update.do")
	public String update(Board board, Model model){
		model.addAttribute("board", boardService.update(board));
		return "redirect:/board_list.do";
	}
	
	@RequestMapping("/board_delete.do")
	public String delete(int boardNo){
		boardService.remove(boardNo);
		return "redirect:/board_list.do";
	}
		
	@RequestMapping("/board_detail.do")
	public String view(@RequestParam(value="pageNum",defaultValue="1")int pageNum, int boardNo, Model model){
		//int pageNum�� 1�� ���´�
		//��ü ���� ���� ������
		int totalRowCount=replyService.getCount(boardNo);
		//������ ���� ����ؿ���
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		//�������ȣ, �����ȣ Map�� ���
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		//���� �������� ���� �۸�� ������
		List<Reply> list = replyService.getReplyList(boardNo,(pageNum-1)*10);
		//����� Model��ü�� ���
		model.addAttribute("reply", list);
		model.addAttribute("pu", pu);
		
		//��ȸ�� ����
		boardService.addHit(boardNo);
		//������
		
		model.addAttribute("next", boardService.getNextPage(boardNo));
		model.addAttribute("prev", boardService.getPrevPage(boardNo));
	
	
		model.addAttribute("minimum", boardService.getNext());
		//������
		model.addAttribute("maximum", boardService.getPrev());
		//�����
		model.addAttribute("board", boardService.boardView(boardNo));
		//���
		model.addAttribute("contentPage","board/boardDetail.jsp");
		return "index";
	}
	
	@RequestMapping("/board_list.do")
	public String list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model){
		//int pageNum�� 1�� ���´�
		//��ü ���� ���� ������
		int totalRowCount=boardService.getCount();
		//������ ���� ����ؿ���
		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
		//�������ȣ, �����ȣ Map�� ���
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		//model.addAttribute("board", boardService.boardList());
		//���� �������� ���� �۸�� ������
		List<Board> list = boardService.getList((pageNum-1)*10);
		//����� Model��ü�� ���dd
		model.addAttribute("board", list);
		model.addAttribute("pu", pu);
		model.addAttribute("contentPage","board/boardList.jsp");
		return "index";
	}
	
	@RequestMapping("/reply_write.do")
	public String replyRegist(String replyContent, int boardNo, HttpSession session,Model model){
		
		User user = (User) session.getAttribute("user");
		replyService.create(new Reply(replyContent, user.getName(), boardNo));
		return "redirect:/board_detail.do?boardNo="+boardNo;
		
	}
	
	/*@RequestMapping("/reply_updateMove.do")
	public String replyUpdateMove(int replyNo, Model model){
		model.addAttribute("reply", replyService.findReply(replyNo));
		return "reply_update";
	}
	
	@RequestMapping("/reply_update.do")
	public String replyUpdate(Reply reply, Model model){
		model.addAttribute("reply", replyService.update(reply));
		return "redirect:/reply_list.do";
	}*/
	
	@RequestMapping("/reply_delete.do")
	public String replyDelete(int replyNo, int boardNo, Model model){
		replyService.remove(replyNo);
		return "redirect:/board_detail.do?boardNo="+boardNo;
	}
	
	@RequestMapping("/reply_list.do")
	public String replyList(Reply reply, Model model){
		model.addAttribute("reply", replyService.replyList());
		return "redirect:/board_list.do";
	}
	
	@RequestMapping("/board_search.do")
	public String searchBoard(String search, Model model){
		List<Board> searchResult = boardService.findBoardTitleAndName(search);
		model.addAttribute("board", searchResult);
		model.addAttribute("contentPage","board/boardList.jsp");
		return "index";
	}
	
}
