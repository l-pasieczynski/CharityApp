package pl.coderslab.charity.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Password {

    private String currentPassword;
    private String newPassword;
    private String retypePassword;

}
