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
		}
		/*if(command.equals("board_list")) {
			action = new BoardListAction();
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		}else if(command.equals("board_write_pro")) {
			action = new BoardWriteProAction();
		}else if(command.equals("board_view")) {
			action = new BoardViewAction();
		}else if(command.equals("board_modify")) {
			action = new BoardModifyAction();
		}else if(command.equals("board_modify_pro")) {
			action = new BoardModifyProAction();
		}else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();
		}else if(command.equals("board_delete_pro")) {
			action = new BoardDeleteProAction();
		}else if(command.equals("practice")) {
			action = new PracticeAction();
		}else if(command.equals("picture_list")) {
			action = new PictureListAction();
		}else if(command.equals("pictureView_list")) {
			action = new pictureListViewAction();
		}else if(command.equals("board_reply")) {
			action = new BoardReplyAction();
		}else if(command.equals("board_replyPro")) {
			action = new BoardReplyProAction();
		}else if(command.equals("board_notice")) {
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
		}*/
		
		return action;
		
	}
}
