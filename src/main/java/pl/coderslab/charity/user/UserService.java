package pl.coderslab.charity.user;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    void saveUser(User user);

    User findById(Long id);

    void updateUser(User user);

    void delete(Long userId);

    void deactivateUser(Long id);

    List<User> findAll();

    void addNewAdmin(User admin);

    List<User> findAllAdmins();

    List<User> findAllUsers();

    void adminUpdateUser(User user);

    void deactivateAdmin(User user);

    List<User> allUsers();

    void giveAdminPermission(String userId);
}
