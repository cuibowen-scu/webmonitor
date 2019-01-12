package edu.scdx.service;

import edu.scdx.entity.ServerPerformance;
import edu.scdx.entity.UserProjectBean;

import java.util.List;

public interface ServerService {
    List<ServerPerformance> getServerState(String projectId, UserProjectBean project, int size);
}
