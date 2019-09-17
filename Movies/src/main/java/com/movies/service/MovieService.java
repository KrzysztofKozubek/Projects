package com.movies.service;

import com.dictionary.service.DictionaryService;
import com.movies.entity.Movie;
import com.movies.repository.MoviesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class MovieService {

    @Autowired
    private MoviesRepository moviesRepository;

    @Autowired
    private DictionaryService dictionaryService;

    public Movie getMovie(Long id) throws IllegalArgumentException {
        return moviesRepository
                        .findById(id)
                        .orElseThrow(() -> new IllegalArgumentException("MOVIE_INCORRECT_ID")
        );
    }

    public Set<Movie> getMovies(String title) throws IllegalArgumentException {
        return moviesRepository.findByTitleContainingIgnoreCase(title)
                .orElseThrow(() ->  new IllegalArgumentException("MOVIE_NO_RESULT")
        );
    }

    public Movie addMovie(Movie movie) {
        return moviesRepository.save(movie);
    }

    public Movie editMovie(Movie movie) {
        return moviesRepository.save(movie);
    }

    public String deleteMovie(Long id) {
        moviesRepository.deleteById(id);
        return dictionaryService.getTranslate("MOVIE_SUCCESSFUL_REMOVED");
    }
}
