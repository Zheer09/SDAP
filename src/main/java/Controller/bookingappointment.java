/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Controller.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Zheer
 */
public class bookingappointment extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            HttpSession session=request.getSession(); 
            Profile user =(Profile)session.getAttribute("profile");
     
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String discription = request.getParameter("discription");
            
            Connection con = null;
            PreparedStatement preparedStatement = null;   
         
            try
         {
             con = DBconnection.createConnection();
             Statement stmt = con.createStatement();
             
             String query = "insert into bookingappointment(username,bookingDate,bookingTime,bookingDiscription,name,bookingEmaill,bookingStatus) values (?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            
             preparedStatement.setString(1, user.getUsername());
             preparedStatement.setString(2, date);
             preparedStatement.setString(3, time);
             preparedStatement.setString(4, discription);
             preparedStatement.setString(5, user.getFullName());
             preparedStatement.setString(6, user.getUserEmail());
             preparedStatement.setString(7, "Pending");
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0){
            session.setAttribute("profile", user);
            RequestDispatcher dis = request.getRequestDispatcher("ClientView.jsp");
            dis.forward(request, response);
                    }
         
         else{
            RequestDispatcher dis = request.getRequestDispatcher("signUp.jsp");
            dis.include(request, response);
            out.print("<p style='text-align:center; color: red'>This email has been registered</p>");
            }
        }
         catch(SQLException e)
         {
            e.printStackTrace();
         }
            

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


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
