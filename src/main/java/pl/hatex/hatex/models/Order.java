package pl.hatex.hatex.models;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")

public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int order_id;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private CompanyBranch companyBranch;
    @OneToMany(mappedBy = "order")
    private List<MosquitoNet> mosquitoNets=new ArrayList<>();

    @Column(nullable = false)
    private String created;
    @Column(nullable = false)
    private String updated;

    public Order() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getUpdated() {
        return updated;
    }

    public void setUpdated(String updated) {
        this.updated = updated;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public CompanyBranch getCompanyBranch() {
        return companyBranch;
    }

    public void setCompanyBranch(CompanyBranch companyBranch) {
        this.companyBranch = companyBranch;
    }

    public List<MosquitoNet> getMosquitoNets() {
        return mosquitoNets;
    }

    public void setMosquitoNets(List<MosquitoNet> mosquitoNets) {
        this.mosquitoNets = mosquitoNets;
    }
}
