package uj.fais.meetyourfriends.api.objects

/**
 * Created by Patrycja on 08.04.2017.
 */
class EditPostResult {
    private int editPost;
    private String error;


    String getError() {
        return error
    }

    void setError(String error) {
        this.error = error
    }

    int getEditPost() {
        return editPost
    }

    void setEditPost(int editPost) {
        this.editPost = editPost
    }
}
