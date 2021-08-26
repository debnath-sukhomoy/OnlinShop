<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%@include file="uhome_menu.html"%>

<%

	try
	{
		String u_id=(String)session.getAttribute("u_id");
		
		PreparedStatement pst1=con.prepareStatement("select * from onlineshop.order_det, onlineshop.item_det where cart=1 and onlineshop.order_det.u_id='"+u_id+"' and onlineshop.order_det.i_id=onlineshop.item_det.i_id");
		ResultSet rs1=pst1.executeQuery();
		int flag=0;
%>
<center>
<table>
<tr>
<%
		
		while(rs1.next())
		{
%>

	<td><%	
			out.println("<br>"+rs1.getString(11));	
			out.println("<br><img src="+rs1.getString(7)+" height=200 width=200></img>");	
			out.println("<br>Rs."+rs1.getString(14)+" per item");
			out.println("<br>Quantity in Cart: "+rs1.getString(8));%>
			<form action=buy.jsp method=get>
			<input type=hidden name=o_id value=<%=rs1.getString(1)%>>
			<input type=hidden name=price value=<%=rs1.getString(14)%>>
			<input type=submit value="Proceed to Buy"></form>
			
			<form action=removecart.jsp method=get>
			<input type=hidden name=o_id value=<%=rs1.getString(1)%>>
			<input type=submit value="Remove from Cart"></form>
						
		<%flag++;	%>
	</td>
<%
			if(flag%3==0)
			{
%>
		</tr>
		<tr>
<%	
			}
		}
		if(flag==0)
		{%>
			<pre><h2>		
			
Your Cart is empty...
									
Let's go... Get some Shopping...<a href=userhome.jsp>Go to Home</a>
			
			</h2></pre>
			
		<%}

		con.close();
	}
	catch(Exception e)
	{ out.println(e);	}
%>
</center></body>



