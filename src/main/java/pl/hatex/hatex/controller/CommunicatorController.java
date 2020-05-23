package pl.hatex.hatex.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.hatex.hatex.entity.Message;
import pl.hatex.hatex.repository.MessageRepository;
import pl.hatex.hatex.repository.UserRepository;

import java.util.List;

@Controller
@RequestMapping("/communicator")
public class CommunicatorController {
    private final UserRepository userRepository;
    private final MessageRepository messageRepository;

    public CommunicatorController(UserRepository userRepository, MessageRepository messageRepository) {
        this.userRepository = userRepository;
        this.messageRepository = messageRepository;
    }

    @GetMapping
    public String communicator(Model model){
        model.addAttribute("users",userRepository.findAll());
        return "communicator";
    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable long id,Model model,@AuthenticationPrincipal UserDetails customUser){
        model.addAttribute("user",userRepository.findUserById(id));
        String username= customUser.getUsername();
        long id1=userRepository.findByUsername(username).getId();
        List<Message> messages=messageRepository.findMessageBySenderIRecipientId(id,id1);
        model.addAttribute("message",messages);
        return "communicator-details";
    }

}
