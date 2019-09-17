package com.movies.repository;

import com.movies.entity.Movie;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.Optional;

@Repository
public interface MoviesRepository extends CrudRepository <Movie, Long> {

    Optional<Movie> findById(Long id);

    @Transactional(timeout = 8)
    Optional<Set<Movie>> findByTitleContainingIgnoreCase(String title);

    Movie save(Movie movie);

    List<Movie> save(Iterable<Movie> movies);

    void deleteById(Long id);
}
