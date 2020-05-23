package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.repository.MosquitoNetRepository;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.OrderService;

import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {

    private final CustomerRepository customerRepository;
    private final OrderService orderService;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final MosquitoNetRepository mosquitoNetRepository;

    public OrderController(CustomerRepository customerRepository, OrderService orderService, UserRepository userRepository, OrderRepository orderRepository, MosquitoNetRepository mosquitoNetRepository) {
        this.customerRepository = customerRepository;
        this.orderService = orderService;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.mosquitoNetRepository = mosquitoNetRepository;
    }

    @ModelAttribute("customers")
    public List<Customer> customers() {
        return customerRepository.findAll();
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("order", new Order());
        return "order-add";
    }

    @GetMapping("/add/{id}")
    public String add(@PathVariable long id, @AuthenticationPrincipal UserDetails customUser) {
        Order order=new Order();
            order.setCompanyBranch(userRepository.findByUsername(customUser.getUsername()).getCompanyBranch());
            order.setCustomer(customerRepository.findCustomerById(id));
            orderService.saveOrder(order);
            return "redirect:/order/details/" + order.getId();

    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Order> orders = orderRepository.findOrdersDesc();
        model.addAttribute("orders", orders);
        return "order-list";
    }

    @GetMapping("/listToComplete")
    public String listToComplete(Model model) {
        List<Order> orders = orderRepository.findOrderToComplete();
        model.addAttribute("orders", orders);
        return "order-list";
    }

    @GetMapping("/listValuations")
    public String listValuations(Model model) {
        List<Order> orders = orderRepository.findOrdersValuation();
        model.addAttribute("orders", orders);
        return "order-list";
    }

    @GetMapping("/listToPay")
    public String listToPay(Model model) {
        List<Order> orders = orderRepository.findOrdersToPay();
        model.addAttribute("orders", orders);
        return "order-list";
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable long id, Model model,@AuthenticationPrincipal UserDetails customUser) {
        model.addAttribute("id", id);
        model.addAttribute("mosquitoNets", mosquitoNetRepository.findAllByOrderId(id));
        Order order = orderRepository.findOrderById(id);
        model.addAttribute("order", order);
        double toPay = order.getPrice() - order.getPayment();
        model.addAttribute("toPay", toPay);

        return "order-details";
    }

    @GetMapping("/completed/{id}")
    public String completed(@PathVariable long id) {
        Order order = orderRepository.findOrderById(id);
        order.setProgress(2);
        order.setDone(1);
        orderService.update(order);
        return "redirect:/order/details/" + id;
    }

    @GetMapping("/paid/{id}")
    public String paid(@PathVariable long id) {
        Order order = orderRepository.findOrderById(id);
        order.setProgress(3);
        order.setPayment(order.getPrice());
        orderService.update(order);
        return "redirect:/order/details/" + id;
    }
    @GetMapping("/realization/{id}")
    public String realization(@PathVariable long id) {
        Order order = orderRepository.findOrderById(id);
        order.setProgress(1);
        order.setDone(0);
        orderService.update(order);
        return "redirect:/order/details/" + id;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        long customerId = orderRepository.findOrderById(id).getCustomer().getId();
        orderService.deleteOrder(id);
        return "redirect:/customer/details/" + customerId;
    }


    @GetMapping(value = "/payment/{orderId}")
    public String payment(@RequestParam double payment, @PathVariable long orderId) {
        orderService.setPayment(orderId, payment);
        return "redirect:/order/details/" + orderId;
    }


}
