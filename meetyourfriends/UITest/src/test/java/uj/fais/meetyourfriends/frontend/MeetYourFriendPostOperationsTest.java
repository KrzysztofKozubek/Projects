package uj.fais.meetyourfriends.frontend;

import org.fluentlenium.adapter.junit.FluentTest;
import org.junit.Before;
import org.junit.Test;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import static org.fluentlenium.core.filter.FilterConstructor.withText;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertThat;

/**
 * Created by Patrycja on 31.05.2017.
 */
public class MeetYourFriendPostOperationsTest extends FluentTest

{
   /* @Override
    public String getWebDriver() {
        return "chrome";
    }*/

    @Before
    public void beforeTest() {
        logon("miscezary@wp.pl", "admin1");
    }

    private String logon(String email, String password) {
        goTo("http://localhost:8000/#!/login");
        $("input").fill().with(email, password);
        $("button").click().await().explicitlyFor(3, TimeUnit.SECONDS);
        return this.getDriver().getCurrentUrl();
    }

    @Test
    public void add_new_post() {
        String newPost = "Oto post testowy z selenium, pozdrawiam " + (new Date().toString());
        addPost(newPost);
        assertThat($(".row.timeline-border").$("md-list-item").get(0).$("p").text(), equalTo(newPost));
    }

    @Test
    public void delete_post() {
        String newPost = "Oto post testowy z selenium, pozdrawiam " + (new Date().toString());
        addPost(newPost);

        String oldSecondPost =  $(".row.timeline-border").$("md-list-item").get(1).$("p").text();

        $(".row.timeline-border").$("md-list-item").get(0).$("button" ,withText("delete")).click();

        await().explicitlyFor(5, TimeUnit.SECONDS);
        assertThat($(".row.timeline-border").$("md-list-item").get(0).$("p").text(), equalTo(oldSecondPost));
    }

    @Test
    public void edit_post() {
        String newPost = "Oto post testowy z selenium, pozdrawiam " + (new Date().toString());
        addPost(newPost);
        $(".row.timeline-border").$("md-list-item").get(0).$("button" ,withText("mode_edit")).click();
        String editedPost = "Oto post testowy z selenium, Po zedytowaniu";
        $("md-dialog").$("textarea").fill().with(editedPost);
        await().explicitlyFor(3, TimeUnit.SECONDS);
        $("md-dialog-actions").el(".md-button.md-ink-ripple").click();
       // el("md-dialog").$("button" ).
        await().explicitlyFor(2, TimeUnit.SECONDS);
        assertThat($(".row.timeline-border").$("md-list-item").get(0).$("p").text(), equalTo(editedPost));
    }

    private void addPost(String newPost) {
        $("#addPost").fill().with(newPost);
        $("button", withText("Add")).click().await().explicitlyFor(3,TimeUnit.SECONDS);
    }






}
