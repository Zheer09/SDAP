<%-- 
    Document   : AdminView
    Created on : Jan 7, 2022, 3:46:11 PM
    Author     : Zheer
--%>
<%@page import="Bean.Profile"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <% Profile pr =(Profile)session.getAttribute("profile");
 
    String name = pr.getFullName();
   String email = pr.getUserEmail();

        
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from useraccount ";
             ResultSet rs = stm.executeQuery(query); 
 
    if(!pr.getUserRole().equals("admin"))
    {
        
        response.sendRedirect("ClientView.jsp");
    }
 
 %>
 
 
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="stylesheet" href="./CSS/ClientView.css">   
 
    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    body{
        padding-left: 40px;
        padding-right:  40px;
    }
    hr.new1 {
  border-top: 4px solid blue;
}
</style>
  </head>
  <body>

   <% 
   
             String query1 = "select * from bookingappointment ";
             ResultSet rs1 = stm.executeQuery(query1); 
   %>          
<header>
  <nav class="navbar navbar-light bg-light fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Software Development & Design</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Software Development & Design</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div  class="offcanvas-body">
        <ul  class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li  class="nav-item">
              <a  style="width: 150px" href="ClientView.jsp" class="btn btn-primary my-2">Home</a> <br>
              <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Setting</a><br>
              
              <form action="logout" method="post">
              <input style="width: 150px" type="submit" value="Logout" class="btn btn-danger my-2" ></input>
                </form>
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>

<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Admin Control</h1>
        
        <p>
         <div class="btn-group" role="group" aria-label="Basic outlined example">
  
             <button type="button" class="btn btn-outline-primary"><a href="adminProject.jsp">Projects</a></button> 
             <button type="button" class="btn btn-outline-primary"><a href="employeeList.jsp">Employee List</a></button>
</div>
        </p>
      </div>
    </div> 
      <h1>Appointment Requests</h1>
      <hr class="new1">
    

  </section>
              <%   
            while(rs1.next())
            {
          %>
    <form action="bookingappointment" method="post">
    <div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
      
      <div class="card-body">
        <h5 class="card-title">Appointment with <%=name%></h5>
        <p class="card-text"><%=rs1.getString("bookingDiscription")%></p>
        <h6>requested for <time><%=rs1.getString("bookingTime")%></time> on <time><%=rs1.getString("bookingDate")%></time></h6> 
      </div>
    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
        <button type="button" name="accept" value="accept" class="btn btn-success">Accept</button>
        <button type="button" name="decline" value="decline" class="btn btn-danger">Decline</button>
            </div>
         </div>
        </div>
    </form>
    
    <%  
    }
%>
</main>



<!--    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>
