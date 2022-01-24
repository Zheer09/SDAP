/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Bean.Profile;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bestz
 */
public class projectcontroller extends HttpServlet {
    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , ClassNotFoundException, SQLException {
         
       
     }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        
        Connection con = DBconnection.createConnection();
        PreparedStatement pres;
        
        int id=Integer.parseInt(request.getParameter("id"));
        
        if(type.equals("Remove")){
        try {
        String query = "DELETE FROM projects WHERE projectID=?";
        pres = con.prepareStatement(query);
        pres.setInt(1, id);

        int i =  pres.executeUpdate();

            if (i!=0){
                
            id = 0;
            RequestDispatcher dis = request.getRequestDispatcher("AdminView.jsp");
            dis.forward(request, response);
            }

        } catch(SQLException e)
         {
            e.printStackTrace();
         } 
        }
      
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        
        HttpSession session=request.getSession(); 
        Profile user =(Profile)session.getAttribute("profile");
        String title = request.getParameter("Title");
        String budget = request.getParameter("Budget");
        String date1 = request.getParameter("date");
        String type = request.getParameter("type");
        String description = request.getParameter("discription");
        

        
        

            //session.setAttribute("profile", user);
        Connection con = DBconnection.createConnection();
        PreparedStatement pres;
        
        if(title != null){
        try {
        String query = "insert into projects(projectTitle,projectType,projectDescription,projectBudget,projectDate,projectStatus,username) VALUE (?,?,?,?,?,?,?)";
        pres = con.prepareStatement(query);
        pres.setString(1, title);
        pres.setString(2, type);
        pres.setString(3, description);
        pres.setString(4, budget);
        pres.setString(5, date1);   
        pres.setString(6, "Pending");
        pres.setString(7, user.getUsername());

        int i =  pres.executeUpdate();

            if (i!=0){
            RequestDispatcher dis = request.getRequestDispatcher("ClientView.jsp");
            dis.forward(request, response);
            }

        } catch(SQLException e)
         {
            e.printStackTrace();
         } 
        }
          
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
