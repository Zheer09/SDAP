<%-- 
    Document   : signUpStaff
    Created on : Jan 24, 2022, 2:41:09 PM
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

        
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <title>Hello, world!</title>
  </head>
   <body>
      
       <form class="position-absolute top-50 start-50 translate-middle" action="staffcontroller" method="POST">
           <h3 class="h4 font-weight-bold text-theme">Sign up for staff</h3><hr>
                                
                                <p>Enter the required information to sign up to the website as staff</p>
                                <div class="form-group">
                                        <label for="InputName">First Name</label>
                                        <input type="text" class="form-control" name="firstname" id="firstname">
                                    </div>
                                <div class="form-group">
                                        <label for="InputName">Last Name</label>
                                        <input type="text" class="form-control" name="lastname" id="lastname">
                                    </div>
                                 <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" name="username" id="username">
                                    </div>
                                    <div class="form-group">
                                        <label for="InputEmail1">Email address</label>
                                        <input type="email" class="form-control" name="email" id="email">
                                    </div>
                                <div class="form-group">
                                        <label for="InputPassword1">Phone Numbers</label>
                                        <input type="number" class="form-control" name="PhoneNumber" id="PhoneNumber">
                                    </div>
                                    <div class="form-group">
                                        <label for="InputPassword1">Password</label>
                                        <input type="password" class="form-control" name="password" id="password">
                                    </div>
                                 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" >Type of job</label>
                                        <select id="type" name="type" class="form-control">
                                            <option value="Front-End">Front-End</option>
                                            <option value="Back-End">Back-End</option>
                                            <option value="DevOps Engineer">DevOps Engineer</option>
                                            <option value="Operation Engineer">Operation Engineer</option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                 <div class="form-group">
                                        <button id="signUpBtn" type="submit" class="btn btn-primary">Sign Up</button>
                                     <p class="text-muted text-center mt-3 mb-0">Already have an account? <a href="login.jsp" class="text-primary ml-1">login</a></p>
                                    </div>
                                   
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
