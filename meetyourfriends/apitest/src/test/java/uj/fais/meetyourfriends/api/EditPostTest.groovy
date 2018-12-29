package uj.fais.meetyourfriends.api


import org.joda.time.LocalDateTime
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter
import org.junit.Test
import uj.fais.meetyourfriends.api.objects.EditPostResult
import uj.fais.meetyourfriends.api.objects.EditedPost
import uj.fais.meetyourfriends.api.objects.LoggedUser
import uj.fais.meetyourfriends.api.objects.LogoutUser

import static io.restassured.RestAssured.*
import static org.hamcrest.MatcherAssert.assertThat
import static org.hamcrest.Matchers.equalTo

/**
 * Created by Patrycja on 08.04.2017.
 */

class EditPostTest {

    DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")

    @Test
    void edit_post_error_user_not_logged() throws Exception {

        LocalDateTime ldt = new LocalDateTime()
        EditedPost editedPost = create_new_post(1, ldt)

        final EditPostResult actual = given().
                body(editedPost).
                when().
                post("http://localhost:8080/user/profile/").as(EditPostResult)
        assertThat(actual.getError(), equalTo("nie jesteś zalogowany ;)"))
    }

    @Test
    void edit_post_success_user_logged() {

        LoggedUser loggedUser = new LoggedUser()
        loggedUser.setEmail("andrzej.krol13411@gmail.com")
        loggedUser.setPassword("test")

        LocalDateTime ldt = new LocalDateTime()
        EditedPost editedPost = create_new_post(1, ldt)

        Map<String, String> cookies = given().body(loggedUser).when().post("http://localhost:8080/user/").cookies()

        final EditPostResult actual = given().
                cookies(cookies).
                body(editedPost).
                when().
                post("http://localhost:8080/user/profile/").as(EditPostResult)
        assertThat(actual.getEditPost(), equalTo(1))

    }

    @Test
    void edit_post_which_do_not_exist() {

        LoggedUser loggedUser = new LoggedUser()
        loggedUser.setEmail("andrzej.krol13411@gmail.com")
        loggedUser.setPassword("test")

        int randomNum = 100 + (int)(Math.random() * 1000);

        System.out.println(randomNum);
        LocalDateTime ldt = new LocalDateTime()
        EditedPost editedPost = create_new_post(randomNum, ldt)

        Map<String, String> cookies = given().body(loggedUser).when().post("http://localhost:8080/user/").cookies()

        final EditPostResult actual = given().
                cookies(cookies).
                body(editedPost).
                when().
                post("http://localhost:8080/user/profile/").as(EditPostResult)
        assertThat(actual.getEditPost(), equalTo(1))

    }


    EditedPost create_new_post(int id, LocalDateTime ldt){
        EditedPost editedPost = new EditedPost()
        editedPost.setDatePost(fmt.print(ldt))
        editedPost.setDescription("test edycji postu o godzinie " + fmt.print(ldt))
        editedPost.setIdPost(id)
        editedPost.setPolicy(1)
        editedPost.setPost("edit")
        return  editedPost;
    }

}
