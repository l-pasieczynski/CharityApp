package pl.coderslab.charity.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.coderslab.charity.donation.DonationService;
import pl.coderslab.charity.user.CurrentUser;
import pl.coderslab.charity.user.User;

@Controller
@SessionAttributes({"userId", "username"})
public class AppController {

    private final DonationService donationService;

    public AppController(DonationService donationService) {
        this.donationService = donationService;
    }

    @GetMapping("/app/home")
    public String appStart(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        if (currentUser == null) {
            return "/login";
        } else {
            Long id = currentUser.getUser().getId();
            User user = currentUser.getUser();
            model.addAttribute("userId", id);
            model.addAttribute("username", currentUser.getUsername());

            model.addAttribute("userBags", donationService.getAllUserBags(user));
            model.addAttribute("userDonations", donationService.getAllUserDonationCount(user));
            model.addAttribute("userLastDonation", donationService.getUserLastDonation(user));

            model.addAttribute("allBags", donationService.bagsQuantity());
            model.addAttribute("allDonation", donationService.donationQuantity());
            return "app/home";
        }
    }
}
