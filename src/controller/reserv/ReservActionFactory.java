package controller.reserv;

import service.Action;
import service.reserv.MyProductListAction;

public class ReservActionFactory {
	private static ReservActionFactory instance = new ReservActionFactory();
	
	private ReservActionFactory() {
		super();
	}
	
	public static ReservActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("")) {
			action = new MyProductListAction();
		}
		
		/* 
		 * 
		 */
		
		return action;
	}
	
	
	
	
}
