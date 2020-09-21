package pl.coderslab.charity.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/app/user")
public class UserController {

    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserController(UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping
    public String userDetails(Model model, HttpSession session) {
        model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
        return null;
    }

    @GetMapping("/edit")
    public String userDetailsEdit(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("user", userService.findByUsername(authentication.getName()));
        return null;
    }

    @PostMapping("/edit")
    public String userDetailsEdit(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return null; //widok z adresu /edit metoda GET
        }
        userService.updateUser(user);
        return null;
    }

    @GetMapping("/edit/password")
    public String changePassword(Model model) {
        //TODO rethink about model
        return null;
    }

    @PostMapping("/edit/password")
    public String changePasswordPost(HttpSession session, @Valid @RequestParam String oldPassword, String newPassword,
                                     Model model) {
        User user = userService.findById((Long) session.getAttribute("userId"));
        if (!BCrypt.checkpw(oldPassword, user.getPassword())) {
            model.addAttribute("pswErr", "WRONG OLD PASSWORD");
            return null; // TODO return na GET'a do zmiany hasla
        }
        user.setPassword(passwordEncoder.encode(newPassword));
        userService.updateUser(user);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);

        return "login";
    }


    @GetMapping("/delete")
    public String userDelete() {
        return null;
    }

    @PostMapping("/delete")
    public String userDeletePost(HttpSession session, @RequestParam String decision) {
        if (decision.equals("OK")) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            authentication.setAuthenticated(false);
            userService.delete((Long) session.getAttribute("userId"));
            return "redirect:/register";
        }
        return null; //redirect to user index
    }


}
