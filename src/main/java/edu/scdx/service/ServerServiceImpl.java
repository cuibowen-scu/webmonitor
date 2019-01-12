package edu.scdx.service;

import edu.scdx.dao.ServerMapper;
import edu.scdx.entity.ServerPerformance;
import edu.scdx.entity.UserProjectBean;
import edu.scdx.util.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServerServiceImpl implements ServerService {

    @Autowired
    private ServerMapper serverMapper;

    public ServerMapper getServerMapper() {
        return serverMapper;
    }

    public void setServerMapper(ServerMapper serverMapper) {
        this.serverMapper = serverMapper;
    }

    @Override
    public List<ServerPerformance> getServerState(String projectId, UserProjectBean project, int size) {
        return DBUtil.getServerState(projectId, project, size);
    }
}
