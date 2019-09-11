<%@ include file="header.jsp" %>
<%
String name=request.getParameter("name");

String age=request.getParameter("age");

String mobile=request.getParameter("mobile");
String seat=request.getParameter("seat");

%>
<link rel="stylesheet" href="print.css">
<div class="card">
  
 <h1 style="text-align:center"> Ticket</h1>
  <p class="title">Name:<%= name %></p>
  <p>Age:<%=age %></p>
    <p>Seat No.:<%=seat %></p>
  
 
</div>