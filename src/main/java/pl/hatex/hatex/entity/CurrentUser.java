package pl.hatex.hatex.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
public class CurrentUser extends User {
    private final pl.hatex.hatex.entity.User user;
    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       pl.hatex.hatex.entity.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public pl.hatex.hatex.entity.User getUser() {return user;}
}
