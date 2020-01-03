package controller.member;

import service.Action;
import service.member.AdminCsAction;
import service.member.DeleteOkAction;
import service.member.MemberAdminAction;
import service.member.MemberAdminDeleteAction;
import service.member.MemberAdminListAction;
import service.member.MemberAdminOkAction;
import service.member.MemberBmAction;
import service.member.MemberBmProAction;
import service.member.MemberConfirmAction;
import service.member.MemberCsAdminAction;
import service.member.MemberDeleteAction;
import service.member.MemberDeleteCheckAction;
import service.member.MemberDeleteProAction;
import service.member.MemberEmailCheakAction;
import service.member.MemberGiveAdminAction;
import service.member.MemberIdCheckAction;
import service.member.MemberIdSearchAction;
import service.member.MemberIdSearchProAction;
import service.member.MemberListAction;
import service.member.MemberLoginAction;
import service.member.MemberLoginProAction;
import service.member.MemberLogoutAction;
import service.member.MemberPassSearchAction;
import service.member.MemberPassSearchProAction;
import service.member.MemberShoppingAction;
import service.member.MemberThemeAction;
import service.member.MemberThemeProAction;
import service.member.MemberViewAction;
import service.member.MemberViewProAction;
import service.member.MemberWriteAction;
import service.member.MemberWriteProAction;
import service.member.UnregitDeleteAction;
import service.member.UnregitListAction;
import service.member.UnregitOkAction;

public class MemberActionFactory {
private static MemberActionFactory instance=new MemberActionFactory();
	
	private MemberActionFactory() {
		super();
	}
	public static MemberActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action=null;
		
		  if(command.contentEquals("member_write")) {
			action=new MemberWriteAction();
		}else if(command.contentEquals("member_write_pro")) {
			action=new MemberWriteProAction();
			
		}else if(command.contentEquals("member_email")) {
			action=new MemberEmailCheakAction();
		}else if(command.contentEquals("member_idCheck")) {
			action=new MemberIdCheckAction();
		}else if(command.contentEquals("member_login")) {
			action=new MemberLoginAction();
		}else if(command.contentEquals("member_login_pro")) {
			action=new MemberLoginProAction();
		}else if(command.contentEquals("member_confirm")) {
			action=new MemberConfirmAction();
		}else if(command.contentEquals("member_logout")) {
			action=new MemberLogoutAction();
		}else if("member_id_search".equals(command) ) {
			action=new MemberIdSearchAction();
		}else if("member_id_search_pro".equals(command)) {
			action=new MemberIdSearchProAction();
		} else if("member_pass_search".equals(command)) {
			action = new MemberPassSearchAction();
		} else if("member_pass_search_pro".equals(command)) {
			action = new MemberPassSearchProAction();
		}else if("member_theme".equals(command)) {
			action = new MemberThemeAction();
		}else if("member_theme_pro".equals(command)) {
			action = new MemberThemeProAction();
		}else if("member_view".equals(command)) {
			action = new MemberViewAction();
		}else if("member_view_pro".equals(command)) {
			action = new MemberViewProAction();	
		}else if("member_bm".equals(command)) {
			action = new MemberBmAction();	
		}else if("member_bm_pro".equals(command)) {
			action = new MemberBmProAction();	
		}else if("member_delete".equals(command)) {
			action = new MemberDeleteAction();
		}else if("member_delete_pro".equals(command)) {
			action = new MemberDeleteProAction();
		}else if("member_delete_check".equals(command)) {
			action = new MemberDeleteCheckAction();
		}else if("member_admin".equals(command)) {
			action = new MemberAdminAction();
		}else if("member_list".equals(command)) {
			action = new MemberListAction();
		}else if("member_admin_ok".equals(command)) {
			action = new MemberAdminOkAction();
		}else if("member_give_admin".equals(command)) {
			action = new MemberGiveAdminAction();
		}else if("delete_ok".equals(command)) {
			action = new DeleteOkAction();
		}else if("member_admin_delete".equals(command)) {
			action = new MemberAdminDeleteAction();
		}else if("member_shopping".equals(command)) {
			action = new MemberShoppingAction();
		}else if("member_delete_ok2".equals(command)) {
			action = new UnregitOkAction();	
		}else if("unregit_list".equals(command)) {
			action = new UnregitListAction();
		}else if("unregit_delete".equals(command)) {
			action = new UnregitDeleteAction();
		}
		else if("admin_list".equals(command)) {
			action = new MemberAdminListAction();
		}else if("admin_cs".equals(command)) {
			action = new MemberCsAdminAction();
		}else if("cs_ok".equals(command)) {
			action = new AdminCsAction();
		}	
		return action;
	}
	
}
