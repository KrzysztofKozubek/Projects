package com.dictionary.controller;

import com.dictionary.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class DictionaryController {

    @Autowired
    private DictionaryService dictionaryService;

    @GetMapping("/dictionaries/")
    public ResponseEntity<?> getDictionaries() {
        return new ResponseEntity<>(dictionaryService.getDictionaries(), HttpStatus.OK);
    }

    @GetMapping("/dictionary/{language}")
    public ResponseEntity<?> getDictionary(@PathVariable("language") String language) {
        return new ResponseEntity<>(dictionaryService.getDictionary(language), HttpStatus.OK);
    }

    @GetMapping("/dictionary/")
    public ResponseEntity<?> getDictionary() {
        return new ResponseEntity<>(dictionaryService.getDictionary(), HttpStatus.OK);
    }

    @GetMapping("/translate/{language}/{label}")
    public ResponseEntity<?> getTranslate(
            @PathVariable("language") String language,
            @PathVariable("label") String label) {
        return new ResponseEntity<>(dictionaryService.getTranslate(language, label), HttpStatus.OK);
    }

    @GetMapping("/translate/{label}")
    public ResponseEntity<?> getTranslate(@PathVariable("label") String label) {
        return new ResponseEntity<>(dictionaryService.getTranslate(label), HttpStatus.OK);
    }
}
