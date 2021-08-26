<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%
String i_id=request.getParameter("i_id");

try{
Statement stmt=con.createStatement();
String q4="select * from onlineshop.item_det where i_id='"+i_id+"'";

ResultSet rs=stmt.executeQuery(q4);
if(rs.next())
{
out.println("<br>Item i.d :"+rs.getString(1));
out.println("<br>Model name :"+rs.getString(2));
out.println("<br>Quantity :"+rs.getString(3));
out.println("<br>Price :"+rs.getString(5));
out.println("<br>Picture :<img src="+rs.getString(4)+" height=200 width=200></img>");
%>
<body><center>
<form action=adminhome.html method=post>
<input type=submit value="Back to Home">
</form></center></body>
<%
}
else{
%>
<center><font color=red>Wrong item i.d...</font></center>
<%@include file="fetch.html"%>
<%
}
con.close();
}
catch(Exception e){}
%>