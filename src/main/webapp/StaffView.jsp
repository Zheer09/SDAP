<%-- 
    Document   : StaffView
    Created on : Jan 7, 2022, 3:46:22 PM
    Author     : Zheer
--%>


<%@page import="Bean.staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.DBconnection"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Bean.Profile"%>


<% staff pr =(staff)session.getAttribute("staff");%>
<%
        Profile uid=(Profile)session.getAttribute("user");

        //redirect user to home page if already logged in
        if(uid!=null){

            if(uid.getUserRole().equals("admin")){
                response.sendRedirect("AdminView.jsp");
            }else if(uid.getUserRole().equals("client")){
                response.sendRedirect("ClientView.jsp");
            }
            
          
        }
 

        %>
 
<% String name = pr.getUsername();
%>

          <%
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from projects ";
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
              <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Setting</a><br>
              <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>
  <body> <br><br><br><br>
      
     
      <div class="container">
          <h2><%=name%>'s Projects</h2><hr>
          
     <%   
            while(rs.next())
            {
          %>      
   <div class="card text-center">
  <div class="card-header">
    <%=rs.getString("projectStatus")%>
  </div>
  <div class="card-body">
    <h5 class="card-title"> <%=rs.getString("projectTitle")%></h5>
    <p class="card-text"><%=rs.getString("projectDescription")%></p>
    <a href="StaffEdit.jsp?id=<%=rs.getString("projectID")%>" class="btn btn-primary">Details</a>
  </div>
  <div class="card-footer text-muted">
  </div>
</div>
          
  <%   
      }
          %>          
</div> 


<!--    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
  </body>
</html>