/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

/**
 *
 * @author bestz
 */
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBconnection {
 public static Connection createConnection()
 {
     Connection con = null;
     String url = "jdbc:mysql://sql5.freesqldatabase.com:3306/sql5467284?"; //MySQL URL followed by the database name
     String username = "sql5467284"; //MySQL username
     String password = "TDPgjmkpY2"; //MySQL password      
     try
     {
         try
         {
            Class.forName("com.mysql.cj.jdbc.Driver"); //loading MySQL drivers. This differs for database servers 
         } 
         catch (ClassNotFoundException e)
         {
            e.printStackTrace();
         }       
         con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
         System.out.println("Printing connection object "+con);
     } 
     catch (Exception e) 
     {
        e.printStackTrace();
     }   
     return con; 
 }
}