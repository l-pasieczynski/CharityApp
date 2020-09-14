package pl.coderslab.charity.institution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface InstitutionRepository extends JpaRepository<Institution, Long> {
}
