
<%@page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String pass=request.getParameter("psw");


int i=0;
try
{
   //load driver
Class.forName("com.mysql.jdbc.Driver");

//create connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");

//create statement
Statement stmt=con.createStatement();

//create sql


String sql="select password from users where email ="+"'"+email+"'";

//run sql
ResultSet rs=stmt.executeQuery(sql); 
while(rs.next())

{ 
	
if((rs.getString(1)).equals(pass))
{
	i=1;
	               session = request.getSession();

	session.setAttribute("user", email);
	//session.setMaxInactiveInterval(30); // 30 seconds
response.sendRedirect("welcome.jsp");
	//RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
	//rd.forward(request,response);
	
 	
}

}

if(i!=1)
{%>

<div class="correct">
<p>Please enter the correct details !!</p>
</div>
<a href="register.jsp" style="text-decoration:none">
<div class="correct1">
<p>Register Yourself here</p>
</div>
</a>
	<% 
	 
	 RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	rd.include(request,response);
	
}







//next() is method of resultset and checks whether there is a data in the set or not


//close connection
con.close();

}

catch(Exception e)
{
e.printStackTrace();
}
%>

