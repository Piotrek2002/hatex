package pl.hatex.hatex.services.Impl;

import org.springframework.stereotype.Service;
import pl.hatex.hatex.entity.MosquitoNet;
import pl.hatex.hatex.repository.MosquitoNetRepository;
import pl.hatex.hatex.services.MosquitoNetService;

@Service
public class MosquitoNetServiceImpl implements MosquitoNetService {

    private final MosquitoNetRepository mosquitoNetRepository;

    public MosquitoNetServiceImpl(MosquitoNetRepository mosquitoNetRepository) {
        this.mosquitoNetRepository = mosquitoNetRepository;
    }

    @Override
    public void saveMosquitoNet(MosquitoNet mosquitoNet) {
        String color = mosquitoNet.getColor();
        if (color.equals("biały") || color.equals("brązowy") || color.equals("antracyt")) {
            double price = mosquitoNet.getCount() * 27 * (2 * mosquitoNet.getHeight() + 2 * mosquitoNet.getLength());
            mosquitoNet.setPrice(price / 1000);
        } else {
            double price = mosquitoNet.getCount() * 30 * (2 * mosquitoNet.getHeight() + 2 * mosquitoNet.getLength());
            mosquitoNet.setPrice(price / 1000);
        }
        mosquitoNetRepository.save(mosquitoNet);
    }

    @Override
    public void deleteMosquitoNet(long id) {
        mosquitoNetRepository.deleteById(id);
    }
}
