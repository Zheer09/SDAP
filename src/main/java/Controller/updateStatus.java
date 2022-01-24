/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zheer
 */
public class updateStatus extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String projectStatus = request.getParameter("projectStatus");
        String updateStatus = request.getParameter("updateStatus");
        

        int id=Integer.parseInt(request.getParameter("id"));
        
        int id1=Integer.parseInt(request.getParameter("id1"));
        
        Connection con = DBconnection.createConnection();
        PreparedStatement pres;
        
        if(projectStatus != null){
        try {
        String query = "UPDATE projects SET projectStatus='"+projectStatus+"' WHERE projectID=?";
        pres = con.prepareStatement(query);
        pres.setInt(1, id);

        int i =  pres.executeUpdate();

            if (i!=0){
            request.setAttribute("ProUpdated", "The Project Status has been updatetd");
            RequestDispatcher dis = request.getRequestDispatcher("StaffEdit.jsp");
            dis.forward(request, response);
            }

        } catch(SQLException e)
         {
            e.printStackTrace();
         } 
        }
        
        if(updateStatus != null){
        try {
        String query = "UPDATE projectUpdates SET updateStatus='"+updateStatus+"' WHERE projectID=? and idprojectUpdates=?";
        pres = con.prepareStatement(query);
        pres.setInt(1, id);
        pres.setInt(2, id1);

        int i =  pres.executeUpdate();

            if (i!=0){
            request.setAttribute("Updated", "The Request Update Status has been updatetd");
            RequestDispatcher dis = request.getRequestDispatcher("StaffEdit.jsp");
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
