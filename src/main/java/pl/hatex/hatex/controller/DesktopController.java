package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.hatex.hatex.entity.CompanyBranch;
import pl.hatex.hatex.entity.Order;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.repository.UserRepository;

import java.util.List;

@Controller
@RequestMapping("/desktop")
public class DesktopController {
    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public DesktopController(CustomerRepository customerRepository, OrderRepository orderRepository, UserRepository userRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
    }

    @GetMapping()
    public String desktop() {
        return "dashboard";
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
    public List<Order> ordersToComplete(@AuthenticationPrincipal UserDetails customUser){
        CompanyBranch companyBranch=userRepository.findByUsername(customUser.getUsername()).getCompanyBranch();
        if (companyBranch.getCity().equals("Admin")){
            return orderRepository.findOrderToComplete();
        }else {
            return orderRepository.findOrderToCompleteInBranch(companyBranch.getId());
        }

    }
    @ModelAttribute("ordersToPay")
    public List<Order> ordersToPay(@AuthenticationPrincipal UserDetails customUser){
        CompanyBranch companyBranch=userRepository.findByUsername(customUser.getUsername()).getCompanyBranch();
        if (companyBranch.getCity().equals("Admin")){
            return orderRepository.findOrdersToPay();
        }else {
            return orderRepository.findOrdersToPayInBranch(companyBranch.getId());
        }

    }
}
