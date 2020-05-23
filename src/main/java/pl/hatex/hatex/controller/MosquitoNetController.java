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
            mosquitoNetService.saveMosquitoNet(mosquitoNet, orderId);
            return "redirect:/order/details/" + orderId;
        }
        return "customer-add";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        long orderId=mosquitoNetRepository.findById(id).getOrder().getId();
        mosquitoNetService.deleteMosquitoNet(id, orderId);
        return "redirect:/order/details/"+orderId;
    }
    @GetMapping("/update/{id}")
    public String update(@PathVariable long id, Model model) {
        model.addAttribute("mosquitoNet",mosquitoNetRepository.findById(id));
        return "mosquitoNet-update";
    }
    @PostMapping("/update/{id}")
    public String update(@ModelAttribute @Validated MosquitoNet mosquitoNet, BindingResult bindingResult,@PathVariable long id) {
        if (!bindingResult.hasErrors()) {
            mosquitoNetService.saveMosquitoNet(mosquitoNet, mosquitoNetRepository.findById(id).getOrder().getId());
            return "redirect:/order/details/" + mosquitoNetRepository.findById(id).getOrder().getId();
        }
        return "mosquitoNet-update";
    }
}
