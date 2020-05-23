package pl.hatex.hatex.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.entity.Order;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer,Long> {
    @Query("select o from Customer o where o.id=?1")
    Customer findCustomerById(long id);

}
