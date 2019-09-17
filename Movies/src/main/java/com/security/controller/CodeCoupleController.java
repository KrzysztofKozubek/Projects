package com.security.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
class CodeCoupleController {

    @GetMapping("/for-all")
    String showCodeCouple(){
        return "Code Couple!";
    }

    @GetMapping("/not-for-all")
    String showCodeCoupleAwesome(){
        return "Code Couple is awesome!";
    }

}