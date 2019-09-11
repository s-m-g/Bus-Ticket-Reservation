<%@ include file="header.jsp"%>
<%@ page import="java.sql.*"%>
<head>
<link rel="stylesheet" href="check.css">
</head>
<%
int i=0;
try
{

	   Class.forName("com.mysql.jdbc.Driver");
	   
	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");
	   
	   Statement stmt=con.createStatement();
	   String user=(String)session.getAttribute("user");
	   
	   String sql="Select bt_date,count(*) 'TotTkt' from transactions where bt_user ="+ "'"+user+"'" +" group by bt_date";
	   
	   ResultSet rs=stmt.executeQuery(sql);
	   while(rs.next())
		   
	   { 
		   %>
		   
		   <div class="card">
		   
		   <p class="title"> Date:<%= rs.getString(1)%></p>
		    <p class="title"> Total Ticket: <%= rs.getString(2)%></p>
		   
		  </div>
		   
		   
		   <%
		//   out.println(rs.getString(1));
		 //  out.println(rs.getString(2));
		 i=1;
		   
	   }
	   
	   if(i!=1)
	   {
		%>
		
		<h1 style="text-align:center;margin-top:100px;">You have not done a single journey yet !</h1>
		
		<%   
	   }
	   con.close();
	 
}
catch(Exception e)
{
	e.printStackTrace();
	
}
 %>