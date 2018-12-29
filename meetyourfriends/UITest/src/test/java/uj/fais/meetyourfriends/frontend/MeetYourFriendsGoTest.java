package uj.fais.meetyourfriends.frontend;

import org.fluentlenium.adapter.junit.FluentTest;
import org.junit.Before;
import org.junit.Test;

import java.util.concurrent.TimeUnit;

import static org.fluentlenium.core.filter.FilterConstructor.withText;
import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertThat;
/**
 * Created by Patrycja on 31.05.2017.
 */
public class MeetYourFriendsGoTest extends FluentTest {

    /*@Override
    public String getWebDriver() {
        return "chrome";
    }*/


    @Before
    public void beforeTest() {
        goTo("http://localhost:8000/#!/login");
    }

    @Test
    public void title_of_meet_your_friends_contain_search_query() {
        assertThat(window().title(), equalTo("Meet your Friends"));
        assertThat( $("h2").text(), equalTo("and share your experiences"));
    }

    @Test
    public void login_redirect_to_profile_page() {
        assertThat(logon("miscezary@wp.pl", "admin1"), equalTo("http://localhost:8000/#!/profile"));
    }



    @Test
    public void register_new_user() {
        assertThat($(".registry.col-xs-4.col-xs-offset-4.column").$("p").$("a").text(), equalTo("don't have an account?"));
        $(".registry.col-xs-4.col-xs-offset-4.column").$("p").$("a").click().await().explicitlyFor(1, TimeUnit.SECONDS);
        $("#first_name").fill().with("Maki");
        $("#last_name").fill().with("Makowski");
        $("#birth_date").$(".md-datepicker-input").fill().with("11.05.2010");
        $("#email").fill().with("maki@kotki.pl");
        $("#password").fill().with("kotki");
        await().explicitlyFor(2, TimeUnit.SECONDS);
        $(".btn.btn-full.btn-secondary.btn-lg").click().await().explicitlyFor(3, TimeUnit.SECONDS);

        logon("maki@kotki.pl", "kotki");

        if(el(".navbar-toggle").displayed()) {
            $(".navbar-toggle").click();
        }
        assertThat( $("li").$("a").text(),equalTo("Hello Maki Makowski"));
    }

    private String logon(String email, String password) {
        goTo("http://localhost:8000/#!/login");
        $("input").fill().with(email, password);
        $("button").click().await().explicitlyFor(3, TimeUnit.SECONDS);
        return this.getDriver().getCurrentUrl();

    }

}

