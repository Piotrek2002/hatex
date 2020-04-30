package pl.hatex.hatex.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.hatex.hatex.entity.User;
import pl.hatex.hatex.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setUsername("user");
        user.setPassword("user");
        userService.saveUser(user,"ROLE_USER");
        return "user";
    }
    @GetMapping("/create-admin")
    @ResponseBody
    public String createAdmin(){
        User user = new User();
        user.setUsername("admin");
        user.setPassword("admin");
        userService.saveUser(user,"ROLE_ADMIN");
        return "admin";
    }
    @GetMapping("/info")
    @ResponseBody
    public String userInfo(@AuthenticationPrincipal UserDetails customUser) {
        return "You are logged as " + customUser;
    }

}
