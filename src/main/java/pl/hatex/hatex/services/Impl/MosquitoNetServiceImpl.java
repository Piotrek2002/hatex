package pl.hatex.hatex.services.Impl;

import org.springframework.stereotype.Service;
import pl.hatex.hatex.entity.MosquitoNet;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.MosquitoNetRepository;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.services.MosquitoNetService;
import pl.hatex.hatex.services.OrderService;

import java.util.Iterator;

@Service
public class MosquitoNetServiceImpl implements MosquitoNetService {

    private final MosquitoNetRepository mosquitoNetRepository;
    private final OrderRepository orderRepository;
    private final OrderService orderService;

    public MosquitoNetServiceImpl(MosquitoNetRepository mosquitoNetRepository, OrderRepository orderRepository, OrderService orderService) {
        this.mosquitoNetRepository = mosquitoNetRepository;
        this.orderRepository = orderRepository;
        this.orderService = orderService;
    }

    @Override
    public void saveMosquitoNet(MosquitoNet mosquitoNet, long orderId) {
        String color = mosquitoNet.getColor();
        Order order=orderRepository.findOrderById(orderId);
        mosquitoNet.setOrder(order);
        if (color.equals("biały") || color.equals("brązowy") || color.equals("antracyt")) {
            double price = mosquitoNet.getCount() * 27 * (2 * mosquitoNet.getHeight() + 2 * mosquitoNet.getLength());
            mosquitoNet.setPrice(price / 1000);
        } else {
            double price = mosquitoNet.getCount() * 30 * (2 * mosquitoNet.getHeight() + 2 * mosquitoNet.getLength());
            mosquitoNet.setPrice(price / 1000);
        }
        mosquitoNetRepository.save(mosquitoNet);
        orderService.setPrice(order);


    }

    @Override
    public void deleteMosquitoNet(long id, long orderId) {
        mosquitoNetRepository.deleteById(id);
        Order order=orderRepository.findOrderById(orderId);
        orderService.setPrice(order);

    }
}
