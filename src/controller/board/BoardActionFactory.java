package controller.board;

import service.Action;
import service.board.BoardNoticeAction;
import service.board.BoardNoticeDeleteAction;
import service.board.BoardNoticeDeleteProAction;
import service.board.BoardNoticeModifyAction;
import service.board.BoardNoticeModifyProAction;
import service.board.BoardNoticeViewAction;
import service.board.BoardNoticeWriteAction;
import service.board.BoardNoticeWriteProAction;
import service.board.BoardQnaDeleteAction;
import service.board.BoardQnaDeleteProAction;
import service.board.BoardQnaListAction;
import service.board.BoardQnaModifyAction;
import service.board.BoardQnaModifyProAction;
import service.board.BoardQnaReplyAction;
import service.board.BoardQnaReplyProAction;
import service.board.BoardQnaViewAction;
import service.board.BoardQnaWriteAction;
import service.board.BoardQnaWriteProAction;

public class BoardActionFactory {
	private static BoardActionFactory instance = new BoardActionFactory();
	
	private BoardActionFactory() {
		super();
		
	}
	public static BoardActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("board_notice")) {
			action = new BoardNoticeAction();
		}else if(command.equals("board_notice_write")) {
			action = new BoardNoticeWriteAction();
		}else if(command.equals("board_notice_write_pro")) {
			action = new BoardNoticeWriteProAction();
		}else if(command.equals("board_notice_view")) {
			action = new BoardNoticeViewAction();
		}else if(command.equals("board_notice_modify")) {
			action = new BoardNoticeModifyAction();
		}else if(command.equals("board_notice_modify_pro")) {
			action = new BoardNoticeModifyProAction();
		}else if(command.equals("board_notice_delete")) {
			action = new BoardNoticeDeleteAction();
		}else if(command.equals("board_notice_delete_pro")) {
			action = new BoardNoticeDeleteProAction();
		}else if(command.equals("board_qna")) {
	         action = new BoardQnaListAction();
	      }else if(command.equals("board_qna_write")) {
	         action = new BoardQnaWriteAction();
	      }else if(command.equals("board_qna_write_pro")) {
	         action = new BoardQnaWriteProAction();
	      }else if(command.equals("board_qna_view")) {
	         action = new BoardQnaViewAction();
	      }else if(command.equals("board_qna_modify")) {
	         action = new BoardQnaModifyAction();
	      }else if(command.equals("board_qna_modify_pro")) {
	         action = new BoardQnaModifyProAction();
	      }else if(command.equals("board_qna_delete")) {
	         action = new BoardQnaDeleteAction();
	      }else if(command.equals("board_qna_delete_pro")) {
	         action = new BoardQnaDeleteProAction();
	      }else if(command.equals("board_qna_reply")) {
	         action = new BoardQnaReplyAction();
	      }else if(command.equals("board_qna_reply_pro")) {
	         action = new BoardQnaReplyProAction();
	      }      
		
		return action;
		
	}
}
