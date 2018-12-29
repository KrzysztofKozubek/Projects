package uj.fais.meetyourfriends.api.objects;

import org.junit.Ignore;

/**
 * Created by Patrycja on 08.04.2017.
 */
public class EditedPost {

    private String post;
    private int idPost;
    private String description;
    private int policy;
    private String datePost;

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public int getIdPost() {
        return idPost;
    }

    public void setIdPost(int idPost) {
        this.idPost = idPost;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPolicy() {
        return policy;
    }

    public void setPolicy(int policy) {
        this.policy = policy;
    }

    public String getDatePost() {
        return datePost;
    }

    public void setDatePost(String datePost) {
        this.datePost = datePost;
    }

}
