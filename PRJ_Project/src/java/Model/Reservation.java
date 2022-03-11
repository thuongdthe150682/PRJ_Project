
package Model;



public class Reservation {
    private int Id;
    private String name;
    private String date;
    private String time;
    private String Phone;
    private String Number_People;
    private String mesage;
    private String staff;
    private int status;
    public Reservation() {
    }

    public Reservation(String name, String date, String time, String Phone, String Number_People, String mesage,int status) {
        this.name = name;
        this.date = date;
        this.time = time;
        this.Phone = Phone;
        this.Number_People = Number_People;
        this.mesage = mesage;
        this.status = status;
    }

    public Reservation(String name, String Phone) {
        this.name = name;
        this.Phone = Phone;
        
    }

    public Reservation(int Id, String name, String date, String time, String Phone, String Number_People, String mesage, String staff, int status) {
        this.Id = Id;
        this.name = name;
        this.date = date;
        this.time = time;
        this.Phone = Phone;
        this.Number_People = Number_People;
        this.mesage = mesage;
        this.staff = staff;
        this.status = status;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getNumber_People() {
        return Number_People;
    }

    public void setNumber_People(String Number_People) {
        this.Number_People = Number_People;
    }

    public String getMesage() {
        return mesage;
    }

    public void setMesage(String mesage) {
        this.mesage = mesage;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Reservation{" + "Id=" + Id + ", name=" + name + ", date=" + date + ", time=" + time + ", Phone=" + Phone + ", Number_People=" + Number_People + ", mesage=" + mesage + ", staff=" + staff + ", status=" + status + '}';
    }
    

    
    
    
    
    
}
