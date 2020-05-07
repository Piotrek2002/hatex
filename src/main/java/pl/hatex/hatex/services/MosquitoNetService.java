package pl.hatex.hatex.services;

import pl.hatex.hatex.entity.MosquitoNet;

public interface MosquitoNetService {
    void saveMosquitoNet(MosquitoNet mosquitoNet, long orderId);
    void deleteMosquitoNet(long id,long orderId);
}
