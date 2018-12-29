package uj.fais.meetyourfriends.api

import org.junit.Test
import uj.fais.meetyourfriends.api.objects.LoggedUser
import uj.fais.meetyourfriends.api.objects.LoggingUserResult
import uj.fais.meetyourfriends.api.objects.LogoutUser

import static io.restassured.RestAssured.*
import static org.hamcrest.MatcherAssert.assertThat
import static org.hamcrest.Matchers.equalTo

/**
 * Created by Patrycja on 08.04.2017.
 */
class UserLoggingTest {


    @Test
    void logging_with_valid_data() {

        final LoggingUserResult actual = login("andrzej.krol13411@gmail.com", "test")

        assertThat(actual.getSuccess(), equalTo(1))
        assertThat(actual.getId(), equalTo(5))
        assertThat(actual.getError(), equalTo(String.valueOf(0)))
    }

    @Test
    void logging_with_invalid_password() {

        final LoggingUserResult actual = login("andrzej.krol13411@gmail.com", "badpassword")

        assertThat(actual.getSuccess(), equalTo(0))
        assertThat(actual.getError(), equalTo(String.valueOf(1)))

    }

    @Test
    void logging_with_invalid_email() {

        final LoggingUserResult actual = login("badeemail@gmail.com", "test")

        assertThat(actual.getSuccess(), equalTo(0))
        assertThat(actual.getError(), equalTo(String.valueOf(1)))

    }

    @Test
    void double_logging_without_logout() {

        LoggedUser loggedUser = new LoggedUser()
        loggedUser.setEmail("andrzej.krol13411@gmail.com")
        loggedUser.setPassword("test")

        LoggingUserResult second = given().cookies(given().
               body(loggedUser).
                when().
                post("http://localhost:8080/user/").cookies()).
                body(loggedUser).
                when().
                post("http://localhost:8080/user/").as(LoggingUserResult)

        assertThat(second.getError(), equalTo("jesteś już zalogowany"))

    }

    @Test
    void logout_bad_url_when_user_not_logged() {
        LoggingUserResult logout = given().
                body("\"logout\" : 1").
                when().
                post("http://localhost:8080/user/").as(LoggingUserResult)

        assertThat(logout.getError(), equalTo("Zły link *****! "))
        assertThat(logout.getSuccess(), equalTo(0))
    }

    @Test
    void logout_success() {

        LoggedUser loggedUser = new LoggedUser()
        loggedUser.setEmail("andrzej.krol13411@gmail.com")
        loggedUser.setPassword("test")

        Map<String, String> cookies = given().body(loggedUser).when().post("http://localhost:8080/user/").cookies()
        LogoutUser logoutUser = new LogoutUser();

        LoggingUserResult logout = given().
                cookies(cookies).
                body(logoutUser).
                when().
                post("http://localhost:8080/user/").as(LoggingUserResult)

        assertThat(logout.getSuccess(), equalTo(1))
    }

    final LoggingUserResult login(String email, String password) {
        LoggedUser loggedUser = new LoggedUser()
        loggedUser.setEmail(email)
        loggedUser.setPassword(password)

        return given().
                body(loggedUser).
                when().
                post("http://localhost:8080/user/").as(LoggingUserResult)

    }
}
