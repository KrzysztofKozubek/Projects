package com.bot.imdb.dao;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.movies.entity.Person;
import lombok.*;

import java.util.List;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class PersonImdb {
    String url;
    String name;

    String image;
    String birthDate;
    String description;
    List<String> jobTitle;

    public Person getPerson() {
        return Person.builder()
                .name(name)
                .build();
    }
}
