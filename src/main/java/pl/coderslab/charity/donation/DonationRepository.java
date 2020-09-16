package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT COUNT(d) FROM Donation d")
    Integer findAllDonationCount();

    @Query("SELECT SUM(d.quantity) FROM Donation d")
    Integer findAllBagsQuantity();

}
