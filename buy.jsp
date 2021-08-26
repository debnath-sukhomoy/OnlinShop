<%@include file="connect.jsp"%>
<%@page import="java.sql.*"%>
<%@include file="uhome_menu.html"%>
<%
try
{
	String oid=request.getParameter("o_id");
	String price=request.getParameter("price");

	PreparedStatement pst=con.prepareStatement("select * from order_det,user_os where order_det.u_id=user_os.u_id and o_id='"+oid+"'");
	ResultSet rs=pst.executeQuery();

	if(rs.next())
	{

		String iid=rs.getString(3);
		String uid=rs.getString(2);
		int qty=rs.getInt(8);
		String addr=rs.getString(16);
		String pic=rs.getString(7);

		out.println("<br>"+rs.getString(3));	
		out.println("<br><img src="+rs.getString(7)+" height=200 width=200></img>");	
		out.println("<br>Rs."+price+" per item");
		out.println("<br>User id. :"+uid);
		out.println("<br>Order Address: "+addr);
%>

<form action=buy1.jsp method=post>
Quantity <select name=Qty>
<option>Select</option>
<%
	
		PreparedStatement pst1=con.prepareStatement("select qty from onlineshop.item_det where i_id='"+iid+"'");
		ResultSet rs1=pst1.executeQuery();
		if(rs1.next())
		{
			int s=rs1.getInt(1);
			for (int i=1;i<=s;i++)
			{
			
%>
<option value=<%=i%>><%=i%></option>
<%
			}
		}			
%>
</select>

<input type=hidden name=o_id value=<%=oid%>>
<input type=submit value=Order>
</form>




<%
	}

con.close();
}
catch(Exception e) {out.println(e);}
%>


