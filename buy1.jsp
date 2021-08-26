<%@include file="connect.jsp"%>
<%@page import="java.sql.*"%>

<%
try{
String oid=request.getParameter("o_id");
    String qt=request.getParameter("Qty");
PreparedStatement stmt=con.prepareStatement("update onlineshop.order_det set ordered=1 , cart=0, acc=0  where o_id='"+oid+"'");
int t=stmt.executeUpdate();
if(t>0){
out.println("Item Ordered Successfully...");
}
%>
<a href=userhome.jsp>Go to Home</a>
<%

con.close();
}
catch(Exception e)
{out.println(e);
}
%>