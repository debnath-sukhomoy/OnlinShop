<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<%
String i_id=request.getParameter("i_id");
try{
Statement stmt=con.createStatement();
String q3="delete from onlineshop.item_det where i_id='"+i_id+"'";

int t=stmt.executeUpdate(q3);

if(t>0)
{
%>
<center><font color=green>Deleted Successfully</font></center>
<%@ include file="adminhome.html"%>
<%
}
else{
%>
<center><font color=red>Invalid item i.d</font></center>
<%@include file="delete.html"%>
<%
}
con.close();
}
catch(Exception e){}
%>