package pl.hatex.hatex.models;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "user")

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotEmpty
    @Column(unique = true)
    private String login;
    @NotEmpty
    private String password;
    @NotEmpty
    private long access;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getAccess() {
        return access;
    }

    public void setAccess(long access) {
        this.access = access;
    }
}
