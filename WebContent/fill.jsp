<%@page import="java.sql.*" %>

<%!
String fname[];
String lname[];
String mobile;
String seats[];
int x;
%>

<%
fname=request.getParameterValues("firstname");
lname=request.getParameterValues("lastname");
mobile=request.getParameter("mobile");
seats=request.getParameterValues("seat");
String busno=request.getParameter("busno");
String date=request.getParameter("date");
String route=request.getParameter("route");
String user= (String) session.getAttribute("user");
int a=fname.length;





try
{
Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus-bus","root", "");

//Statement stmt=con.createStatement();
for(int i=0;i<a;i++)
{
	String sql="insert into transactions(bt_no, bt_date , bt_route , bt_seat , bt_fname , bt_lname , bt_mobile , bt_user) values(?,?,?,?,?,?,?,?)";

	PreparedStatement  ptmt = con.prepareStatement(sql);
	ptmt.setString(1, busno);
	ptmt.setString(2,date);
	ptmt.setString(3,route);
	ptmt.setString(4,seats[i]);
	ptmt.setString(5,fname[i]);
	ptmt.setString(6,lname[i]);
	ptmt.setString(7,mobile);
	ptmt.setString(8,user);
	x=ptmt.executeUpdate();
//String sql="insert into transactions(bt_no, bt_date , bt_route , bt_seat , bt_fname , bt_lname , bt_mobile) values('"+busno+"','"+date+"','"+route+"','"+seats[i]+"','"+fname[i]+"','"+lname[i]+"','"+mobile+"')";

 //x=stmt.executeUpdate(sql);
}
if(x>0)
{
	//out.println("inserted");
	RequestDispatcher rd=request.getRequestDispatcher("tickets.jsp");
	request.setAttribute("date",date);
    rd.forward(request, response);
}
con.close();

}

catch(Exception e)
{
	e.printStackTrace();
}
%>