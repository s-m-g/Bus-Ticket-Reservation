<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<head>
<link rel="stylesheet" href="book.css">
</head>

<%

String busno=request.getParameter("busno");
String route=request.getParameter("route");
String date=request.getParameter("date");
%>

<%!
int total_seat=0; 
int occupied_seat=0;
int seats[];

%>

<h1>Please select your seats</h1>


<form action="details.jsp">
<input type="hidden" name="busno" value="<%= busno%>">
<input type="hidden" name="route" value="<%= route%>">
<input type="hidden" name="date" value="<%= date%>">
<div style="margin-left:200px;float:left">

    
 	  <div style="margin-left:200px;float:left;">
 	  

<% 
try
{
	Class.forName("com.mysql.jdbc.Driver");

	//create connection
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");
	
	Statement stmt1 = con.createStatement();
	
	String sql1="select b_ts from bus where b_no="+"'"+busno+"'";
	ResultSet rs1=stmt1.executeQuery(sql1);
	rs1.next();
	
	
	 total_seat=Integer.parseInt(rs1.getString(1));
	 %>
	 <h3>Total Seats:<%=total_seat %></h3>
	 <%
	 //out.println("total seat="+rs1.getString(1));
	
	
	
	  Statement stmt2=con.createStatement();
	  String sql2="select count(*) from transactions where bt_no="+"'"+busno+"'"+"and bt_route="+ "'"+route+"'"+"and bt_date=" + "'"+date+"'";
	  
	  ResultSet rs2=stmt2.executeQuery(sql2);
	  rs2.next();
	  %>
		 <h3>Occupied Seats:<%=occupied_seat %></h3>
		 <%
	  //out.println("occupied seat="+rs2.getString(1));
	  
	  
	  
	  
	  
	  // this if will worl only when some seats are already filled 
	  
	  if(Integer.parseInt(rs2.getString(1))>0)
	  {
		 
		  occupied_seat=Integer.parseInt(rs2.getString(1));
		 seats=new int[Integer.parseInt(rs2.getString(1))];
		
//create statement
  Statement stmt=con.createStatement();	
	
	String sql="select bt_seat from transactions where bt_no="+"'"+busno+"'"+"and bt_date="+"'"+date+"'"+"and bt_route="+"'"+route+"'";
	
	ResultSet rs=stmt.executeQuery(sql);
   // out.println("array");
    int i=0;
	while(rs.next())
	{
		seats[i]=Integer.parseInt(rs.getString(1));
		 //out.println("inside array");
		i++;
		
	}
    Arrays.sort(seats);
    //out.println("sorted");
    
    
    int j=0;
    int x=0;
		    for(int k=1;k<=total_seat;k++)
		    {
    	
    	
				    	if(k==seats[j])
				    	{
				    		
				    		if(j<occupied_seat)
				    	
				    			  {//out.println("value of k to be hideen="+k);
				    					%>
				    	
										    	<label class="container"><%=k %>
										  <input type="checkbox" name="seat" value="<%=k %>" disabled>
										
										  <span class="checkmark" style="background-color:black;"></span>
										</label>
										    	<%
											    	        x++;
											    	if(x<seats.length)
											    	{
											    		j++;
											    	}  
				    		
				   				  }
				    		
				    		
				    	}
				    	
				    	
				    	else
				    		
				    		
				    	{//out.println("value of k to be shown="+k);
							    	%>
							    <label class="container"><%=k %>
							  <input type="checkbox" name="seat" value="<%=k %>">
							
							  <span class="checkmark"></span>
							</label>
									<%
				    	}
				

   			 }//end of for
    
    
    
    
	  }        //end of if statement
	  
	  
	  
	//this else will only work when no seats are already reserved
	  else
	  {
		  for(int k=1;k<=total_seat;k++)
		  {
			  %>
		  <label class="container"><%=k %>
		  <input type="checkbox" name="seat" value="<%=k %>">

		  <span class="checkmark"></span>
		</label>
		<%
		  }
		 
		  
		  
	  }




  con.close();
  
  
}  //end of try


catch(Exception e)
{
	e.printStackTrace();

}
%>
<input style="right:100px;bottom:100px;position:absolute; padding:20px;border-radius:50%;" type="submit" value="submit">

</div>

</div>
</form>









