package pl.hatex.hatex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.hatex.hatex.entity.MosquitoNet;
import pl.hatex.hatex.repository.MosquitoNetRepository;
import pl.hatex.hatex.repository.OrderRepository;
import pl.hatex.hatex.services.MosquitoNetService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/mosquitoNet")
public class MosquitoNetController {
    private final OrderRepository orderRepository;
    private final MosquitoNetService mosquitoNetService;
    private final MosquitoNetRepository mosquitoNetRepository;

    public MosquitoNetController(OrderRepository orderRepository, MosquitoNetService mosquitoNetService, MosquitoNetRepository mosquitoNetRepository) {
        this.orderRepository = orderRepository;
        this.mosquitoNetService = mosquitoNetService;
        this.mosquitoNetRepository = mosquitoNetRepository;
    }

    @ModelAttribute("colors")
    public List<String> colors() {
        List<String> colors = new ArrayList<>();
        colors.add("brązowy");
        colors.add("biały");
        colors.add("antracyt");
        return colors;
    }

    @GetMapping("/add/{orderId}")
    public String add(Model model) {
        model.addAttribute("mosquitoNet", new MosquitoNet());
        return "mosquitoNet-add";
    }

    @PostMapping("/add/{orderId}")
    public String add(@ModelAttribute @Validated MosquitoNet mosquitoNet, BindingResult bindingResult,@PathVariable long orderId) {
        if (!bindingResult.hasErrors()) {
            mosquitoNet.setOrder(orderRepository.findOrderById(orderId));
            mosquitoNetService.saveMosquitoNet(mosquitoNet);
            return "redirect:/order/details/" + orderId;
        }
        return "customer-add";
    }
    @GetMapping("/delete/{id}/{orderId}")
    public String delete(@PathVariable long id,@PathVariable long orderId) {
        mosquitoNetService.deleteMosquitoNet(id);
        return "redirect:/order/details/"+orderId;
    }

}
