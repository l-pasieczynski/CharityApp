package pl.coderslab.charity.user;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.role.Role;
import pl.coderslab.charity.role.RoleRepository;

import javax.persistence.EntityNotFoundException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

@Service
class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setActive(true);
        Role userRole = roleRepository.findByName("USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public User findById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.orElseThrow(EntityNotFoundException::new);
//        return userRepository.getOne(id);
    }

    @Override
    public void updateUser(User user) {
        User userToUpdate = userRepository.getOne(user.getId());
        userToUpdate.setUsername(user.getUsername());
        userToUpdate.setEmail(user.getEmail());
        userRepository.save(userToUpdate);
    }

    @Override
    public void delete(Long userId) {
        User userToDelete = findById(userId);
        userRepository.delete(userToDelete);
    }

    @Override
    public void deactivateUser(Long id) {
        User user = findById(id);
        if (user.isActive()) {
            user.setActive(false);
        } else {
            user.setActive(true);
        }
        userRepository.save(user);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void addNewAdmin(User admin) {
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));
        admin.setActive(true);
        Role userRole = roleRepository.findByName("ADMIN");
        admin.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(admin);
    }

    @Override
    public List<User> findAllAdmins() {
        HashSet<Role> roles = new HashSet<>(Arrays.asList(roleRepository.findByName("ADMIN")));
        return userRepository.findByRoles(roles);
    }

    @Override
    public List<User> allUsers() {
        HashSet<Role> roles = new HashSet<>(Arrays.asList(roleRepository.findByName("USER")));
        return userRepository.findByRoles(roles);
    }

    @Override
    public void giveAdminPermission(String userId) {

    }

    @Override
    public List<User> findAllUsers() {
        return userRepository.findAllByOrderByIdAsc();
    }

    @Override
    public void adminUpdateUser(User user) {
        User one = userRepository.getOne(user.getId());
        one.setUsername(user.getUsername());
        one.setEmail(user.getEmail());
        one.setActive(user.isActive());
        userRepository.save(one);
    }

    @Override
    public void deactivateAdmin(User user) {
        User admin = findById(user.getId());
        HashSet<Role> userRole = new HashSet<>(Arrays.asList(roleRepository.findByName("USER")));
        admin.setRoles(userRole);
        userRepository.save(admin);
    }
}
