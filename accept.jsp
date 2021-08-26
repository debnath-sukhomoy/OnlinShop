<%@include file="connect.jsp"%>
<%@page import="java.sql.*"%>
<%
	String oid=request.getParameter("oid");
	String qt=request.getParameter("qt");
	String iid=request.getParameter("iid");
	try{
	
	PreparedStatement pst=con.prepareStatement("update order_det set acc=1 where o_id='"+oid+"'");
	PreparedStatement pst1=con.prepareStatement("update item_det set qty=qty-'"+qt+"' where i_id='"+iid+"'");
        int t=pst.executeUpdate();
	int t1=pst1.executeUpdate(); 
	if(t>0 && t1>0){out.println("sdvsgs");
	response.sendRedirect("req.jsp");
	}
	}
	catch(Exception e){
	out.println(e);
	}
%>