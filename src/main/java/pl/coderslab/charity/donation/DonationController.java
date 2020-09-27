package pl.coderslab.charity.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.category.CategoryService;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.user.User;
import pl.coderslab.charity.user.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/")
public class DonationController {

    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;
    private final UserService userService;

    public DonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService, UserService userService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.userService = userService;
    }

    @GetMapping("donationForm")
    public String makeDonation(Model model) {
        model.addAttribute("category", categoryService.findAll());
        model.addAttribute("institution", institutionService.findAll());
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping("donationForm")
    public String makeDonationPost(@ModelAttribute Donation donation, Principal principal) {

        if (principal != null) {
            User user = userService.findByUsername(principal.getName());
            donation.setUser(user);
        }
        donationService.saveDonation(donation);
        return "app/common/confirm";
    }

    @GetMapping("confirm")
    public String donationConfirm() {
        return "form-confirmation";
    }

    @GetMapping("app/user/donation")
    public String userDonationList(Model model, Principal principal) {
        Long userId = userService.findByUsername(principal.getName()).getId();
        model.addAttribute("donation", donationService.findDonationByUser(userId));
        return "app/user/userGifts";
    }

    @GetMapping("app/user/donation/details/{id}")
    public String userDonationDetails(Model model, @PathVariable Long id) {
        model.addAttribute("donation", donationService.findDonationById(id));
        return "app/donationDetails";
    }

    @PostMapping("app/user/donation/details/{id}")
    public String confirmDonationPickUp(@ModelAttribute Donation donation) {
        donationService.confirmPickUp(donation.getId());
        return "redirect:/app/user/donation";
    }

    @GetMapping("app/admin/donation/all")
    public String allDonation(Model model) {
        model.addAttribute("donation", donationService.findAll());
        return "app/donationList";
    }

    @GetMapping("app/admin/donation/details/{id}")
    public String adminDonationDetails(Model model, @PathVariable Long id) {
        model.addAttribute("donation", donationService.findDonationById(id));
        return "app/donationDetailsView";
    }

}
