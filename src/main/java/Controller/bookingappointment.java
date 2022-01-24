/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Profile;
import Bean.appointment;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Zheer
 */
public class bookingappointment extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException , ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            HttpSession session=request.getSession(); 
            Profile user =(Profile)session.getAttribute("profile");
            
            
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String discription = request.getParameter("discription");
            String subject = request.getParameter("subject");
            String type = request.getParameter("type");
            
            Connection con = null;
            PreparedStatement preparedStatement = null;   
            
            
             appointment book= new appointment(); 
             
             book.setDate(date);
             book.setDiscription(discription);
             book.setSubject(subject);
             book.setTime(time);
             
             
//             Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(date);  
//             Date date22 = new SimpleDateFormat("HH:mm").parse(time);
             
             
             
             
             con = DBconnection.createConnection();
             Statement stmt = con.createStatement();
             
             PreparedStatement pres;
              
         if(subject != null){
            try
         {          
             
             ResultSet rs = stmt.executeQuery("select * from bookingappointment where bookingDate='"+book.getDate()+"' AND bookingTime='"+book.getTime()+"'");
             
             if(!rs.next()){
             
             String query = "insert into bookingappointment(username,bookingDate,bookingTime,bookingDiscription,name,bookingEmaill,bookingStatus,bookingSubject) values (?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            
             preparedStatement.setString(1, user.getUsername());
             preparedStatement.setString(2, book.getDate());
             preparedStatement.setString(3, book.getTime());
             preparedStatement.setString(4, book.getDiscription());
             preparedStatement.setString(5, user.getFullName());
             preparedStatement.setString(6, user.getUserEmail());
             preparedStatement.setString(7, "Pending");
             preparedStatement.setString(8, book.getSubject());
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0){
            session.setAttribute("profile", user);
            request.setAttribute("valid", "The date has been booked");
            RequestDispatcher dis = request.getRequestDispatcher("BookingAppointment.jsp");
            dis.forward(request, response);
                    }
             }
         else{
            request.setAttribute("notvalid", "The date or time not available");
            RequestDispatcher dis = request.getRequestDispatcher("BookingAppointment.jsp");
            dis.forward(request, response);
            
            }
        } 
         catch(SQLException e)
         {
            e.printStackTrace();
         }
         }
         
         
         int id=Integer.parseInt(request.getParameter("id"));
         
          if(type.equals("Remove")){
             
             try {
            String query = "DELETE FROM bookingappointment WHERE idbookingappointment=?";
            pres = con.prepareStatement(query);
            pres.setInt(1, id);

            int i =  pres.executeUpdate();

                if (i!=0){
                RequestDispatcher dis = request.getRequestDispatcher("AdminView.jsp");
                dis.forward(request, response);
                id = 0;
                }

            } catch(SQLException e)
             {
                e.printStackTrace();
             } 
         
         }
          
          else if(type.equals("Accept")){
          
               try {
            String query = "UPDATE bookingappointment SET bookingStatus='Accepted' WHERE idbookingappointment=?";
            pres = con.prepareStatement(query);
            pres.setInt(1, id);

            int i =  pres.executeUpdate();

                if (i!=0){
                RequestDispatcher dis = request.getRequestDispatcher("AdminView.jsp");
                dis.forward(request, response);
                id = 0;
                }

            } catch(SQLException e)
             {
                e.printStackTrace();
             } 
          
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
        } catch (ParseException ex) {
            Logger.getLogger(bookingappointment.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(bookingappointment.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
