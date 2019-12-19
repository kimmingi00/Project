package controller.index;

import service.Action;
import service.index.IndexAction;


public class IndexActionFactory {
private static IndexActionFactory instance=new IndexActionFactory();
	
	private IndexActionFactory() {
		super();
	}
	public static IndexActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action=null;
		if(command.contentEquals("index")) {
			action=new IndexAction();
		}
		
		return action;
	}
	
}
