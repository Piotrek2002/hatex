package pl.hatex.hatex.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")

public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private CompanyBranch companyBranch;
    @OneToMany(mappedBy = "order", cascade = CascadeType.REMOVE)
    private List<MosquitoNet> mosquitoNets=new ArrayList<>();

    @Column(nullable = false)
    private String created;
    @Column(nullable = false)
    private String updated;
    @Column(nullable = false)
    private int progress;

    public Order() {
    }

    public long getId() {
        return id;
    }

    public void setId(long order_id) {
        this.id = order_id;
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

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

}
