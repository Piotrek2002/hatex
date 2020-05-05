package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.repository.UserRepository;
import pl.hatex.hatex.services.CustomerService;
import pl.hatex.hatex.services.OrderService;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerService customerService;
    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final OrderService orderService;

    public CustomerController(CustomerService customerService, CustomerRepository customerRepository, OrderRepository orderRepository, UserRepository userRepository, OrderService orderService) {
        this.customerService = customerService;
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.orderService = orderService;
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("customer", new Customer());
        return "customer-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute @Validated Customer customer, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            customerService.saveCustomer(customer);
            return "redirect:/customer/list";
        }
        return "customer-add";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Customer> customers = customerRepository.findAll();
        model.addAttribute("customers", customers);
        return "customer-list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        customerService.deleteCustomer(id);
        return "redirect:/customer/list";
    }
    @GetMapping("/details/{id}")
    public String details(Model model, @PathVariable long id){
        model.addAttribute("customer",customerRepository.findCustomerById(id));
        model.addAttribute("orders",orderRepository.findAllByCustomerId(id));
        return "customer-details";
    }
    @GetMapping("order/add/{id}")
    public String add(@AuthenticationPrincipal UserDetails customUser, @PathVariable long id) {
        Order order=new Order();
            order.setCompanyBranch(userRepository.findByUsername(customUser.getUsername()).getCompanyBranch());
            order.setCustomer(customerRepository.findCustomerById(id));
            orderService.saveOrder(order);
            return "redirect:/order/details/" + order.getId();


    }
}
