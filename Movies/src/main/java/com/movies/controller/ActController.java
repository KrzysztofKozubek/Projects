package com.movies.controller;

import com.movies.entity.Act;
import com.movies.service.ActService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
public class ActController {

    @Autowired
    private ActService actService;

    @GetMapping("/act/movie/{id}")
    public ResponseEntity<?> getMovies(@PathVariable("id") Long id) {
        return new ResponseEntity<>(actService.getMovies(id), HttpStatus.OK);
    }

    @GetMapping("/act/person/{id}")
    public ResponseEntity<?> getPersons(@PathVariable("id") Long id) {
        return new ResponseEntity<>(actService.getPersons(id), HttpStatus.OK);
    }

    @PostMapping(path = "/act/", consumes = "application/json", produces = "application/json")
    public ResponseEntity<?> addMovie(@RequestBody Act act) {
        return new ResponseEntity<>(actService.addAct(act), HttpStatus.OK);
    }
}
