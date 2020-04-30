package pl.hatex.hatex.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.entity.Role;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
