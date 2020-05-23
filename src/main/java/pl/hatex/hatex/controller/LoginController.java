package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.Role;
import pl.hatex.hatex.repository.RoleRepository;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.UserService;

import java.util.Set;

@Controller
public class LoginController {
    private final UserService userService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public LoginController(UserService userService, UserRepository userRepository, RoleRepository roleRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(){
        return "logout";
    }
    @GetMapping("/redirect")
    public String redirect(@AuthenticationPrincipal UserDetails customUser){
        String username= customUser.getUsername();
        Set<Role> roles=userRepository.findByUsername(username).getRoles();
        Role role=roleRepository.findByName("ROLE_PRODUCTION");
        if (roles.contains(role)){
            return "redirect:/production/list";
        }else {
            return "redirect:/desktop";
        }

    }

}
