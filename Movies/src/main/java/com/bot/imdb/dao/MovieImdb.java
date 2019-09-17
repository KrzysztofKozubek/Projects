package com.bot.imdb.dao;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.movies.entity.Movie;
import lombok.*;

import java.io.IOException;
import java.util.List;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class MovieImdb {
    String name;
    String image;
    List<String> genre;

    List<PersonImdb> actor;
    PersonImdb director;
    List<PersonImdb> creator;

    String description;
    String datePublished;
    String keywords;

    public static MovieImdb getMovieImdb(String json) {
        ObjectMapper om = new ObjectMapper();
        try {
            return om.readValue(json, MovieImdb.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Movie getMovie() {
        return Movie.builder()
                .title(name)
                .description(description)
                .poster(image)
                .build();
    }
}
