<%-- 
    Document   : adminProject
    Created on : Jan 22, 2022, 7:30:05 PM
    Author     : Lawand
--%>

<%@page import="Controller.DBconnection"%>
<%@page import="Bean.Profile"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<% Profile pr =(Profile)session.getAttribute("profile");%>
 
<% String name = pr.getFullName();
   String email = pr.getUserEmail();
%>

          <%
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from projects";
             ResultSet rs = stm.executeQuery(query); %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <link rel="stylesheet" href="./CSS/AdminProject.css">   
    <title>Hello, world!</title>
  </head>
  <style>
      
      .card{
          align-content: center;
          width: 1300px;
           margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
      }
      
      
  </style>
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
              <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>
  <body>
      <br>  <br>  <br>
      
        <%   
            while(rs.next())
            {
          %>
        
<div class="card text-center">
  
  <div class="card-body">
    <h5 class="card-title"><%=rs.getString("projectTitle")%></h5>
    
    <p class="card-text"><%=rs.getString("projectDescription")%></p>

    <a type="submit" value="Details"  name="details" class="btn btn-primary" href="projectcontroller?id=<%=rs.getString("projectID")%>&type=Details">Details</a>
    <a type="submit" value="Remove"  name="remove" class="btn btn-danger" href="projectcontroller?id=<%=rs.getString("projectID")%>&type=Remove">Remove</a>
    
  </div>
  <div class="card-footer text-success">
    <%=rs.getString("projectStatus")%>
  </div>
</div>
        <br>  
        
          <%   
              }
          %>
     
        
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>