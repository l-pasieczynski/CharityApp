package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;

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

    public Integer donationQuantity() {
       return donationRepository.findAllDonationCount();
    }
}
