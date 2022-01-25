/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import Bean.Profile;
import Bean.staff;
import java.io.IOException;
import Controller.DBconnection;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Set;
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
        String userN=request.getParameter("inputEmail");
        String pass=request.getParameter("inputPassword");
        String type = request.getParameter("type");
        
        
        if(type.equals("Client")){
                try{  
           Connection con=DBconnection.createConnection();
           Statement stmt = con.createStatement();
           String sql;
           sql = "SELECT * FROM useraccount where userEmail = '"+userN+"' and password = '"+pass+"'; ";
           ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next() == false) {
                
            request.setAttribute("invalid", "Invalid username or password. Please try again...");
            RequestDispatcher req = request.getRequestDispatcher("/login.jsp");
            req.forward(request, response);
             
             
                }
            else {
                     Profile user = new Profile();
                     user.setUsername(rs.getString("username"));
                     user.setFullName(rs.getString("fullName"));
                     user.setUserEmail(rs.getString("userEmail"));
                     user.setUserRole(rs.getString("userRole"));
                     HttpSession session=request.getSession(); 
                     session.setAttribute("profile", user);
                     //response.sendRedirect("ClientView.jsp");
                     //RequestDispatcher req=request.getRequestDispatcher("ClientView.jsp");
                     System.out.print("success!!!!");
                     
                     if(rs.getString("userRole").equals("client"))
                     {
                     RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ClientView.jsp");
                      requestDispatcher.forward(request, response);
                     }
                     
                     else{
                      RequestDispatcher requestDispatcher = request.getRequestDispatcher("/AdminView.jsp");
                      requestDispatcher.forward(request, response);
                     }
           
  
           }

            }catch(Exception e){System.out.println(e);}  
                
        }
        else if(type.equals("Staff")){
        
             try{  
           Connection con=DBconnection.createConnection();
           Statement stmt = con.createStatement();
           String sql;
           sql = "SELECT * FROM staff where StaffEmail = '"+userN+"' and password = '"+pass+"'; ";
           ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next() == false) {
                
            request.setAttribute("invalid", "Invalid username or password. Please try again...");
            RequestDispatcher req = request.getRequestDispatcher("/login.jsp");
            req.forward(request, response);
             
             
                }
            else {
                     staff user = new staff();
                     
                     user.setUsername(rs.getString("StaffUsername"));
                     user.setStaffEmail(rs.getString("StaffEmail"));
                     
                     
                     HttpSession session=request.getSession(); 
                     session.setAttribute("staff", user);
                     
                     
                      RequestDispatcher requestDispatcher = request.getRequestDispatcher("/StaffView.jsp");
                      requestDispatcher.forward(request, response);
                    
           
  
           }

            }catch(Exception e){System.out.println(e);}  
        
        }
        
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
