package pl.hatex.hatex.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.hatex.hatex.entity.CompanyBranch;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.entity.Role;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query("select o from Order o where o.id=?1")
    Order findOrderById(long id);
    @Query("select o from Order o where o.progress=1")
    List<Order> findCompletedOrder();
    @Query("select o from Order o where o.progress=0 order by o.created")
    List<Order> findOrderToComplete();
    @Query("select o from Order o order by o.created desc ")
    List<Order> findOrdersDesc();
    @Query("select o from Order o where o.customer.id=?1 order by o.created desc")
    List<Order> findAllByCustomerId(long id);
    @Query("select o from Order o where o.progress=1 order by o.created")
    List<Order> findOrdersToPay();

}
