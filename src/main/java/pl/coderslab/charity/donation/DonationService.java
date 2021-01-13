package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.user.User;

import java.time.LocalDate;
import java.util.List;

@Service
public class DonationService {

    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Integer bagsQuantity() {
        return donationRepository.findAllBagsQuantity();
    }

    public Long donationQuantity() {
       return donationRepository.count();
    }

    public void saveDonation(Donation donation) {
        donation.setStatus(false);
        donationRepository.save(donation);
    }

    public List<Donation> findDonationByUser(Long userId) {
        return donationRepository.findAllByUserIdOrderByIdDesc(userId);
    }

    public Integer getAllUserBags(User user) {
        return donationRepository.findAllUserBagsQuantity(user);
    }

    public Integer getAllUserDonationCount(User user) {
        return donationRepository.countAllByUser(user);
    }

    public Donation getUserLastDonation(User user) {
        return donationRepository.findTopByUserOrderByIdDesc(user);
    }

    public Donation findDonationById(Long id) {
        return donationRepository.getOne(id);
    }

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    public void confirmPickUp(Long id) {
        Donation donation = findDonationById(id);
        donation.setStatus(true);
        donation.setStatusChangedDate(LocalDate.now());
        donationRepository.save(donation);
    }
}
