package pl.coderslab.charity.user;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.donation.DonationService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class UserController {

    private final UserService userService;
    private final DonationService donationService;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserController(UserService userService, DonationService donationService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.donationService = donationService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/user")
    public String userDetails(Model model, Principal principal) {
        model.addAttribute("user", userService.findById(userService.findByUsername(principal.getName()).getId()));
        return "app/common/profile";
    }

    @GetMapping("/user/edit")
    public String userDetailsEdit(Model model, Principal principal) {
        ;
        model.addAttribute("user", userService.findByUsername(principal.getName()));
        return "app/common/editProfile";
    }

    @PostMapping("/user/edit")
    public String userDetailsEdit(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "app/common/editProfile";
        }
        userService.updateUser(user);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);
        return "login";
    }

    @GetMapping("/user/edit/password")
    public String changePassword(Model model) {
        model.addAttribute("password", new Password());
        return "app/common/editPassword";
    }

    @PostMapping("/user/edit/password")
    public String changePasswordPost(Principal principal, @ModelAttribute("password") Password password, Model model) {
        User user = userService.findByUsername(principal.getName());
        if (!BCrypt.checkpw(password.getCurrentPassword(), user.getPassword())) {
            model.addAttribute("errorPass", "Niepoprawne stare hasło");
            return "app/common/editPassword";
        }
        if (!password.getNewPassword().equals(password.getRetypePassword())) {
            model.addAttribute("errorPass", "Hasła nie są identyczne");
            return "app/common/editPassword";
        }
        user.setPassword(passwordEncoder.encode(password.getNewPassword()));
        userService.updateUser(user);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        authentication.setAuthenticated(false);

        return "login";
    }

    @GetMapping("/user/delete")
    public String userDelete() {
        return null;
    }

    @PostMapping("/user/delete")
    public String userDeletePost(HttpSession session, @RequestParam String decision) {
        if (decision.equals("OK")) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            authentication.setAuthenticated(false);
            userService.delete((Long) session.getAttribute("userId"));
            return "redirect:/register";
        }
        return "redirect:app/common/profile";
    }

    @GetMapping("/admin/users/all")
    public String allUserList(Model model) {
        model.addAttribute("allUsers", userService.findAllUsers());
        return "/app/userList";
    }

    @GetMapping("/admin/user/edit/{id}")
    public String adminEditUser(@PathVariable Long id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "/app/admin/editUser";
    }

    @PostMapping("/admin/user/edit/{id}")
    public String adminEditUserPost(@ModelAttribute("user") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "/app/admin/editUser";
        }
        userService.adminUpdateUser(user);
        return "redirect:/app/admin/users/all";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String userDeleteByAdmin(Model model, @PathVariable Long id) {
        model.addAttribute("delete", userService.findById(id));
        return "app/common/confirm";
    }

    @PostMapping("/admin//user/delete/{id}")
    public String userDeleteByAdminPost(@ModelAttribute("delete") User user, @RequestParam String decision, Model model, Principal principal) {
        if (decision.equals("OK")) {
            if(user.getId().equals(userService.findByUsername(principal.getName()).getId())){
                model.addAttribute("error", "Nie mozesz usunąć sam siebie");
                return "app/common/confirm";
            }
            userService.delete(user.getId());
            return "redirect:/app/admin/users/all";
        }
        return "redirect:/app/admin/users/all";
    }

    @GetMapping("/admin/user/deactivate/{id}")
    public String userDeactivate(@PathVariable Long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "forward:/app/admin/user/deactivate/{id}";
    }

    @PostMapping("/admin/user/deactivate/{id}")
    public String userDeactivatePost(@PathVariable Long id, Model model, Principal principal) {
        User user = userService.findById(id);
        if(user.getId().equals(userService.findByUsername(principal.getName()).getId())){
            model.addAttribute("error", "Nie możesz zostać nieaktywny");
            return "redirect:/app/admin/users/all";
        }
        userService.deactivateUser(id);
        return "redirect:/app/admin/users/all";
    }

    @GetMapping("/admin/all")
    public String allAdminList(Model model) {
        model.addAttribute("allAdmins", userService.findAllAdmins());
        model.addAttribute("allUsers", userService.allUsers());
        return "/app/adminList";
    }

    @GetMapping("/admin/add")
    public String addAdmin(Model model) {
        model.addAttribute("admin", new User());
        return "/app/adminAdd";
    }

    @PostMapping("/admin/add")
    public String addAdminPost(@ModelAttribute User admin) {
        userService.addNewAdmin(admin);
        return "redirect:/app/admin/all";
    }

    @GetMapping("/admin/edit/{id}")
    public String adminEdit(@PathVariable Long id, Model model) {
        model.addAttribute("admin", userService.findById(id));
        return "/app/admin/editAdmin";
    }

    @PostMapping("/admin/edit/{id}")
    public String adminEditPost(@ModelAttribute("admin") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "/app/admin/editAdmin";
        }
        userService.adminUpdateUser(user);
        return "redirect:/app/admin/all";
    }

    @GetMapping("/admin/deactivate/{id}")
    public String adminDeactivate(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "forward:/app/admin/deactivate/{id}";
    }

    @PostMapping("/admin/deactivate/{id}")
    public String adminDeactivatePost(@PathVariable("id") Long id, Model model, Principal principal) {
        User user = userService.findById(id);
        if(user.getId().equals(userService.findByUsername(principal.getName()).getId())){
            model.addAttribute("error", "Nie możesz odebrać sobie uprawnień");
            return "redirect:/app/admin/all";
        }
        userService.deactivateAdmin(user);
        return "redirect:/app/admin/users/all";
    }

    @GetMapping("/admin/delete/{id}")
    public String adminDelete(Model model, @PathVariable Long id) {
        model.addAttribute("delete", userService.findById(id));
        return "app/common/confirm";
    }

    @PostMapping("/admin/delete/{id}")
    public String adminDeletePost(@ModelAttribute("delete") User user, @RequestParam String decision, Principal principal, Model model) {

        if (decision.equals("OK")) {
            if(user.getId().equals(userService.findByUsername(principal.getName()).getId())){
                model.addAttribute("error", "Nie mozesz usunąć sam siebie");
                return "app/common/confirm";
            }
            userService.delete(user.getId());
            return "redirect:/app/admin/users/all";
        }
        return "redirect:/app/admin/all";
    }

    @ModelAttribute("Allusers")
    public List<User> users() {
        return userService.allUsers();
    }


}
