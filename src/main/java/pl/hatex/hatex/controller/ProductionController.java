package pl.hatex.hatex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.services.OrderService;

@Controller
@RequestMapping("/production")
public class ProductionController {
    private final OrderRepository orderRepository;
    private final OrderService orderService;

    public ProductionController(OrderRepository orderRepository, OrderService orderService) {
        this.orderRepository = orderRepository;
        this.orderService = orderService;
    }

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("orders",orderRepository.findOrderToDone());
        return "production-list";
    }
    @GetMapping("/details/{id}")
    public String details(Model model, @PathVariable long id){
        model.addAttribute("mosquitoNets",orderRepository.findOrderById(id).getMosquitoNets());
        model.addAttribute("order",orderRepository.findOrderById(id));
        return "production-details";
    }
    @GetMapping("/done/{id}")
    public String completed(@PathVariable long id) {
        Order order = orderRepository.findOrderById(id);
        order.setDone(1);
        orderService.update(order);
        return "redirect:/production/list";
    }
}
