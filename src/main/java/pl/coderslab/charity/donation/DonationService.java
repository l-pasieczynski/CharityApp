package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;

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
        donationRepository.save(donation);
    }
}
