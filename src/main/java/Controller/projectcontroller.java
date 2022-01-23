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
  HttpSession session=request.getSession(); 
     Profile user =(Profile)session.getAttribute("profile");
        String title = request.getParameter("Title");
        String budget = request.getParameter("Budget");
        String date1 = request.getParameter("date");
        String type = request.getParameter("type");
        String description = request.getParameter("discription");

            //session.setAttribute("profile", user);
       
        try {
        Connection con = DBconnection.createConnection();
        DateFormat formatter ;
        formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date=formatter.parse(request.getParameter("date"));
        
        String query = "insert into projects(projectTitle,projectType,projectDescription,projectBudget,projectDate,projectStatus,userEmail) VALUE (?,?,?,?,?,?,?)";
        PreparedStatement pres;
        pres = con.prepareStatement(query);
        pres.setString(1, title);
        pres.setString(2, type);
        pres.setString(3, description);
        pres.setString(4, budget);
        pres.setString(5, date1);
        pres.setString(6, "pending");
        pres.setString(7, user.getUserEmail());

        int i =  pres.executeUpdate();

            if (i!=0){
            RequestDispatcher dis = request.getRequestDispatcher("ClientView.jsp");
            dis.forward(request, response);
            }

        } catch(SQLException e)
         {
            e.printStackTrace();
         } catch (ParseException ex) { 
            Logger.getLogger(projectcontroller.class.getName()).log(Level.SEVERE, null, ex);
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
