
package Model;

public class Account {
    private String Username;
    private String Password;

    public Account() {
    }

    public Account(String Username, String Password) {
        this.Username = Username;
        this.Password = Password;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }
    @Override
    public String toString() {
        return "Account{" + "Username=" + Username + ", Password=" + Password + '}';
    }

    
    
}
