
<%@page import="java.sql.*" %>

<% 

String name=request.getParameter("name");
String email=request.getParameter("email");
String psw=request.getParameter("psw");

try
{
   //load driver
Class.forName("com.mysql.jdbc.Driver");

//create connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");

//create statement
//Statement stmt=con.createStatement();

//create sql
//String or VARCHAR type has to go in single quotes so that the value of variable goes istead of the variable itself

String sql="insert into users(name, email, password) values(?,?,?)";

//run sql

PreparedStatement ptmt=con.prepareStatement(sql);
ptmt.setString(1,name);
ptmt.setString(2,email);
ptmt.setString(3,psw);

//int i = stmt.executeUpdate(sql);
int i=ptmt.executeUpdate();


if(i>0)
{
	//out.println("inserted");
	RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
    rd.forward(request, response);
}

//close connection
con.close();

}

catch(Exception e)
{
e.printStackTrace();
}
%>