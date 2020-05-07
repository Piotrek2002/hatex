package pl.hatex.hatex.services;

import pl.hatex.hatex.entity.Order;

public interface OrderService {
    void saveOrder(Order order);
    void update(Order order);
    void deleteOrder(long id);
    void setPrice(Order order);
}
