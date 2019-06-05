package com.movies.repository;

import com.movies.entity.Movie;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;
import java.util.Optional;

@Repository
public interface MoviesRepository extends CrudRepository <Movie, Long> {
    Optional<Movie> findById(Long id);
    Optional<Set<Movie>> findByTitleContainingIgnoreCase(String title);
}
