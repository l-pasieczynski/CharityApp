package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.donation.DonationService;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.user.User;
import pl.coderslab.charity.user.UserService;

import javax.validation.Valid;


@Controller
@RequiredArgsConstructor
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;

    @GetMapping("/")
    public String homeAction(Model model){
        model.addAttribute("bag", donationService.bagsQuantity());
        model.addAttribute("donation", donationService.donationQuantity());
        model.addAttribute("institution", institutionService.findAll());
        return "index";
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(value = "error", required = false) String error,
                            @RequestParam(value = "logout", required = false) String logout,
                            Model model) {
        String errorMessage = null;
        if(error != null) {
            errorMessage = "Username or Password is incorrect !!";
        }
        if(logout != null) {
            errorMessage = "You have been successfully logged out !!";
        }
        model.addAttribute("errorMessage", errorMessage);
        return "login";
    }

    @GetMapping("logout")
    public String logout() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);
        return "login";
    }

    @GetMapping("/register")
    public String register(Model model){
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, Model model){
        String errorMessage = null;
        if (bindingResult.hasErrors()){
            errorMessage = "Nie poprawny email lub nazwa użytkownika";
            model.addAttribute("error", errorMessage);
            return "register";
        } if(!user.getPassword().equals(user.getRetypePassword())){
            errorMessage = "Hasła nie są identyczne";
            model.addAttribute("errorPass", errorMessage);
            return "register";
        }
        userService.saveUser(user);
        return "login";
    }

    @GetMapping("/access-denied")
    public String accessDenied(){
        return "access-denied";
    }

}
