<%@include file="header.jsp"%>
<%@ page import="java.sql.*" %>

<head>
<style>




.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: 50px;
  text-align: center;
  font-family: arial;
  float:left;
  background-color:#1abc9c;
  color:white;
  padding:30px;
}

</style>

</head>

<%

String date=(String)request.getAttribute("date");
String user=(String)session.getAttribute("user");

try
{
	 Class.forName("com.mysql.jdbc.Driver");
	   
	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");
	   
	   Statement stmt=con.createStatement();
	   
	   String sql="select * from transactions where bt_user="+"'"+user+"'"+"and bt_date="+"'"+date+"'";
	   
	   ResultSet rs=stmt.executeQuery(sql);
	   %>
	   
	   <h1>Here are your tickets::</h1>
	   <%
	   while(rs.next())
	   {
		   %>
		   

<div class="card">
<p>Date:<%=date %></p>
<p><%=rs.getString(2) %></p>
		   <p>Route : <%=rs.getString(4) %></p>
		   <p>Seat No. : <%=rs.getString(5) %></p>
		   
		   <p>Name : <%=rs.getString(6) %> <%=rs.getString(7) %></p>
		  

</div>
		   
		   
		   
		   
		   <%
		   
	   }
	   request.removeAttribute("date");
	   con.close();
	
}

catch(Exception e)
{
	e.printStackTrace();
}

%>
