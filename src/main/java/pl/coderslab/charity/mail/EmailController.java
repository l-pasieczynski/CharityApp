package pl.coderslab.charity.mail;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.charity.user.UserService;

@Controller
public class EmailController {

    private final UserService userService;
    private final EmailSender emailSender;

    public EmailController(UserService userService, EmailSender emailSender) {
        this.userService = userService;
        this.emailSender = emailSender;
    }

    @GetMapping("/app/admin/user/mail/{id}")
    public String sendEmailToUser (@PathVariable Long id, Model model){
        Email email = new Email();
        email.setUserEmailAddress(userService.findById(id).getEmail());
        model.addAttribute("email", email);
        return "/app/email";
    }

    @PostMapping("/app/admin/user/mail/{id}")
    String sendEmailToUserPost(@ModelAttribute("email") Email email){
        emailSender.sendEmail(email.getUserEmailAddress(),  email.getSubject(), email.getMessage());
        return "redirect:/app/admin/users/all";
    }

}