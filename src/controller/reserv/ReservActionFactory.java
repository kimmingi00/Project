package controller.reserv;

import service.Action;
import service.reserv.MyProductListAction;
import service.reserv.ProductDeleteAction;
import service.reserv.ProductModifyAction;
import service.reserv.ProductModifyProAction;
import service.reserv.ProductUploadAction;
import service.reserv.ProductUploadProAction;
import service.reserv.ProductViewAction;
import service.reserv.ReservMainAction;
import service.reserv.ReservOKAction;
import service.reserv.ReservRegitAction;
import service.reserv.ReservUnregitAction;
import service.reserv.ReservUnregitProAction;
import service.reserv.ReservViewAction;
import service.reserv.UploadMainAction;

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
		}else if(command.equals("ProductView")) {
			action = new ProductViewAction();
		}else if(command.equals("ProductModify")) {
			action = new ProductModifyAction();
		}else if(command.equals("ProductModifyPro")) {
			action = new ProductModifyProAction();
		}else if(command.equals("ProductDelete")) {
			action = new ProductDeleteAction();
		}else if(command.equals("upload_main")) {
			action = new UploadMainAction();
		}else if(command.equals("reserv_main")) {
			action = new ReservMainAction();
		}else if(command.equals("reserv_view")) {
			action = new ReservViewAction();
		}else if(command.equals("reserv_regit")) {
			action = new ReservRegitAction();
		}else if(command.equals("reserv_Unregit")) {
			action = new ReservUnregitAction();
		}else if(command.equals("reserv_ok")) {
			action = new ReservOKAction();
		}else if(command.equals("Reserv_Unregit_pro")) {
			action = new ReservUnregitProAction();
		}
		
		/* 
		 * 
		 */
		
		return action;
	}
	
	
	
	
}
