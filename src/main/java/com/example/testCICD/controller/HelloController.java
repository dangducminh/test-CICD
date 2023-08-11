package com.example.testCICD.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author minhdd.lvt
 * @date: 8/11/2023
 */

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello(){
        return "deploy success with jenkins cicd";
    }
}
