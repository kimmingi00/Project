<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="controller.reserv.*" %>
<%@ include file="/Contents/include_file(navi bar)/navigation_bar.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<section class="ok">
		<form name="fm" method="post" action="ReservServlet?command=Reserv_unregit">
			
		</form>
		
	</section>
<style>
	
	section {background-color:#fff; font-color:black; margin-left: 184px; }
	
	p {margin-bottom:20px;}
	
	.btn {margin-bottom:20px; background-color:#07c; color:white; 
		border-color: #07c;
    	border-width: 1px;
    	border-style: solid;
    	font-size: 17px;
    	font-weight: 400;
    	text-align: center;
    	white-space: nowrap;
    	line-height: 1.17648;
	    min-width: 28px;
	    padding-left: 16px;
	    padding-right: 16px;
	    padding-top: 8px;
	    padding-bottom: 8px;
	    border-radius: 18px;
	    background: #0071e3;
		}
	
</style>


</body>





</html>