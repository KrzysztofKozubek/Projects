package uj.fais.meetyourfriends.frontend;

import org.fluentlenium.adapter.junit.FluentTest;
import org.fluentlenium.core.domain.FluentList;
import org.fluentlenium.core.domain.FluentWebElement;
import org.junit.Before;
import org.junit.Test;

import java.util.concurrent.TimeUnit;

import static org.fluentlenium.core.filter.FilterConstructor.withName;
import static org.fluentlenium.core.filter.FilterConstructor.withText;
import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.assertThat;

/**
 * Created by Patrycja on 31.05.2017.
 */
public class MeetYourFriendsAfterLogonTest extends FluentTest {
    @Override
    public String getWebDriver() {
        return "chrome";
    }

    @Before
    public void beforeTest() {
        logon("miscezary@wp.pl", "admin1");
    }


    @Test
    public void edit_user_profile() {
        assertThat(this.getDriver().getCurrentUrl(), equalTo("http://localhost:8000/#!/profile"));



        if(el(".navbar-toggle").displayed()) {
            $(".navbar-toggle").click();
        }
        FluentWebElement editButton = el(".md-icon-button.md-button.md-ink-ripple");
        editButton.click().await().explicitlyFor(2, TimeUnit.SECONDS);
        editUserProfile("Ignacy","Zenonowicz");
        assertThat( $("li").$("a").text(),equalTo("Hello Ignacy Zenonowicz"));
        await().explicitlyFor(3, TimeUnit.SECONDS);

        editButton.click().await().explicitlyFor(2, TimeUnit.SECONDS);
        editUserProfile("Cezaryl","Misiek");
        assertThat( $("li").$("a").text(),equalTo("Hello Cezaryl Misiek"));

    }

    public void editUserProfile(String firstName, String lastName){

        el("input", withName("user.first_name")).fill().with(firstName);
        el("input",withName("user.last_name")).fill().with(lastName);
        await().explicitlyFor(1, TimeUnit.SECONDS);

        $("md-dialog-actions").el(".md-button.md-ink-ripple").click();

    }



    @Test
    public void logout_redirect_to_login_page() {
        assertThat(this.getDriver().getCurrentUrl(), equalTo("http://localhost:8000/#!/profile"));

        if(el(".navbar-toggle").displayed()) {
            $(".navbar-toggle").click();
        }
        assertThat( $("li").$("a").text(),equalTo("Hello Cezaryl Misiek"));
        assertThat( $("li").last().text(),equalTo("Logout"));

        $("li").last().click().await().explicitlyFor(3, TimeUnit.SECONDS);
        assertThat(this.getDriver().getCurrentUrl(), equalTo("http://localhost:8000/#!/login"));
    }

    @Test
    public void show_and_hide_friends_list() {
        assertThat(this.getDriver().getCurrentUrl(), equalTo("http://localhost:8000/#!/profile"));

        assertThat(el("md-list").displayed(), equalTo(true));
        $(".md-raised.md-button.md-ink-ripple").click().await().explicitlyFor(3, TimeUnit.SECONDS);
        assertThat(el("md-list").displayed(), equalTo(false));
    }

    @Test
    public void search_friends() {
        assertThat(this.getDriver().getCurrentUrl(), equalTo("http://localhost:8000/#!/profile"));

        $("#input-0").fill().with("Ka");
        $("#input-0").doubleClick().await().explicitlyFor(1,TimeUnit.SECONDS);
        assertThat(el("#ul-0").displayed(), equalTo(true));

        String actualText = $("#ul-0").get(0).text() ;
        System.out.println("*************************************");
        System.out.println(actualText);
        System.out.println("*************************************");
        assertThat(actualText.contains("Katarzyna B"), equalTo(true));
        assertThat(actualText.contains("Tomasz Sojka"), equalTo(true));
        assertThat(actualText.contains("Kajak Kuba"), equalTo(true));
     }

    private String logon(String email, String password) {
        goTo("http://localhost:8000/#!/login");
        $("input").fill().with(email, password);
        $("button").click().await().explicitlyFor(3, TimeUnit.SECONDS);
        return this.getDriver().getCurrentUrl();
    }



}
