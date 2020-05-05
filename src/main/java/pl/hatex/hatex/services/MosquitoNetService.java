package pl.hatex.hatex.services;

import pl.hatex.hatex.entity.MosquitoNet;

public interface MosquitoNetService {
    void saveMosquitoNet(MosquitoNet mosquitoNet);
    void deleteMosquitoNet(long id);
}
