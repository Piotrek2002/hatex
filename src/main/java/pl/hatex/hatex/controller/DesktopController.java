package pl.hatex.hatex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.repository.OrderRepository;

import java.util.List;

@Controller
@RequestMapping("/desktop")
public class DesktopController {
    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;

    public DesktopController(CustomerRepository customerRepository, OrderRepository orderRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
    }

    @GetMapping()
    public String desktop() {
        return "desktop";
    }

    @ModelAttribute("countCustomer")
    public int countCustomer() {
        return customerRepository.findAll().size();
    }

    @ModelAttribute("countCompletedOrders")
    public int countCompletedOrders() {
        return orderRepository.findCompletedOrder().size();
    }

    @ModelAttribute("countOrdersToComplete")
    public int countOrdersToComplete() {
        return orderRepository.findOrderToComplete().size();
    }
    @ModelAttribute("ordersToComplete")
    public List<Order> ordersToComplete(){
        return orderRepository.findOrderToComplete();
    }
    @ModelAttribute("ordersToPay")
    public List<Order> ordersToPay(){
        return orderRepository.findOrdersToPay();
    }
}
