/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Bean.Profile;
import Controller.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import sun.rmi.server.Dispatcher;

/**
 *
 * @author bestz
 */
public class signUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , ClassNotFoundException, SQLException {
         
         String fullName = request.getParameter("fullname");
         String email = request.getParameter("email");
         String userName = request.getParameter("username");
         String password = request.getParameter("password");
         
         Profile user = new Profile();
        //Using Java Beans - An easiest way to play with group of related data
         user.setFullName(fullName);
         user.setUserEmail(email);
         user.setUsername(userName);
         user.setUserRole("client");


         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBconnection.createConnection();
             String query = "insert into userAccount(fullName,userEmail,userName,password,userRole) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, user.getFullName());
             preparedStatement.setString(2, user.getUserEmail());
             preparedStatement.setString(3, user.getUsername());
             preparedStatement.setString(4, password);
             preparedStatement.setString(5, user.getUserRole());
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0){
            HttpSession session=request.getSession(); 
            session.setAttribute("profile", user);
            RequestDispatcher dis = request.getRequestDispatcher("ClientView.jsp");
            dis.forward(request, response);
         }
        }
         catch(SQLException e)
         {
            e.printStackTrace();
         } 

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         try {
        processRequest(request, response);
        } catch (ClassNotFoundException ex){
           // Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE), null, ex);
        } catch (SQLException ex) {
           // Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
        processRequest(request, response);
        } catch (ClassNotFoundException ex){
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
