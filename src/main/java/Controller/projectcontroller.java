/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bestz
 */
public class projectcontroller extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     
        String title = request.getParameter("Title");
        String budget = request.getParameter("Budget");
        String date1 = request.getParameter("Date");
        String type = request.getParameter("type");
        String discription = request.getParameter("discription");

          Date date;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
        } catch (ParseException ex) {
            Logger.getLogger(projectcontroller.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        try {
        Connection con = DBconnection.createConnection();
        String query = "insert into projects(projectTitle,projectType,projectDescription,projectBudget,projectDate) VALUE (?,?,?,?,?)";
        PreparedStatement pres;
        pres = null;
        pres = con.prepareStatement(query);
        pres.setDate(index, new java.sql.Date(date.getTime()));
        
        } catch(SQLException e)
         {
            e.printStackTrace();
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
