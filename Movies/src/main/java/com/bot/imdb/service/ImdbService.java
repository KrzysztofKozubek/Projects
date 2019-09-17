package com.bot.imdb.service;

import com.MoviesApplication;
import com.bot.imdb.dao.MovieImdb;
import com.bot.imdb.dao.PersonImdb;
import com.movies.entity.Movie;
import com.movies.entity.Person;
import com.movies.service.MovieService;
import com.movies.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.URL;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
public class ImdbService {

    private final MovieService movieService;

    private final PersonService personService;

    private static final Pattern jsonMoviePattern = Pattern.compile("json\">(.*?)</script", Pattern.DOTALL);

    @Autowired
    public ImdbService(MovieService movieService, PersonService personService) {
        this.movieService = movieService;
        this.personService = personService;
    }

    public void save(String link) {
        try (BufferedInputStream inputStream = new BufferedInputStream(new URL(link).openStream());) {
            String html = convert(inputStream);
            List<Person> person = getPerson(html);
            List<Person> creator = getCreator(html);
            Person director = getDirector(html);

            movieService.addMovie(getMovie(html));
            personService.addPerson(person);
            personService.addPerson(creator);
            personService.addPerson(director);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Movie getMovie(String html) {
        return MovieImdb.getMovieImdb(getMovieJson(html)).getMovie();
    }

    private List<Person> getPerson(String html) {
        return MovieImdb.getMovieImdb(getMovieJson(html)).getActor().stream()
                .map(PersonImdb::getPerson)
                .collect(Collectors.toList());
    }

    private List<Person> getCreator(String html) {
        return MovieImdb.getMovieImdb(getMovieJson(html)).getCreator().stream()
                .filter(person-> person.getName() != null)
                .map(PersonImdb::getPerson)
                .collect(Collectors.toList());
    }

    private Person getDirector(String html) {
        return MovieImdb.getMovieImdb(getMovieJson(html)).getDirector().getPerson();
    }

    private String convert(InputStream inputStream) {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(inputStream))) {
            return br.lines().collect(Collectors.joining(System.lineSeparator()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String getMovieJson(String html) {
        Matcher m = jsonMoviePattern.matcher(html);
        if (m.find()) {
            return m.group(1);
        }
        return null;
    }
}
