package com.bot.imdb.dao;

import com.movies.entity.Act;
import com.movies.entity.Movie;
import com.movies.entity.Person;
import com.movies.entity.Role;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class ActDAO {

    public static List<Act> getAct(Movie movie, List<Person> people, Role role) {
        List<Act> acts = new LinkedList<>();
        return people.stream()
                .map(person -> buildAct(movie, person, role))
                .collect(Collectors.toList());
    }

    private static Act buildAct(Movie movie, Person person, Role role) {
        return Act.builder()
                .movie(movie)
                .person(person)
                .role(role)
                .description(person + " -> " + role.toString())
                .build();
    }
}
