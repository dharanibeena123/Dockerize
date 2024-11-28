package com.docker.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class controller {


        @GetMapping("/getMessage")
        public String getMessage() {
            return "Hello, Welcome to the Docker!";
        }

}
