/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Zheer
 */
public class updateProject extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session=request.getSession(); 
            Profile pr =(Profile)session.getAttribute("profile");
            String title = request.getParameter("title");
            String username = request.getParameter("username");
            String description = request.getParameter("description");
            int id=Integer.parseInt(request.getParameter("id"));
            

            
             java.util.Date date = new java.util.Date();
             java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            
        Connection con = DBconnection.createConnection();
        PreparedStatement pres;
        
        if(title != null){
        try {
        String query = "insert into projectUpdates(projectid,updateTitle,username,updateDescription,updateStatus,updateDate) VALUE (?,?,?,?,?,?)";
        pres = con.prepareStatement(query);
        pres.setInt(1, id);
        pres.setString(2, title);
        pres.setString(3, pr.getUsername());
        pres.setString(4, description);
        pres.setString(5, "Pending");   
        pres.setString(6, sqlDate.toString()); 

        int i =  pres.executeUpdate();

            if (i!=0){
            RequestDispatcher dis = request.getRequestDispatcher("viewProject.jsp");
            dis.forward(request, response);
            }

        } catch(SQLException e)
         {
            e.printStackTrace();
         } 
        }
          
        
        }
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
