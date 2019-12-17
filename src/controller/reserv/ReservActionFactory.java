package controller.reserv;

import service.Action;
import service.reserv.MyProductListAction;
import service.reserv.ProductUploadAction;
import service.reserv.ProductUploadProAction;

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
		
		if(command.equals("MyTourList")) {
			action = new MyProductListAction();
		}else if(command.equals("ProductUpload")) {
			action = new ProductUploadAction();
		}else if(command.equals("ProductUploadPro")) {
			action = new ProductUploadProAction();
		}
		
		/* 
		 * 
		 */
		
		return action;
	}
	
	
	
	
}
