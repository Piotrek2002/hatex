package pl.hatex.hatex.entity;

import javax.persistence.*;

@Entity
@Table(name = "mosquito_net")

public class MosquitoNet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private double height;
    @Column(nullable = false)
    private double length;
    @Column(nullable = false)
    private String color;
    @Column(nullable = false)
    private int status;
    @Column(nullable = false)
    private double size;
    @Column(nullable = false)
    private int count;
    @ManyToOne
    private Order order;

    public MosquitoNet() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
