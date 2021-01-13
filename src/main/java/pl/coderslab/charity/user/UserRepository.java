package pl.coderslab.charity.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.role.Role;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;

@Repository
interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    List<User> findByRoles(HashSet<Role> roles);

    List<User> findAllByOrderByIdAsc();
}
