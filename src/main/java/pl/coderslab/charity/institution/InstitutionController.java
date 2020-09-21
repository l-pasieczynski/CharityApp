package pl.coderslab.charity.institution;

import org.springframework.security.access.annotation.Secured;
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
        return null;
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/institution/add")
    public String institutionAdd(Model model) {
        model.addAttribute("institution", new Institution());
        return null;
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/institution/add")
    public String institutionAddPost(@ModelAttribute("institution") Institution institution) {
        institutionService.saveInstitution(institution);
        return null;
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("institution/edit/{id}")
    public String institutionEdit(Model model, @PathVariable Long id) {
        Institution institution = institutionService.findById(id);
        model.addAttribute("institution", institution);
        return null;
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("institution/edit/{id}")
    public String institutionEditPost(@ModelAttribute("institution") Institution institution) {
        institutionService.saveInstitution(institution);
        return null;
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/institution/delete/{id}")
    public String institutionDelete() {
        return null;
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/institution/delete/{id}")
    public String institutionDeletePost(@PathVariable Long id, @RequestParam String decision) {
        if (decision.equals("OK")) {
            institutionService.deleteInstitution(id);
            return null;
        }
        return null;
    }

    @GetMapping("institution/details/{id}")
    public String institutionDetails(Model model, @PathVariable Long id) {
        model.addAttribute("institution", institutionService.findById(id));
        return null;
    }


}
