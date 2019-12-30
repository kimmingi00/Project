package controller.member;

import service.Action;
import service.member.UnregitEmailCheakAction;

public class UnregitActionFactory {
private static UnregitActionFactory instance=new UnregitActionFactory();
	
	private UnregitActionFactory() {
		super();
	}
	public static UnregitActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action=null;
		if(command.contentEquals("unregit_emailcheck")) {
			action=new UnregitEmailCheakAction();
		}
		
		return action;
	}
	
}
