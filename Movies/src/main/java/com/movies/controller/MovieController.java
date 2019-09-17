package com.movies.controller;

import com.MoviesApplication;
import com.movies.entity.Movie;
import com.movies.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @GetMapping("/movie/{id}")
    public ResponseEntity<?> getMovie(@PathVariable("id") Long id) {
        MoviesApplication.displayAllBeans();
        return new ResponseEntity<>(movieService.getMovie(id), HttpStatus.OK);
    }

    @GetMapping("/movie/find/{title}")
    public ResponseEntity<?> getMovies(@PathVariable("title") String title) {
        return new ResponseEntity<>(movieService.getMovies(title), HttpStatus.OK);
    }

    @PutMapping(path = "/movie/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> editMovie(@RequestBody Movie movie) {
        return new ResponseEntity<>(movieService.editMovie(movie), HttpStatus.OK);
    }

    @PostMapping(path = "/movie/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> addMovie(@RequestBody Movie movie) {
        return new ResponseEntity<>(movieService.addMovie(movie), HttpStatus.OK);
    }

    @DeleteMapping(path = "/movie/{id}")
    public ResponseEntity<?> deleteMovie(@PathVariable("id") Long id) {
        return new ResponseEntity<>(movieService.deleteMovie(id), HttpStatus.OK);
    }
}
