<%-- 
    Document   : ClientView
    Created on : Jan 7, 2022, 3:46:04 PM
    Author     : Zheer
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Profile"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.PreparedStatement" %>

<% Profile pr =(Profile)session.getAttribute("profile");%>
 
<% String name = pr.getFullName();
   String email = pr.getUserEmail();
%>

          <%
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from projects where username='"+pr.getUsername()+"' ";
             ResultSet rs = stm.executeQuery(query); %>

             
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link rel="stylesheet" href="./CSS/ClientView.css">   
 
    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  </head>
  
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
            <a style="width: 150px" href="userProfile.jsp" class="btn btn-primary my-2">Profile</a>
            
            <form action="logout" method="post">
              <input style="width: 150px" type="submit" value="Logout" class="btn btn-danger my-2" ></input>
                </form>
             
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>

 <body> <br><br> <br><br>
      
     <section>
      <div class="container">
          <h1>Projects</h1>
          <a href="RequirementForm.jsp" class="btn btn-primary" type="submit">Add Projects</a>
          <a href="BookingAppointment.jsp"class="btn btn-primary" type="submit">Add Appointment</a>
          <hr>
   <br>
   
             <%   
            while(rs.next())
            {
          %>
        <div class="card text-center">
  <div class="card-header">
    <%=rs.getString("projectStatus")%>
  </div>
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("projectTitle")%></h5>
    <p class="card-text"><%=rs.getString("projectDescription")%></p>
    <a href="viewProject.jsp?id=<%=rs.getString("projectID")%>" type="submit" class="btn btn-primary">Details</a>
  </div>
  
</div>
   <%   } %>
</div>  
        
          
          
</div> 
         
  <%  
             String query1 = "select * from bookingappointment where username='"+pr.getUsername()+"'";
             ResultSet rs1 = stm.executeQuery(query1);
             
             %>
</section>
      <section>
          <div class="container"><br>
          <h1>Appointments</h1><hr>
<br>

<%   
            while(rs1.next())
            {
          %>
<div class="card">
  <div class="card-header">
    <%=rs1.getString("bookingStatus")%>
  </div>
  <div class="card-body">
    <h5 class="card-title"><%=rs1.getString("name")%></h5>
    <p class="card-text"><%=rs1.getString("bookingDiscription")%></p>
    <a type="button" class="btn btn-primary">Details</a>
    <a href="bookingappointment?id=<%=rs1.getString("idbookingappointment")%>&type=Remove" type="button" class="btn btn-danger">Cancel</a>
  </div>
</div>
          
     <%   
         }
          %>     
</div> 
</section>

<!--    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>

