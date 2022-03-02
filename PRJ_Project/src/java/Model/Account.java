
package Model;

public class Account {
    private String Username;
    private String Password;
    private String Account_off;

    public Account() {
    }

    public Account(String Username, String Password) {
        this.Username = Username;
        this.Password = Password;
    }

    public Account(String Username, String Password, String Account_off) {
        this.Username = Username;
        this.Password = Password;
        this.Account_off = Account_off;
    }

    public String getAccount_off() {
        return Account_off;
    }

    public void setAccount_off(String Account_off) {
        this.Account_off = Account_off;
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
        return "Account{" + "Username=" + Username + ", Password=" + Password + ", Account_off=" + Account_off + '}';
    }
    

    
    
}
