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

    @Query("select o from Order o where o.progress=0")
    List<Order> findOrdersValuation();

    @Query("select o from Order o where o.progress=2")
    List<Order> findCompletedOrder();

    @Query("select o from Order o where o.progress=1 order by o.created")
    List<Order> findOrderToComplete();

    @Query("select o from Order o order by o.created desc ")
    List<Order> findOrdersDesc();

    @Query("select o from Order o where o.customer.id=?1 order by o.created desc")
    List<Order> findAllByCustomerId(long id);

    @Query("select o from Order o where o.progress=2 order by o.created")
    List<Order> findOrdersToPay();

    @Query("select o from Order o where o.done=0 and o.mosquitoNets is not empty ")
    List<Order> findOrderToDone();

    @Query("select o from Order o where o.progress=1 and o.companyBranch.id=?1 order by o.created")
    List<Order> findOrderToCompleteInBranch(long id);

    @Query("select o from Order o where o.progress=2 and o.companyBranch.id=?1 order by o.created")
    List<Order> findOrdersToPayInBranch(long id);

}
