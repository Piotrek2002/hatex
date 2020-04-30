package pl.hatex.hatex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.services.CustomerService;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerService customerService;
    private final CustomerRepository customerRepository;

    public CustomerController(CustomerService customerService, CustomerRepository customerRepository) {
        this.customerService = customerService;
        this.customerRepository = customerRepository;
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
        List<Customer> customers=customerRepository.findAll();
        model.addAttribute("customers",customers);
        return "customer-list";
    }
}
