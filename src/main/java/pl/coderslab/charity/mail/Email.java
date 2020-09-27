package pl.coderslab.charity.mail;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@RequiredArgsConstructor
public class Email {

    private String header;
    private String title;
    private String userEmailAddress;
    private String subject;
    private String message;


}