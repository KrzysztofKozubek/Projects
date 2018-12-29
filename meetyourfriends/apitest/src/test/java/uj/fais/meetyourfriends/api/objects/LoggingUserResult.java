package uj.fais.meetyourfriends.api.objects;

import org.junit.Ignore;

/**
 * Created by Patrycja on 08.04.2017.
 */
@Ignore
public class LoggingUserResult {

    private int success;
    private int id;
    private String error;

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }



}
