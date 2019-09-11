<%@ include file="header.jsp" %>
<%!String seats[]; %>
<%
seats=request.getParameterValues("seat");
String busno=request.getParameter("busno");
String route=request.getParameter("route");
String date=request.getParameter("date");
%>
<h1>Enter Details:</h1>

<h2>Bus No: <%=busno %></h2>
<h2>Route: <%=route %></h2>
<h2>Date: <%=date %></h2>

<% 
if(seats!=null)
{%>
	<form action="fill.jsp" method="get">
	<input type="hidden" name="busno" value="<%=busno %>">
	<input type="hidden" name="route" value="<%=route %>">
	<input type="hidden" name="date" value="<%=date %>">
	
	<div style="background-color:#1abc9c;">
	<label for="mobile"><b>Mobile Number</b></label>
<input style="margin-top:20px;" type="number" name="mobile" required >
	<% 
for(int i=0;i<seats.length;i++)
{%>

<h3 style="margin-top:50px;">Seat No:<% out.println(seats[i]) ;%></h3>
<label for="firstname"><b> First Name</b></label>
<input type="text" name="firstname" required>

<label for="lastname"><b>Last Name</b></label>
<input type="text" name="lastname" required>


<input type="hidden" name="seat" value="<%=seats[i]%>">
	

<%
}
%>
</div>


<input style="right:100px;bottom:10px;position:absolute; padding:20px; border-radius:50%; background-color:#111;color:white;"type="submit"  >
</form>
<% 
}
else
{
	out.println("No seats selected , Please go back and select a seat !");
}
%>



