<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%@include file="uhome_menu.html"%>

<%
try{
	String i_id=request.getParameter("i_id");
	String u_id=(String)session.getAttribute("u_id");
	String o_id=u_id.concat(i_id);
	java.util.Date dt=new java.util.Date();
	String o_date=String.valueOf(dt);
	String pic=request.getParameter("pic");
	int qt=0,t=-1;
	out.println("\ttrial #1");
	PreparedStatement pst=con.prepareStatement("select qty from onlineshop.order_det where i_id='"+i_id+"' and u_id='"+u_id+"'");
	ResultSet rs=pst.executeQuery();
	out.println("\ttrial #2");
	
	if(rs.next())
	{out.println("\ttrial #3");
		qt=rs.getInt(1);
		qt=qt+1;
		PreparedStatement pst1=con.prepareStatement("update onlineshop.order_det set cart=1, qty='"+qt+"' where i_id='"+i_id+"' and u_id='"+u_id+"'");
		t=pst1.executeUpdate();	
		
		out.println("\ttrial #4");
	}
	else
	{out.println("\ttrial #5");
		PreparedStatement stmt=con.prepareStatement("insert into onlineshop.order_det values('"+o_id+"', '"+u_id+"', '"+i_id+"', '"+o_date+"', 1, 0, '"+pic+"',1,1)");
		t=stmt.executeUpdate();
		out.println("\ttrial #6");
	}
	
	
	
	if(t>0)
	{out.println("\ttrial #7");%><center><font color=red> <h1> 
		Item added to cart...	</h1></font>
		<a href=userhome.jsp>continue...</a></center>
	<%

	}out.println("\ttrial #8");

con.close();
}catch(Exception e) {out.println(e);}
out.println("\ttrial #9");
%>
