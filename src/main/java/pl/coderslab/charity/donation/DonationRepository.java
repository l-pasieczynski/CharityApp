package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.user.User;

import java.util.List;

@Repository
interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT SUM(d.quantity) FROM Donation d")
    Integer findAllBagsQuantity();

    @Query("SELECT SUM(d.quantity) FROM Donation d WHERE d.user = ?1")
    Integer findAllUserBagsQuantity(User user);

    List<Donation> findAllByUserIdOrderByIdDesc(Long userId);

    Integer countAllByUser(User user);

    Donation findTopByUserOrderByIdDesc(User user);
}
