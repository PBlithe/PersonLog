package com.pblithe.rizhi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping({"/","rizhi","RIZHI"})
    public String login(){
        return "login";
    }
}
