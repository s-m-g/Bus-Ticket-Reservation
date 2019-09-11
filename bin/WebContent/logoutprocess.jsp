<html>

<body>

        <%
       // out.println("thanq you!!, Your session was destroyed successfully!!");
		session = request.getSession(false);
		
		session.removeAttribute("user");
		//session.getMaxInactiveInterval();

          // session.invalidate();

        %>

        <h1><font color="Red">You are Successfully logged out...</font></h1>

      <p style="margin-top:20px;"> Click <a href="index.jsp">here</a> to login again</p>

    </body>

</html>