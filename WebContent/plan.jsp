<%@include file="header.jsp" %>

<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="login.css">


</head>
<body>

<div class="bg-img">

  <form action="check.jsp" class="container" method="post">
    <h1>
 <p>Let's Go:</p>   
     </h1>

    <label for="date"><b>Date</b></label>
    <input  id="datefield" type="date"  name="date"  min='2019-07-05' required>

 
   
   <%
   
   try{
	   
	   Class.forName("com.mysql.jdbc.Driver");
	   
	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");
	   
	   Statement stmt=con.createStatement();
	   String sql="select stname from stations";
	   ResultSet rs=stmt.executeQuery(sql);
	   %>
	   <label for="from"><b>From</b></label>
	   <select name="from">
	   <%
	   while(rs.next())
	   {
		   %>
		   <option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
		   
		   <%
	   }
	   
	   rs.beforeFirst();
	   
	   %>
	   </select>
	   <label for="to"><b>To</b></label>
	      <select name="to">
	      <%
	       while(rs.next())
	   {
		   %>
		   <option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
		   
		   <%
	   }
	 
	      %>
	</select>

	   
	   <%
	   
	   con.close();
	   
   }
   catch(Exception e)
   {
		e.printStackTrace();
   }
   
   
   
   
   
   
   
   %>
   
  
 

    
 
    <button type="submit" class="btn">Search Buses</button>
  </form>
</div>
<script>

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("datefield").setAttribute("min", today)

</script>
</body>


</html>