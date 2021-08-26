

<%@include file="connect.jsp"%>

<%
String aid=request.getParameter("aid");
String pwd=request.getParameter("pwd");

try
{
	Statement stmt=con.createStatement();
	String q1="select * from onlineshop.admin_os where A_ID='"+aid+"' and PASSWORD='"+pwd+"'";
	ResultSet rs=stmt.executeQuery(q1);

	if(rs.next())
	{
		session.setAttribute("aid",aid);
		response.sendRedirect("adminhome.html");
	}
	else
	{
%>

<center><h1><font color=red>Invalid AdminID or Password</font>

<%@include file="adminlogin.html" %>

<%
	 }
	 con.close();
}
catch(Exception e){}
%>