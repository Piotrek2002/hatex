package pl.hatex.hatex.services;

import pl.hatex.hatex.entity.User;


public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);

    void deleteUserById(Long id);
}