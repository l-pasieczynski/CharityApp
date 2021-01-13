package pl.coderslab.charity.institution;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public void saveInstitution(Institution institution) {
        institutionRepository.save(institution);
    }

    public Institution findById(Long id) {
        return institutionRepository.getOne(id);
    }

    public void deleteInstitution(Long id) {
        institutionRepository.delete(institutionRepository.getOne(id));
    }
}
