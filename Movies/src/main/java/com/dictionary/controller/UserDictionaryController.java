package com.dictionary.controller;

import com.dictionary.service.UserDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
public class UserDictionaryController {

    private final UserDictionaryService dictionaryService;

    @Autowired
    public UserDictionaryController(UserDictionaryService dictionaryService) {
        this.dictionaryService = dictionaryService;
    }

    @GetMapping("/language/")

    public ResponseEntity<?> getDictionaries() {
        return new ResponseEntity<>(dictionaryService.getLanguage(), HttpStatus.OK);
    }

    @PutMapping("/language/{language}")
    public ResponseEntity<?> getDictionaries(@PathVariable("language") String language) {
        return new ResponseEntity<>(dictionaryService.setLanguage(language), HttpStatus.OK);
    }
}
