<%-- 
    Document   : BookingAppointment
    Created on : Jan 7, 2022, 4:14:02 PM
    Author     : Zheer
--%>

<%@page import="Bean.Profile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./CSS/BookingAppointment.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
             <form action="logout" method="post">
                 <a style="width: 150px" href="userProfile.jsp" class="btn btn-primary my-2">Profile</a><br>
              <input style="width: 150px" type="submit" value="Logout" class="btn btn-danger my-2" ></input>
                </form>
             
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>
  <body>
 
      <% Profile pr =(Profile)session.getAttribute("profile");%>  
      
      <% String name = pr.getFullName();
         String email = pr.getUserEmail();
        %>
      
     <body>
     <div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
                           
            <div id="formPos" class="container"> <br><br>
                <h2>Book an Appointment</h2><br>
                <form action="bookingappointment" method="post">
                            <!-- Form start -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Name</label>
                                        <input id="name" name="name" type="text" placeholder="Name" value="<%=name%>" disabled class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="subject">Subject</label>
                                        <input id="subject" name="subject" type="text" placeholder="Subject"  class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Preferred Date</label>
                                        <input id="date" name="date" type="date" placeholder="Preferred Date" class="form-control input-md" required>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time">Available Time</label>
                                        <select id="time" name="time" class="form-control"> 
                                            <option value="8:00 to 9:00">8:00 to 9:00</option>
                                            <option value="9:00 to 10:00">9:00 to 10:00</option>
                                            <option value="10:00 to 1:00">10:00 to 1:00</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Email</label>
                                        <input id="email" name="email" type="text" placeholder="Email" value="<%=email%>" disabled class="form-control input-md">
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="discription">Appointment For</label>
                                        <input id="discription" name="discription" type="text" placeholder="Discription" class="form-control input-md" required>
                                    </div>
                                </div> 
                                <!-- Button -->
                                
                                <c:if test="${not empty notvalid}">
                                      <div class="alert alert-dismissable alert-danger"> 
                                        <strong>${notvalid}</strong>
                                      </div>
                                   </c:if>
                                      
                                      <c:if test="${not empty valid}">
                                      <div class="alert alert-dismissable alert-success"> 
                                        <strong>${valid}</strong>
                                      </div>
                                   </c:if>
                                      
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <br> <button id="singlebutton" name="singlebutton" class="btn btn-primary">Make An Appointment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                                </div>
                        <!-- form end -->
         </div>
    </div>
         </div>
</body>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>