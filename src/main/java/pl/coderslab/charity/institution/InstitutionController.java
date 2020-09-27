package pl.coderslab.charity.institution;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/app")
public class InstitutionController {

    private final InstitutionService institutionService;

    public InstitutionController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @GetMapping("/institution")
    public String institutionList(Model model) {
        model.addAttribute("institution", institutionService.findAll());
        return "app/institutionList";
    }


    @GetMapping("/admin/institution/add")
    public String institutionAdd(Model model) {
        model.addAttribute("institution", new Institution());
        return "app/institutionAdd";
    }

    @PostMapping("/admin/institution/add")
    public String institutionAddPost(@ModelAttribute("institution") Institution institution) {
        institutionService.saveInstitution(institution);
        return "redirect:/app/institution";
    }

    @GetMapping("/admin/institution/edit/{id}")
    public String institutionEdit(Model model, @PathVariable Long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute("institution", institution);
        return "app/institutionAdd";
    }

    @PostMapping("/admin/institution/edit/{id}")
    public String institutionEditPost(@ModelAttribute("institution") Institution institution) {
        institutionService.saveInstitution(institution);
        return "redirect:/app/institution";
    }

    @GetMapping("/admin/institution/delete/{id}")
    public String institutionDelete(Model model, @PathVariable Long id) {
        model.addAttribute("delete", institutionService.findById(id));
        return "app/common/confirm";
    }

    @PostMapping("/admin/institution/delete/{id}")
    public String institutionDeletePost(@ModelAttribute Institution institution, @RequestParam String decision) {
        if (decision.equals("OK")) {
            institutionService.deleteInstitution(institution.getId());
            return "redirect:/app/institution";
        }
        return "redirect:/app/institution";
    }

    @GetMapping("/user/institution/details/{id}")
    public String institutionDetails(Model model, @PathVariable Long id) {
        model.addAttribute("institution", institutionService.findById(id));
        return "app/institutionDetails";
    }


}
