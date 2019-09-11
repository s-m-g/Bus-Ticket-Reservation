<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="welcome.css">
</head>

<%
String email=request.getParameter("email");
%>
<body>
 <!-- <h2>Welcome<%=email %></h2> -->
<a href="plan.jsp">
<div class="o-1">
<p>Plan Your Journey</p>
</div>
</a>

<a href="recent.jsp">
<div class="o-2">
<p>Recent Journeys</p>
</div>
</a>
<%
		if (session != null)
		{
			if (session.getAttribute("user") != null)
			{
				String name = (String) session.getAttribute("user");
			
				
				%>
				
			 	<div class="o-3">
				<h2>Welcome :<%=name %></h2>
				</div> 
			<%
			
			}
			else {
				
				response.sendRedirect("login.jsp");
			}
		}

	%>



</body>


</html>









	