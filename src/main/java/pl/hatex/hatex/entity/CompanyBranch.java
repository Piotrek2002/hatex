package pl.hatex.hatex.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "company_branches")
public class CompanyBranch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String city;
    @OneToMany(mappedBy = "companyBranch")
    private List<Order> orders=new ArrayList<>();
    @OneToMany
    private List<Customer> customers=new ArrayList<>();

    public CompanyBranch() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    @Override
    public String toString() {
        return "CompanyBranch{" +
                "id=" + id +
                ", city='" + city + '\'' +
                ", orders=" + orders +
                ", customers=" + customers +
                '}';
    }
}
