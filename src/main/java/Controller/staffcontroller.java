/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class staffcontroller extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        staff sta = new staff();
        
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String password = request.getParameter("password");
        String jobTitle = request.getParameter("type");
        
        
        
        sta.setFirst_Name(firstname);
        sta.setLast_Name(lastname);
        sta.setStaffEmail(email);
        sta.setStaffJobTitle(jobTitle);
        sta.setUsername(username);
        sta.setPhoneNumber(PhoneNumber);
        sta.setPassword(password);
        
        
         Connection con = null;
         PreparedStatement preparedStatement = null;  
         
         
         PreparedStatement pres;
         
         if(username != null){
         try
         {
             
             con = DBconnection.createConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("select StaffEmail from staff where StaffEmail = '"+email+"'");
             if (!rs.next()){             

             String query = "insert into staff(First_Name,Last_Name,StaffEmail,StaffJobTitles,StaffUsername,password,StaffSalary,StaffPhone) values (?,?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, sta.getFirst_Name());
             preparedStatement.setString(2, sta.getLast_Name());
             preparedStatement.setString(3, sta.getStaffEmail());
             preparedStatement.setString(4, sta.getStaffJobTitle());
             preparedStatement.setString(5, sta.getUsername());
             preparedStatement.setString(6, sta.getPassword());
             preparedStatement.setInt(7, 0);
             preparedStatement.setString(8, sta.getPhoneNumber());
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0){
                 
                HttpSession session=request.getSession(); 
                session.setAttribute("staff", sta);
                
                RequestDispatcher dis = request.getRequestDispatcher("StaffView.jsp");
                dis.forward(request, response);
                
                    }
         }
         else{
                 
            request.setAttribute("exist", "This email has been registered");          
            RequestDispatcher dis = request.getRequestDispatcher("signUp.jsp");
            dis.forward(request, response);
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
        processRequest(request, response);
        
        Connection con = null;
        PreparedStatement pres;
        
        String typebtn = request.getParameter("typebtn");
        
         int id=Integer.parseInt(request.getParameter("id")); 
             
         if(typebtn.equals("Delete")){    
          try {
            con = DBconnection.createConnection();
            String query = "DELETE FROM staff WHERE staffid=?";
            pres = con.prepareStatement(query);
            pres.setInt(1, id);

            int i =  pres.executeUpdate();

                if (i!=0){

                id = 0;
                request.setAttribute("deleted", "The account has been deleted");  
                RequestDispatcher dis = request.getRequestDispatcher("employeeList.jsp");
                dis.forward(request, response);
                }

            } 
              catch(SQLException e)
             {
                e.printStackTrace();
             }

            }
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
