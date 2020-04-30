package pl.hatex.hatex.services.Impl;

import org.springframework.stereotype.Service;
import pl.hatex.hatex.entity.Customer;
import pl.hatex.hatex.repository.CustomerRepository;
import pl.hatex.hatex.services.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerServiceImpl(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }


    @Override
    public void saveCustomer(Customer customer) {
        customerRepository.save(customer);
    }
}
