<%-- 
    Document   : userProfile
    Created on : Jan 24, 2022, 1:43:59 PM
    Author     : Lawand
--%>

<%@page import="Bean.Profile"%>
<%@page import="Bean.staff"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Profile pr =(Profile)session.getAttribute("profile");
staff st = (staff)session.getAttribute("staff");
%>

          <%
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             ResultSet rs = null;
             
             if(pr.getUserRole().equals("client")){
             String query = "select * from useraccount where userRole = 'client' and username  = '"+pr.getUsername()+"'  ";
             rs = stm.executeQuery(query); 
             }else if(pr.getUserRole().equals("admin")){
                 String query = "select * from useraccount where userRole = 'admin' and username  = '"+pr.getUsername()+"'  ";
             rs = stm.executeQuery(query); 
             }else if(pr.getUserRole().equals("staff")){
                 String query = "select * from staff where username  = '"+ st.getUsername()+"'  ";
             rs = stm.executeQuery(query); 
             }else{
                 response.sendRedirect("index.jsp");
             }
             
             
          %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="./CSS/userProfile.css">   
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Profile</title>
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
              <a  style="width: 150px" href="index.jsp" class="btn btn-primary my-2">Home</a> <br>
           <!-- <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Setting</a> -->
             
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>
  <body><br><br> <br><br> 
    <div class="container">
    <div class="main-body">
 <div class="row gutters-sm">
     <%
         while(rs.next() )
            {  
                
       %> 
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <div class="mt-3">
                        <h4><% String fn = "";
                            if(!pr.getUserRole().equals("staff")){
                            fn = rs.getString("fullName"); }
                        else {
                            fn = rs.getString("First_Name") + " " + rs.getString("Last_Name");
                        } %> <%= fn %></h4>
                      <p class="text-secondary mb-1"><%= rs.getString("userRole")  %></p>
                      <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
                    </div>
                  </div> 
              </div>
                
            </div>
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= fn  %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <% String em = "";
                            if(!pr.getUserRole().equals("staff")){
                            em = rs.getString("userEmail"); }
                        else {
                            em = rs.getString("StaffEmail");
                        } %> <%= em %>
                     
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      (239) 816-9029
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Salary</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      4300$
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Address</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      Bay Area, San Francisco, CA
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                     <!-- <a class="btn btn-primary">Edit</a> --> 
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>
    </div>
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
