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

import java.util.List;

@Controller
@SessionAttributes("branch")
public class BranchController {

    /*private final UserService userService;

    public BranchController(UserService userService) {
        this.userService = userService;
    }

    @ModelAttribute("branches")
    public List<CompanyBranch> companyBranches(@AuthenticationPrincipal UserDetails customUser) {
        User user=userService.findByUserName(customUser.getUsername());
        List<CompanyBranch> companyBranches= user.getCompanyBranches();
        return companyBranches;
    }

    @GetMapping("/branch")
    public String branch(@AuthenticationPrincipal UserDetails customUser, Model model){
        User user=userService.findByUserName(customUser.getUsername());
        List<CompanyBranch> companyBranches= user.getCompanyBranches();

        if (companyBranches.size()>1){
            model.addAttribute("user",new User());
            return "choice-branch";
        }
        else {
            model.addAttribute("branch",companyBranches.get(0));
            return "redirect:/desktop";
        }


    }
    @PostMapping("/branch")
    public String branch(@ModelAttribute @Validated CompanyBranch companyBranch, BindingResult result, Model model){
        model.addAttribute("branch",companyBranch);
        return "redirect:/desktop";
    }*/
}
