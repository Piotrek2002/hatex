package pl.hatex.hatex.entity;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "company_branches")
public class CompanyBranch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, unique = true)
    @NotEmpty
    private String city;
    @OneToMany(mappedBy = "companyBranch", cascade = CascadeType.REMOVE)
    private List<Order> orders=new ArrayList<>();

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

    @Override
    public String toString() {
        return "CompanyBranch{" +
                "id=" + id +
                ", city='" + city + '\'' +
                ", orders=" + orders +
                '}';
    }
}
