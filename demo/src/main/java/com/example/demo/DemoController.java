package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    // Reads the property `password` from application.properties
    @Value("${password}")
    private String password;

    // Handles the root path “/”
    @GetMapping("/")
    public String showPassword() {
        return "Password from properties: " + password;
    }
}