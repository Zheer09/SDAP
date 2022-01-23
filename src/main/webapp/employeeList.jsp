<%-- 
    Document   : employeeList
    Created on : Jan 23, 2022, 11:12:11 PM
    Author     : Lawand
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

       <th scope="col">#</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Zheer</td>
      <td>Ardalan</td>
      <td>bestzheer@gmail.com</td>
      <td>DevOps</td>
      <td>2$</td>
      <td><button type="button" class="btn btn-primary">Info</button> <button type="button" class="btn btn-danger">Delete</button></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Siros</td>
      <td>Taib</td> 
      <td>sirostaib@gmail.com</td>
      <td>Backend Developer</td>
      <td>2000$</td>
     
      <td><button type="button" class="btn btn-primary">Info</button> <button type="button" class="btn btn-danger">Delete</button></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Lawand</td>
      <td>Hassan</td> 
      <td>lawandhassan@gmail.com</td>
      <td>Front-end Developer</td>
      <td>9999$</td>
     
      <td><button type="button" class="btn btn-primary">Info</button> <button type="button" class="btn btn-danger">Delete</button></td>
    </tr>
  </tbody>
</table>
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