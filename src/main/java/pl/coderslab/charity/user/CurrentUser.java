package pl.coderslab.charity.user;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Set;

public class CurrentUser extends org.springframework.security.core.userdetails.User {

    private final User user;

    public CurrentUser(String username, String password, Collection<? extends  GrantedAuthority> authorities, User user) {
        super(username, password, authorities);
        this.user = user;
    }

    public User getUser(){
        return user;
    }
}
