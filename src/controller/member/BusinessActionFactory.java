package controller.member;


import service.Action;
import service.member.BusinessEmailCheakAction;
import service.member.BusinessIdCheckAction;
import service.member.BusinessLoginProAction;
import service.member.BusinessWriteAction;
import service.member.BusinessWriteProAction;


public class BusinessActionFactory {
private static BusinessActionFactory instance=new BusinessActionFactory();
	
	private BusinessActionFactory() {
		super();
	}
	public static BusinessActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action=null;
		if(command.contentEquals("business_write")) {
			action=new BusinessWriteAction();
		}else if(command.contentEquals("business_write_pro")) {
			action=new BusinessWriteProAction();
				
		}else if(command.contentEquals("business_email")) {
			action=new BusinessEmailCheakAction();
		}else if(command.contentEquals("business_idCheck")) {
			action=new BusinessIdCheckAction();
		}else if(command.contentEquals("business_login_pro")) {
			action=new BusinessLoginProAction();
		}
		
		/*if(command.equals("business_list")) {
			action=new businessListAction();	
		}else if(command.equals("business_insert")){
			action=new businessWriteAction();
		}else if(command.equals("business_insert_pro")){
			action=new businessWriteProAction();
		}else if(command.equals("business_id_check")){
			action=new businessIdCheckAction();	
		}else if(command.equals("business_email_check")){
			action=new businessEmailCheakAction();
		}else if(command.equals("business_login")){
			action=new businessLoginAction();	
		}else if(command.equals("business_view")){
			action=new businessViewAction();
		}else if(command.equals("business_modify")){
			action=new businessModifyAction();
		}else if(command.equals("business_modify_pro")){
			action=new businessModifyProAction();
		}else if(command.equals("business_delete")){
			action=new businessDeleteAction();
		}else if(command.equals("business_delete_pro")){
			action=new businessDeleteProAction();
			}*/
		
		return action;
	
	
}
}