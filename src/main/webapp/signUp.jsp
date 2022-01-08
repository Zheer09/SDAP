<%-- 
    Document   : signUp
    Created on : Jan 7, 2022, 5:26:56 PM
    Author     : Zheer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
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
  
                                <form class="position-absolute top-50 start-50 translate-middle">
                                    <h3 class="h4 font-weight-bold text-theme">Sign Up</h3><br>
                                
                                <p>Enter the required information to sign up to the website</p>
                                 <div class="form-group">
                                        <label for="InputName">Name</label>
                                        <input type="text" class="form-control" id="inputName">
                                    </div>
                                    <div class="form-group">
                                        <label for="InputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="inputEmail">
                                    </div>
                                    <div class="form-group mb-5">
                                        <label for="InputPassword1">Password</label>
                                        <input type="password" class="form-control" id="inputPassword1">
                                    </div>
                                    <button type="button" class="btn btn-primary">Sign Up</button>
                                     <p class="text-muted text-center mt-3 mb-0">Already have an account? <a href="login.jsp" class="text-primary ml-1">login</a></p>
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
