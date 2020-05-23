package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.entity.User;
import pl.hatex.hatex.repository.CompanyBranchRepository;
import pl.hatex.hatex.repository.RoleRepository;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final CompanyBranchRepository companyBranchRepository;

    public UserController(UserService userService, UserRepository userRepository, RoleRepository roleRepository, CompanyBranchRepository companyBranchRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.companyBranchRepository = companyBranchRepository;
    }

    @GetMapping("/info")
    @ResponseBody
    public String userInfo(@AuthenticationPrincipal UserDetails customUser) {
        return "You are logged as " + customUser;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "user-list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "redirect:/user/list";
    }

    @GetMapping("/add")
    public String createUser(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("companyBranches",companyBranchRepository.findAll());
        model.addAttribute("roles",roleRepository.findAll());
        return "user-add";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute @Validated User user, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            userService.saveUser(user);
            return "redirect:/user/list";
        }
        return "user-add";
    }

}
