/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import Bean.Profile;
import java.io.IOException;
import Controller.DBconnection;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caesar
 * 
 */

public class LoginCheck extends HttpServlet {
    
    public LoginCheck(){
        
    }

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // inputPassword, inputEmail
        String userN=request.getParameter("inputEmail");
        String pass=request.getParameter("inputPassword");
        //PrintWriter out = response.getWriter();
                
                try{
                    
           Connection con=DBconnection.createConnection();
           Statement stmt = con.createStatement();
           String sql;
           sql = "SELECT * FROM userAccount where userEmail = '"+userN+"' and password = '"+pass+"'; ";
           ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next() == false) {
                
                 
       
                out.print("<p style='color: red; text-align:center'>Invalid username or password. Please try again...</p>");
                
            //RequestDispatcher req=request.getRequestDispatcher("login.jsp");
            RequestDispatcher req = request.getRequestDispatcher("/login.jsp");
    
            //System.out.print(rs);
             
             req.include(request, response);
             
             
                } else {
                

                     //statement(s)
                     // save user to session
                     Profile user = new Profile();
                     user.setFullName(rs.getString("fullName"));
                     user.setUserEmail(rs.getString("userEmail"));
                     HttpSession session=request.getSession(); 
                     session.setAttribute("profile", user);
                     //response.sendRedirect("ClientView.jsp");
                     //RequestDispatcher req=request.getRequestDispatcher("ClientView.jsp");
                     System.out.print("success!!!!");
                     RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/ClientView.jsp");
                     
            requestDispatcher.forward(request, response);
                        
                     

                    
               
           }

            }catch(Exception e){System.out.println(e);}  
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
    }

    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
