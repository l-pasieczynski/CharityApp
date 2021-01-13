package pl.coderslab.charity.mail;

public interface EmailSender {

    void sendEmail(String to, String subject, String message);
}
