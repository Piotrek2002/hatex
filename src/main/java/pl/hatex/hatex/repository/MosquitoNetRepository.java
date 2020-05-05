package pl.hatex.hatex.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.hatex.hatex.entity.MosquitoNet;
import pl.hatex.hatex.entity.Order;

import java.util.List;

public interface MosquitoNetRepository extends JpaRepository<MosquitoNet, Long> {
    @Query("select m from MosquitoNet m where m.order.id=?1")
    List<MosquitoNet> findAllByOrderId(long id);
}
