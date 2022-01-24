/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Zheer
 */
public class staff {
    
    
    public staff(){
    
    }

    public String getFirst_Name() {
        return First_Name;
    }

    public void setFirst_Name(String First_Name) {
        this.First_Name = First_Name;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String Last_Name) {
        this.Last_Name = Last_Name;
    }

    public String getStaffEmail() {
        return StaffEmail;
    }

    public void setStaffEmail(String StaffEmail) {
        this.StaffEmail = StaffEmail;
    }

    public String getStaffJobTitle() {
        return StaffJobTitle;
    }

    public void setStaffJobTitle(String StaffJobTitle) {
        this.StaffJobTitle = StaffJobTitle;
    }

    public int getStaffSalary() {
        return StaffSalary;
    }

    public void setStaffSalary(int StaffSalary) {
        this.StaffSalary = StaffSalary;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }
    
    
    String First_Name , Last_Name , StaffEmail ,StaffJobTitle, username, password , PhoneNumber;
    int StaffSalary ;
    
}
