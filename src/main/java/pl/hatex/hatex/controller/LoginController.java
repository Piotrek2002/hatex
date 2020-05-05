package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.CompanyBranch;
import pl.hatex.hatex.entity.User;
import pl.hatex.hatex.services.UserService;

import java.util.Arrays;
import java.util.List;

@Controller
public class LoginController {
    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(){
        return "logout";
    }

}
