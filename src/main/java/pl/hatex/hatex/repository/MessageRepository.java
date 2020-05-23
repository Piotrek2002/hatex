package pl.hatex.hatex.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.entity.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message,Long> {
    @Query("select o from Message o where (o.sender.id=?1 and o.recipient.id=?2) or (o.sender.id=?2 and o.recipient.id=?1)")
    List<Message> findMessageBySenderIRecipientId(long senderId,long recipientId);
}
