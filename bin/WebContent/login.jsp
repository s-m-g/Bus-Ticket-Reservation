
<html>
<head>
<link rel="stylesheet" href="login.css">
    <style>
    .header {
 
  padding: 10px; /* some padding */
  text-align: center; /* center the text */
  background: #1abc9c; /* green background */
  color: white; /* white text color */
  
  
  
}

/* Increase the font size of the <h1> element */
.header h1 {
  font-size: 40px;
}

.header a{
text-decoration:none;
color:white;
}
    
    </style>
</head>
<body>
<div class="header">
       <a href="about.jsp"> <h1>BUS-BUS</h1></a>
        <h2><b>A  Convenient way to plan your journey</b></h2>
        </div>
 
<div class="bg-img">
  <form action="validater.jsp" class="container" method="post">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <button type="submit" class="btn">Login</button>
  </form>
</div>

</body>


</html>