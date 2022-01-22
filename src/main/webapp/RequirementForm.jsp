<%-- 
    Document   : addingPorject
    Created on : Jan 9, 2022, 4:40:23 PM
    Author     : Lawand
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.DBconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Bean.Profile" %>
<!doctype html>
<html lang="en">
  <head> 
 
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
    <title>Hello, world!</title>
  </head>

  <body>

<% Profile pr =(Profile)session.getAttribute("profile");%>
 
<% String name = pr.getFullName();
   String email = pr.getUserEmail();
%>

      <div class="position-absolute top-50 start-50 translate-middle">
 <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Application form for adding project</h2>
                            <h5>Please enter the details of you services that you want to be created!</h5><br>
                        </div>
                        <form action="projectcontroller" method="post">
                            <!-- Form start -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Name</label>
                                        <input id="name" name="name" type="text" value="<%=name%>" disabled class="form-control input-md">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Project Title</label>
                                        <input id="Title" name="Title" type="text" placeholder="Title" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Email</label>
                                        <input id="email" name="email" type="text" value="<%=email%>" disabled class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Release Date</label>
                                        <input id="date" name="date" type="date" placeholder="Preferred Date" class="form-control input-md">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Project Budget</label>
                                        <input id="Budget" name="Budget" type="number" placeholder="Enter Budget in $" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time">Type of project</label>
                                        <select id="time" name="type" class="form-control">
                                            <option value="Mobile">Mobile</option>
                                            <option value="Website">Website</option>
                                            <option value="Database">Database</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="appointmentfor">Project Description</label>
                                        <input id="discription" name="discription" type="text" placeholder="Discription" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">Send Application</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- form end -->
                    </div>
                </div>
             </div>  
                  

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