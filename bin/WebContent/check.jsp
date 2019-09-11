<%@ include file="header.jsp" %>
<%@page import="java.sql.*" %>
	<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="check.css">

</head>
<%
String date1=request.getParameter("date");
%>
<body>

<h2 style="text-align:center">Available Buses for :<%= date1 %></h2>


</h2>
<%
String from=request.getParameter("from");
String to=request.getParameter("to");
String route=from+"to"+to;
String route1=route.toUpperCase();

%>
<%! int i;
    int j;
    int count=0;
String a,b,c;
%>
<b><h2 style="text-align:center"><%= route1 %> </h2></b>
<%
try
{
   //load driver
Class.forName("com.mysql.jdbc.Driver");

//create connection
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");

//create statement
Statement stmt=con.createStatement();


//create sql


String sql="select * from bus where b_route ="+"'"+route+"'";

//run sql

ResultSet rs=stmt.executeQuery(sql); 
while(rs.next())

{ 
	
	a=rs.getString(1);
	
i=Integer.parseInt(rs.getString(4));



%>



<div class="card">
  
 <h1 style="text-align:center"> <%= rs.getString(1)%></h1>
  <p class="title"> Departure time: <%= rs.getString(3)%></p>
  <p>Total Seats : <%= rs.getString(4)%></p>
  
  
 <% 
  Statement stmt1=con.createStatement();
  String sql1="select count(*) from transactions where bt_no="+ " '"+a+"' "+"and bt_route="+ "'"+route1+"'"+"and bt_date=" + "'"+date1+"'";
  
  ResultSet rs1=stmt1.executeQuery(sql1);
  
  while(rs1.next())
  {
	 j=Integer.parseInt(rs1.getString(1));  
  }

 %>
    <p>Available Seats : <%= (i-j)%></p>
 
  <p><a href="book.jsp?busno=<%= rs.getString(1)%>&date=<%= date1%>&route=<%= route1 %> "><button>Book Now</button></a></p>
  
</div>

</body>
</html>
	
	
	
<%
count=1;
%>	

<%
}

if(count==0){
	%>
	<h1 >OOPS !!  No Buses found on this Route</h1>
<% 
             }
//close connection
con.close();

}

catch(Exception e)
{
e.printStackTrace();
}

%>

