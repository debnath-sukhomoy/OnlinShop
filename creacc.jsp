<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>
<% 
String u_id=request.getParameter("u_id");
String pwd=request.getParameter("pwd");
String f_name=request.getParameter("f_name");
String m_name=request.getParameter("m_name");
String l_name=request.getParameter("l_name");
String email=request.getParameter("email");
String p_no=request.getParameter("p_no");
String addr=request.getParameter("addr");

try{
PreparedStatement stmt=con.prepareStatement("select * from onlineshop.user_os where u_id='"+u_id+"'");
ResultSet rs=stmt.executeQuery();

if(rs.next())
{
%>
<center><font color=red>this id is already taken...try another!!!</font></center>
<%@include file="createacc.html"%>
<%
}
else{
	PreparedStatement pst=con.prepareStatement("insert into onlineshop.user_os values('"+u_id+"','"+pwd+"','"+f_name+"','"+m_name+"','"+l_name+"','"+email+"','"+p_no+"','"+addr+"')");

int t=pst.executeUpdate();


if(t>0)
{
%>
<center><font color=green>Account created...login and enjoy</font></center>
<%@include file="userlogin.html"%>
<%
}
}
con.close();
}
catch(Exception e)
{out.println(e);}
%>