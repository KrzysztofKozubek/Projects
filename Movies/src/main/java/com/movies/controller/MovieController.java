package com.movies.controller;

import com.movies.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @GetMapping("movie/{id}")
    public ResponseEntity<?> getMovie(@PathVariable("id") Long id) {
        return new ResponseEntity<>(movieService.getMovie(id), HttpStatus.OK);
    }

    @GetMapping("movie/find/{title}")
    public ResponseEntity<?> getMovies(@PathVariable("title") String title) {
        return new ResponseEntity<>(movieService.getMovies(title), HttpStatus.OK);
    }

}
