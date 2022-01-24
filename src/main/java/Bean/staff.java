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
    
    
    String First_Name , Last_Name , StaffEmail ,StaffJobTitle;
    int StaffSalary ;
    
}
