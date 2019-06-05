package com.movies.converter;

import com.movies.dto.MovieDTO;
import com.movies.entity.Movie;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.stream.Collectors;

@Service
public class MovieConverter {

    public Movie toEntity(MovieDTO movieDTO) {
        return Movie.builder()
                .id(movieDTO.getId())
                .title(movieDTO.getTitle())
                .description(movieDTO.getDescription())
                .build();
    }

    public MovieDTO toDTO(Movie movie) {
        return MovieDTO.builder()
                .id(movie.getId())
                .title(movie.getTitle())
                .description(movie.getDescription())
                .build();
    }

    public Set<Movie> toEntity(Set<MovieDTO> movieDTO) {
        return movieDTO.stream()
                .map(this::toEntity)
                .collect(Collectors.toSet());
    }

    public Set<MovieDTO> toDTO(Set<Movie> movie) {
        return movie.stream()
                .map(this::toDTO)
                .collect(Collectors.toSet());
    }
}
