package pl.hatex.hatex.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Array;
import java.util.Arrays;

@Controller
public class LoginController {
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        int[] tab=new int[5];
        Arrays.sort(tab);
        return "login";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(){
        return "logout";
    }
}
