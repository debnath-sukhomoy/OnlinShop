<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%@include file="uhome_menu.html"%>

<%

	String s_key=request.getParameter("cat_srch");
	String s="select";
	if(s_key.equals(s))
	{response.sendRedirect("userhome.jsp");}
	
try{
	Statement stmt=con.createStatement();
	String q="select * from onlineshop.item_det where category like '%"+s_key+"%'";

	ResultSet rs=stmt.executeQuery(q);
	int flag=0;
%>
<center>

<table>
<tr>
<%
	while(rs.next())
	{
%>

	<td><%	out.println("<br>"+rs.getString(2));	
			out.println("<br><img src="+rs.getString(4)+" height=200 width=200></img>");	
			out.println("<br>Rs."+rs.getString(5));	
			%>
<a href=add2cart.jsp>		Add to Cart</a>
			
		<%
		flag++;	%>
	</td>
<%
	if(flag%3==0)
	{
%>
		</tr>
		<tr>
<%	
	}
	}con.close();
	}
	catch(Exception e)
	{ out.println(e);	}
%>
</center>
