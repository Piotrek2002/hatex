package pl.hatex.hatex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/desktop")
public class DesktopController {

    @GetMapping()
    public String desktop(){
        return "desktop";
    }
}
