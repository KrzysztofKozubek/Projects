package uj.fais.meetyourfriends.api.objects;

/**
 * Created by Patrycja on 08.04.2017.
 */
public class LoggedUser {

    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private String password;

}
