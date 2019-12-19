package controller.message;

import service.Action;
import service.message.MsgDeleteAction;
import service.message.MsgListAction;
import service.message.MsgSendAction;
import service.message.MsgSendProAction;
import service.message.MsgViewAction;

public class MessageActionFactory {
	private static MessageActionFactory instance = new MessageActionFactory();
	
	private MessageActionFactory() {
		super();
	}
	
	public static MessageActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		
		if(command.equals("MyMsgList")) {
			action = new MsgListAction();
		}else if(command.equals("MsgSend")) {
			action = new MsgSendAction();
		}else if(command.equals("MsgSendPro")) {
			action = new MsgSendProAction();
		}else if(command.equals("MsgView")) {
			action = new MsgViewAction();
		}else if(command.equals("MsgDelete")) {
			action = new MsgDeleteAction();
		}
		
		/* 
		 * 
		 */
		
		return action;
	}
}
