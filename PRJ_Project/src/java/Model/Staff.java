
package Model;

import java.sql.Date;


public class Staff {
    private String userName; 
    private String firstName;
    private String lastName; 
    private Date DOB; 
    private String address;
    private String phone;

    public Staff() {
    }

    public Staff(String userName, String firstName, String lastName, Date DOB, String address, String phone) {
        this.userName = userName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.DOB = DOB;
        this.address = address;
        this.phone = phone;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Staff{" + "userName=" + userName + ", firstName=" + firstName + ", lastName=" + lastName + ", DOB=" + DOB + ", address=" + address + ", phone=" + phone + '}';
    }
     
    
}
