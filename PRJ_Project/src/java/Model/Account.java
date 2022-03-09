
package Model;

public class Account {
    private String Username;
    private String Password;
    private boolean isManager;

    public Account() {
    }

    public Account(String Username, String Password) {
        this.Username = Username;
        this.Password = Password;
    }

    public Account(String Username, String Password, boolean isManager) {
        this.Username = Username;
        this.Password = Password;
        this.isManager = isManager;
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

    public boolean isIsManager() {
        return isManager;
    }

    public void setIsManager(boolean isManager) {
        this.isManager = isManager;
    }

    @Override
    public String toString() {
        return "Account{" + "Username=" + Username + ", Password=" + Password + ", isManager=" + isManager + '}';
    }

    
    

    
    
}
