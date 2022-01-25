<%-- 
    Document   : employeeList
    Created on : Jan 23, 2022, 11:12:11 PM
    Author     : Lawand
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Controller.DBconnection"%>
<%@page import="Controller.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

  <%
             Connection con = DBconnection.createConnection();
             Statement stm = con.createStatement();
             String query = "select * from staff ";
             ResultSet rs = stm.executeQuery(query); %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <style>

.circle {
     display:block;
     align-content: center;
       text-align: center;
        background: lightblue;
        border-radius: 50%;
        width: 50px;
        height: 50px;
    }

    </style>
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
            <a style="width: 150px" href="DisplaySetting.jsp" class="btn btn-primary my-2">Setting</a>
             
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>
  <body>
      <br><br><br><br>
      
     <section>
      <div class="container">
          <h1>Employee List</h1><hr>
   
     <table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Email</th>     
      <th scope="col">Job Titles</th>
      <th scope="col">Salary</th>
      <th scope="col">Username</th>
      <th scope="col">Phone Number</th>
      
       <th scope="col">#</th>
    </tr>
  </thead>
  
  <tbody>
    <%   
            while(rs.next())
            {
          %>   
    <tr>
      <th scope="row"><%=rs.getString("staffid")%></th>
      <td><%=rs.getString("First_Name")%></td>
      <td><%=rs.getString("Last_Name")%></td>
      <td><%=rs.getString("StaffEmail")%></td>
      <td><%=rs.getString("StaffJobTitles")%></td>
      <td><%=rs.getString("StaffSalary")%></td>
      <td><%=rs.getString("StaffUsername")%></td>
      <td><%=rs.getString("StaffPhone")%></td>
      
      <td>
          <a href="staffcontroller?id=<%=rs.getString("staffid")%>&typebtn=Info" value="Info" type="submit" class="btn btn-primary">Info</a>
          <a href="staffcontroller?id=<%=rs.getString("staffid")%>&typebtn=Delete" value="Delete" type="submit" class="btn btn-danger">Delete</a>
      
      </td>
      
    </tr>
    
    <%   
        }
          %> 
  </tbody>
</table>
  
  <c:if test="${not empty deleted}">
       <div class="alert alert-dismissable alert-success"> 
            <strong>${deleted}</strong>
             </div>
           </c:if>
  
      </div>
  
</div>
      </section>
  
  <br><br><br>
       <section>
      <div class="container">
          <h1>Client List</h1><hr>
   
     <table class="table">
  <thead>
    <tr>
      <th scope="col">Username</th>
      <th scope="col">fullName</th>
      <th scope="col">Email</th>     
       <th scope="col">#</th>
    </tr>
  </thead>
  
  <% 
      String query1 = "select * from useraccount where userRole='client'";
             ResultSet rs1 = stm.executeQuery(query1); %>
  <tbody>
    <%   
            while(rs1.next())
            {
          %>   
    <tr>
      <th scope="row"><%=rs1.getString("username")%></th>
      <td><%=rs1.getString("fullName")%></td>
      <td><%=rs1.getString("userEmail")%></td>
      <td>
          <a href="staffcontroller?username=<%=rs1.getString("username")%>&typebtnClient=Info" value="Info" type="submit" class="btn btn-primary">Info</a>
          <a href="staffcontroller?username=<%=rs1.getString("username")%>&typebtnClient=Delete" value="Delete" type="submit" class="btn btn-danger">Delete</a>
      
      </td>
      
    </tr>
    
    <%   
        }
          %> 
  </tbody>
</table>
  
  <c:if test="${not empty deleted}">
       <div class="alert alert-dismissable alert-success"> 
            <strong>${deleted}</strong>
             </div>
           </c:if>
  
      </div>
  
</div>
      </section>
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