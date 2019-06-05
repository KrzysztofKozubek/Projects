package com.movies.service;

import com.movies.converter.MovieConverter;
import com.movies.dto.MovieDTO;
import com.movies.repository.MoviesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class MovieService {

    @Autowired
    private MoviesRepository moviesRepository;


    @Autowired
    private MovieConverter movieConverter;

    public MovieDTO getMovie(Long id) throws IllegalArgumentException {
        return movieConverter.toDTO(
                moviesRepository
                        .findById(id)
                        .orElseThrow(() -> new IllegalArgumentException("Movie with that id is not exists"))
        );
    }

    public Set<MovieDTO> getMovies(String title) throws IllegalArgumentException {
        return movieConverter.toDTO(
                moviesRepository.findByTitleContainingIgnoreCase(title)
                .orElseThrow(() ->  new IllegalArgumentException("Cannot find any results"))
        );
    }
}
