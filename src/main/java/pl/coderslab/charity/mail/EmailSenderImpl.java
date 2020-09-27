package pl.coderslab.charity.mail;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
class EmailSenderImpl implements EmailSender {

    private final JavaMailSender javaMailSender;

    public EmailSenderImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void sendEmail(String to, String subject, String message) {

        MimeMessage mail = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            helper.setTo(to);
            helper.setReplyTo("noreply@charity.pl");
            helper.setSubject(subject);
            helper.setFrom("charity.pl");
            helper.setText(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        javaMailSender.send(mail);

    }
}
