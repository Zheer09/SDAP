<%-- 
    Document   : viewProject
    Created on : Jan 7, 2022, 5:30:08 PM
    Author     : Zheer
--%>

<%@page import="Bean.update"%>
<%@page import="Bean.Profile"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.DBconnection"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Profile pr =(Profile)session.getAttribute("profile");
    update up = new update();
    int id=Integer.parseInt(request.getParameter("id"));

             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from projects where username='"+pr.getUsername()+"' and projectID='"+id+"' ";
             ResultSet rs = stm.executeQuery(query); %>
             
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./CSS/viewProject.css"> 
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
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
  <body><br><br><br><br>
      <div class="container">
          <div class="row mb-3">
              <%   
            while(rs.next())
            {
          %>
        <div  class="col-sm-4 mb-2">
            <div id="ProgressCard" style=" border-radius: 35px; " class="bg-primary p-4 text-white text-center"><span style="color: white" class="font-weight-semibold mr-2">Start Date: </span><%=rs.getString("projectDate")%></div>
        </div>
        <div class="col-sm-4 mb-2">
            <div id="ProgressCard"  style=" border-radius: 35px;" class="bg-primary p-4 text-white text-center"><span class="font-weight-semibold mr-2">Status: </span><%=rs.getString("projectStatus")%></div>
        </div>
        <div class="col-sm-4 mb-2">
            <div id="ProgressCard" style=" border-radius: 35px; " class="bg-primary p-4 text-white text-center"><span class="font-weight-semibold mr-2">Project Name: </span><%=rs.getString("projectTitle")%></div>
        </div>
         <%
             
             
             up.setId(rs.getString("projectID"));
             }
          %>
    </div>
          
          
      </div>
      <div class="container">
      <h3>Updates on the project</h3><hr>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<section class="timeline_area section_padding_130">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-8 col-lg-6">
                <!-- Section Heading-->
                <div class="section_heading text-center">
                    <div class="line"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <!-- Timeline Area-->
                <div class="apland-timeline-area">
                    <!-- Single Timeline Content-->
                    <%
             String query1 = "select * from projectUpdates where username='"+pr.getUsername()+"' and projectID='"+id+"' ";
             ResultSet rs1 = stm.executeQuery(query1); 
                    %>
                    
                    <%   
            while(rs1.next())
            {
          %>
                    <div class="single-timeline-area">
                        <div class="timeline-date wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">    
                        </div>
                        
                        <div class="row">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="single-timeline-content d-flex wow fadeInLeft" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInLeft;">
                                    
                                    <div class="timeline-text">
                                      <h6><%=rs1.getString("updateTitle")%></h6>
                                        <p><%=rs1.getString("updateDescription")%></p><br><p><%=rs1.getString("updateDate")%></p><p><%=rs1.getString("updateStatus")%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <%   
                      }
                    %>  
                
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> <br>
</div>

    <form action="updateProject?id=<%=up.getId()%>" method="post">

      <div class="container">
          <h4>Send updates to be changed</h4><hr>
      <div class="input-group mb-3">
          <span class="input-group-text">Title</span>
          <input name="title" id="title" type="text" class="form-control" placeholder="Title" aria-label="Username">
          
        <span class="input-group-text">Username</span>
        <input type="text" name="username" id="username" class="form-control" value="<%=pr.getUsername()%>" disabled placeholder="Username" aria-label="Username">
</div>
          
<div class="input-group">
    
  
    <textarea name="description" id="description" class="form-control" aria-label="With textarea"></textarea>
        </div><br>
          <button type="submit" class="btn btn-primary">Send</button>   
      </div><br><br>
      
      </form>
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
